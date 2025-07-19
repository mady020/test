//
//  ViewController.swift
//  Login
//
//  Created by Student on 18/07/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = "Welcome, \(username.text ?? "User")!"
    }
    
}
