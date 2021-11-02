//
//  ViewController.swift
//  demo-alamofire
//
//  Created by user205198 on 10/29/21.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var todoArray = [TodoCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TodoCell", bundle: nil), forCellReuseIdentifier: "TodoCell")
        
        APIManager.singleton.callAPIRequest(url: "https://jsonplaceholder.typicode.com/todos") { responseJSON in
            self.jsonHandler(responseJSON)
        } errorCompletion: { error in
            print("Error occured whilemaking API request, \(error.localizedDescription)")
        }
    }
    
    func jsonHandler(_ json: JSON){
        for object in json{
            let todoItem = TodoItem(json: object.1)
            todoArray.append(TodoCellViewModel(with: todoItem))
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        cell.completedView.backgroundColor = todoArray[indexPath.row].completed ? UIColor.green : UIColor.red
        cell.titleLabel.text = todoArray[indexPath.row].title
        cell.idLabel.text = "\(todoArray[indexPath.row].id)"
        return cell
    }
}
