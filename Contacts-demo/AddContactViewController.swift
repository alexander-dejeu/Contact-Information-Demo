//
//  AddContactViewController.swift
//  Contacts-demo
//
//  Created by Nikolas Burk on 15/10/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit



class AddContactViewController: UIViewController, ContactsTableViewControllerDelegate {
  
  @IBOutlet weak var nameTextField: UITextField!
    
    func getNewUser() -> String {
        return nameTextField.text!
    }
    
    func send(){
        let notificationName: NSNotification.Name = NSNotification.Name(rawValue: "addContact")
        let payload = ["name": nameTextField.text!]
        
        NotificationCenter.default.post(name: notificationName, object: self, userInfo: payload)
    }

    
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}
