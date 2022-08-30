//
//  Person.swift
//  ContactList
//
//  Created by Anton Saltykov on 30.08.2022.
//

struct Person {
    let firstName: String
    let lastName: String
    let email: String
    let phone: String

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

extension Person {
    static func getPersons() -> [Person] {
        var persons: [Person] = []
        let personsData = DataManager()

        let lastNames = personsData.lastNames.shuffled()
        let emails = personsData.emails.shuffled()
        let phones = personsData.phones.shuffled()

        for (personIndex, firstName) in personsData.firstNames.shuffled().enumerated() {
            if personIndex >= lastNames.count ||
                personIndex >= phones.count ||
                personIndex >= emails.count {
                break
            }

            let person = Person(
                firstName: firstName,
                lastName: lastNames[personIndex],
                email: emails[personIndex],
                phone: phones[personIndex]
            )

            persons.append(person)
        }

        return persons.sorted { $0.firstName < $1.firstName }
    }
}
