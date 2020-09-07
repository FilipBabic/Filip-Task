//
//  Task.swift
//  Filip Task
//
//  Created by Filip Babic on 06/09/2020.
//  Copyright © 2020 filipbabic. All rights reserved.
//

import UIKit

struct TaskModel {
    var id: Int
    var date: String
    var name: String
    var company: String
    var address: String
    var type: String
    var key: String
    var notes: [NoteModel]
    
    init(id: Int, date:String, name:String, company:String, address:String, type:String, notes: [NoteModel], key:String) {
        self.id = id
        self.date = date
        self.name = name
        self.company = company
        self.address = address
        self.type = type
        self.notes = notes
        self.key = key
    }
}
