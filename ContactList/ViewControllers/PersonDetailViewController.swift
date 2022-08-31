//
//  PersonDetailViewController.swift
//  ContactList
//
//  Created by Anton Saltykov on 30.08.2022.
//

import UIKit

final class PersonDetailViewController: UIViewController {
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = person.fullName
        emailLabel.text = person.email
        phoneLabel.text = person.phone
    }
}
