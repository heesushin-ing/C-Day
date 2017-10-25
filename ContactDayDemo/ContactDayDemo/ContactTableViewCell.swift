//
//  ContactTableViewCell.swift
//  ContactDayDemo
//
//  Created by HEESU SHIN on 2017. 3. 8..
//  Copyright © 2017년 HEESU SHIN-ING. All rights reserved.
//

import AddressBook
import Contacts
import UIKit

class ContactTableViewCell: UITableViewCell {
    // outlets
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneLabel: UILabel!
    @IBOutlet weak var dateAlarm: UILabel!
    @IBOutlet weak var dateAlarmColour: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCircularAvatar() {
        contactImageView.layer.cornerRadius = contactImageView.frame.size.height/2
        contactImageView.layer.borderWidth = 0
        contactImageView.layer.masksToBounds = true
 
        
    }
    
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        setCircularAvatar()
    }
    
    func configureWithContactEntry(_ contact: ContactEntry) {
        contactNameLabel.text = contact.name
        contactPhoneLabel.text = contact.phone ?? ""
        contactImageView.image = contact.image ?? UIImage(named: "defaultUser")
        setCircularAvatar()
        
    }
    
    func countDateAlarm (dateAlarm : Int) -> String {
        
        let todayDate = 
        
        if dateAlarm < 10 {
            print("You recently contacted him/her")
        }; if else dateAlarm > 10 && dateAlarm < 30 {
            print ("You often contact him/her")
        }; else dateAlarm > 30 {
            print ("You rarely contact him/her")
        }
        
        return 0
    }
    
}
