//
//  ContactEntry.swift
//  ContactDayDemo
//
//  Created by HEESU SHIN on 2017. 3. 8..
//  Copyright © 2017년 HEESU SHIN-ING. All rights reserved.
//

import UIKit
import AddressBook
import Contacts

class ContactEntry: NSObject {
    var name: String!
    var phone: String?
    var image: UIImage?
    var alarm: String?
    
    init(name: String, alarm: String?, phone: String?, image: UIImage?) {
        self.name = name
        self.alarm = alarm
        self.phone = phone
        self.image = image
}
    @available(iOS 9.0, *)
    init?(cnContact: CNContact) {
        // name
        if !cnContact.isKeyAvailable(CNContactGivenNameKey) && !cnContact.isKeyAvailable(CNContactFamilyNameKey) { return nil }
        self.name = (cnContact.givenName + " " + cnContact.familyName).trimmingCharacters(in: CharacterSet.whitespaces)
        // image
        self.image = (cnContact.isKeyAvailable(CNContactImageDataKey) && cnContact.imageDataAvailable) ? UIImage(data: cnContact.imageData!) : nil
        // alarm
        
        
        // phone
        if cnContact.isKeyAvailable(CNContactPhoneNumbersKey) {
            if cnContact.phoneNumbers.count > 0 {
                let phone = cnContact.phoneNumbers.first?.value
                self.phone = phone?.stringValue
            }
        }
    }
}

