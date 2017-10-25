//
//  CreateContactViewController.swift
//  ContactDayDemo
//
//  Created by HEESU SHIN on 2017. 3. 8..
//  Copyright © 2017년 HEESU SHIN-ING. All rights reserved.
//

import UIKit
import Contacts
import AddressBook

enum ContactType {
    case addressBookContact
    case cnContact
}

class CreateContactViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // outlets
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var phoneNumberTextfield: UITextField!
    
    // data
    var type: ContactType?
    var contactImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contactImageView.layer.cornerRadius = contactImageView.frame.size.width / 2.0
        contactImageView.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @available(iOS 9.0, *)
    func createCNContactWithFirstName(_ firstName: String, lastName: String, phone: String?, image: UIImage?) {
        // create contact with mandatory values: first and last name
        let newContact = CNMutableContact()
        newContact.givenName = firstName
        newContact.familyName = lastName
        
        // phone
        if phone != nil {
            let contactPhone = CNLabeledValue(label: CNLabelHome, value: CNPhoneNumber(stringValue: phone!))
            newContact.phoneNumbers = [contactPhone]
        }
        
        // image
        if image != nil {
            newContact.imageData = UIImageJPEGRepresentation(image!, 0.9)
        }
        
        do {
            let newContactRequest = CNSaveRequest()
            newContactRequest.add(newContact, toContainerWithIdentifier: nil)
            try CNContactStore().execute(newContactRequest)
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        } catch {
            self.showAlertMessage("새로운 연락처를 추가하지 못했습니다.")
        }
    }
    

    @IBAction func goBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func createContact(_ sender: AnyObject) {
        // check if we can create a contact.
        if let firstName = firstNameTextfield.text , firstName.characters.count > 0,
            let lastName = lastNameTextfield.text , lastName.characters.count > 0 {
            let phone = phoneNumberTextfield.text
            
           if type == .cnContact {
                if #available(iOS 9, *) {
                    createCNContactWithFirstName(firstName, lastName: lastName, phone: phone, image: contactImage)
                } else {
                    self.showAlertMessage("죄송합니다, iOS 9 이상에서만 사용하실 수 있습니다.")
                }
                
            }
        } else {
            self.showAlertMessage("최소한의 정보를 입력해주세요!")
        }
    }
    
    @IBAction func changeContactImage(_ sender: AnyObject) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.contactImage = info[UIImagePickerControllerEditedImage] as? UIImage
        self.contactImageView.image = self.contactImage
        self.dismiss(animated: true, completion: nil)
    }


}
