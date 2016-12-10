//
//  AuthService.swift
//  chat-App
//
//  Created by Patrick Robertson on 10/12/16.
//  Copyright © 2016 Patrick Robertson. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    var username: String?
    var isLoggedIn = false
    
    func emailLogin(_ email: String, password: String, completion: @escaping (_ Success: Bool, _ message: String) -> Void) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {
            (user, error) in
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: (error?._code)!) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                completion(false, "Error creating account")
                            } else {
                                completion(true, "Successfully created account")
                            }
                        })
                    } else {
                        completion(false, "Sorry, incorrect email or password")
                    }
                }
            } else {
                completion(true, "Successfully logged in")
            }
        })
    }
}
