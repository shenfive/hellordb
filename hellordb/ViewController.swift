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
        


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dbRef.child("appdefult/name").observe(.value) { (sanpshot) in
            self.pageTitle.text = sanpshot.value as? String
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dbRef.child("appdefult/name").removeAllObservers()
    }
    
    
    @IBAction func enter(_ sender: Any) {
        let string = input.text ?? ""
        let dic:[String:Any?] = ["text":string,
                                 "timestamp":ServerValue.timestamp()]
        dbRef.child("table").childByAutoId().setValue(dic)
    }

    @IBAction func theDelete(_ sender: Any) {
        dbRef.child("table").removeValue()
    }
}

