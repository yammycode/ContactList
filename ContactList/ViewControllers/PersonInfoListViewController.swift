//
//  PersonInfoListViewController.swift
//  ContactList
//
//  Created by Anton Saltykov on 30.08.2022.
//

import UIKit

final class PersonInfoListViewController: UITableViewController {

    var persons: [Person] = []

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        persons[section].fullName
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personInfo", for: indexPath)
        var content = cell.defaultContentConfiguration()

        if indexPath.row == 0 {
            content.image = UIImage(systemName: "phone")
            content.text = persons[indexPath.section].phone
        } else {
            content.image = UIImage(systemName: "tray")
            content.text = persons[indexPath.section].email
        }

        cell.contentConfiguration = content

        return cell
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
