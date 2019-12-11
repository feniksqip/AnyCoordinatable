//
//  ContactsStorage.swift
//  Example
//
//  Created by Михаил Игонин on 10.12.2019.
//  Copyright © 2019 FrozenApps. All rights reserved.
//

import Foundation

public class ContactsStorage: ContactsStorageOutput {
    public init() { }

    private let contacts: [Contact] = [
        Contact(name: "Ma", picture: "🧑‍🦳", phone: "+7 123 233-12-23", notes: "", type: .family),
        Contact(name: "Dad", picture: "👴", phone: "+7 123 233-12-23", notes: "", type: .family),
        Contact(name: "Sister", picture: "👱‍♀️", phone: "+7 123 233-12-23", notes: "", type: .family),
        Contact(name: "Wife", picture: "👱‍♀️", phone: "+7 123 233-12-23", notes: "", type: .family),
        Contact(name: "Taddy", picture: "👶", phone: "+7 123 233-12-23", notes: "", type: .family),

        Contact(name: "Tim", picture: "🧑‍🦱", phone: "+7 123 233-12-23", notes: "", type: .coworker),
        Contact(name: "Sarnab", picture: "👨🏾‍🦱", phone: "+7 123 233-12-23", notes: "", type: .coworker),
        Contact(name: "Cindy", picture: "🧑🏿‍🦰", phone: "+7 123 233-12-23", notes: "", type: .coworker),

        Contact(name: "Randy", picture: "👩🏿‍🌾", phone: "+7 123 233-12-23", notes: "", type: .sport),
        Contact(name: "Dan", picture: "👳‍♂️", phone: "+7 123 233-12-23", notes: "", type: .sport),
        Contact(name: "Baker", picture: "🧑🏽‍🍳", phone: "+7 123 233-12-23", notes: "", type: .sport),

        Contact(name: "Dantist", picture: "👩🏻‍⚕️", phone: "+7 123 233-12-23", notes: "", type: .other),
        Contact(name: "Car service", picture: "🔧", phone: "+7 123 233-12-23", notes: "", type: .other),
    ]

    public func getContacts(filter: FilterSettings) -> [Contact] {
        if let types = filter.types, !types.isEmpty {
            return contacts.filter({types.contains($0.type)})
        } else {
            return contacts
        }
    }
}
