//
//  DataService.swift
//  chat-App
//
//  Created by Patrick Robertson on 10/12/16.
//  Copyright © 2016 Patrick Robertson. All rights reserved.
//

import Foundation
import Firebase

protocol DataServiceDelegate: class {
    func dataLoaded()
}

class DataService {
    static let instance = DataService()
    
    let ref = FIRDatabase.database().reference()
    var messages: [Message] = []
    
    weak var delegate: DataServiceDelegate?
}
