//
//  ContactsTableViewController.swift
//  Contacts-demo
//
//  Created by Nikolas Burk on 15/10/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

@objc protocol ContactsTableViewControllerDelegate{
    func getNewUser() -> String
}


class ContactsTableViewController: UITableViewController {
    
    var closuer : ( ()-> String)?
    var contacts: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
    }
    
    weak var delegate : ContactsTableViewControllerDelegate?
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].name
        return cell
    }
    
    
    // MARK: Navigation
    
    @IBAction func cancel(segue: UIStoryboardSegue) {
        
    }
    
    func subscribe() {
        let notificationName: NSNotification.Name = NSNotification.Name(rawValue: "addContact")
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ContactsTableViewController.receive(notification:)),
                                               name: notificationName,
                                               object: nil)
    }
    
    func unsubscribe() {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc func receive(notification: Notification) {
        let payload = notification.userInfo! as! [String:String]
        contacts.append(Person(name: payload["name"]!))
        tableView.reloadData()
    }

    
    @IBAction func save(segue: UIStoryboardSegue) {
//        ******************NOTIFICATION CODE******************
        let dest = segue.source as! AddContactViewController
        dest.send()
        
        
//        ******************CLOSUER CODE******************
//        let dest = segue.source as! AddContactViewController
//        closuer = dest.getNewUser
//        contacts.append(Person(name: self.closuer!()))
//        tableView.reloadData()
        
        
//        ******************DELEGATE CODE******************
//        self.delegate = segue.source as! AddContactViewController
//        contacts.append(Person(name: (delegate?.getNewUser())!))
//        tableView.reloadData()
    }
}
