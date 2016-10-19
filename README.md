# Contacts - A Real-Life iOS Example

This project implements a common scenario that we often encounter in real life iOS development. We have a `UITableView` displaying a list of entities. In this case, the entities are of type `Person`, with only one property called `name`. 

The user of the app can add new persons to the `UITableView` by opening the `AddContactViewController` and provide a `name` for the new person.

We now want to understand the **information flow** that needs to take place when for adding a new person to the list. 

Here is your challenge: Implement the above mentioned requirement of adding a new `Person` to the list using the following three communication patterns:

1. Delegates
2. Closures
3. `NSNotificationCenter`# Contact-Information-Demo
