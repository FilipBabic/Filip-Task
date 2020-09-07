//
//  Note.swift
//  Filip Task
//
//  Created by Filip Babic on 06/09/2020.
//  Copyright © 2020 filipbabic. All rights reserved.
//

import UIKit
struct NoteModel {
    var id: NSNumber
    var noteContent: NSString
    
    init(id:NSNumber, noteContent:NSString) {
        self.id = id
        self.noteContent = noteContent
    }
}
