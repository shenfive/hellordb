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

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var pageTitle: UILabel!
    var dbRef:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = Database.database().reference()
        print("=================")
        Auth.auth().signInAnonymously(completion: nil)
        
        var appNameRef = self.dbRef.child("appdefult/name")
        appNameRef.observeSingleEvent(of: .value) { (snapshot) in
            self.pageTitle.text = snapshot.value as? String
        }
    }
    @IBAction func enter(_ sender: Any) {
        let string = input.text ?? ""
        dbRef.child("test").setValue(string)
    }
}

