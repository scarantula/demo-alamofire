//
//  Posts.swift
//  demo-alamofire
//
//  Created by user205198 on 10/31/21.
//

import Foundation
import SwiftyJSON

struct TodoItem{
    var userID: Int
    var id: Int
    var title: String
    var completed: Bool
    
    init(json: JSON){
        userID = json["userID"].intValue
        id = json["id"].intValue
        title = json["title"].stringValue
        completed = json["completed"].boolValue
    }
}

struct TodoCellViewModel{
    var id: Int
    var title: String
    var completed: Bool
    
    init(with model: TodoItem){
        id = model.id
        title = model.title
        completed = model.completed
    }
}
