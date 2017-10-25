//
//  ViewController.swift
//  ContactDayDemo
//
//  Created by HEESU SHIN on 2017. 2. 15..
//  Copyright © 2017년 HEESU SHIN-ING. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Navigation Bar setup
  
    }
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "AddContact", sender: Any.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

