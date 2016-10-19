//
//  ContactsTableViewController.swift
//  Contacts-demo
//
//  Created by Nikolas Burk on 15/10/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
  
  var contacts: [Person] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  
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
  
  @IBAction func save(segue: UIStoryboardSegue) {
  }
  
  
}
