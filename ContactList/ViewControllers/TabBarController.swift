//
//  TabBarController.swift
//  ContactList
//
//  Created by Anton Saltykov on 30.08.2022.
//

import UIKit

final class TabBarController: UITabBarController {

    let persons = Person.getPersons()

    override func viewDidLoad() {
        super.viewDidLoad()
        sendPersonsToViews()
   }

}

extension TabBarController {
    private func sendPersonsToViews() {
        guard let viewControllers = viewControllers else { return }

        viewControllers.forEach {
            guard let navVC = $0 as? UINavigationController else { return }

            if let tableVC = navVC.topViewController as? PersonListViewController {
                tableVC.persons = persons
            } else if let tableVC = navVC.topViewController as? PersonInfoListViewController {
                tableVC.persons = persons
            }
        }
    }
}
