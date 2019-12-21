//
//  ViewController.swift
//  hellordb
//
//  Created by 申潤五 on 2019/12/21.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var dbRef:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = Database.database().reference()
        print("=================")
        Auth.auth().signInAnonymously { (result, error) in
            if error == nil{
                var appNameRef = self.dbRef.child("appdefult/name")
                appNameRef.observeSingleEvent(of: .value) { (snapshot) in
                    print(snapshot.value as! String)
                }
            }else{
                print(error?.localizedDescription)
            }
        }
    }


}

