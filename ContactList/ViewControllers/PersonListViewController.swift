//
//  PersonListViewController.swift
//  ContactList
//
//  Created by Anton Saltykov on 30.08.2022.
//

import UIKit

final class PersonListViewController: UITableViewController {

    var persons: [Person] = []

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = persons[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        cell.contentConfiguration = content

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personIndex = tableView.indexPathForSelectedRow?.row else { return }
        guard let personDetailVC = segue.destination as? PersonDetailViewController else { return }

        personDetailVC.person = persons[personIndex]
    }

}
