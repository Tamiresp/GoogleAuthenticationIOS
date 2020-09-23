//
//  ViewController.swift
//  FirebaseIOS
//
//  Created by tamires.p.silva on 17/09/20.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth


class ViewController: UIViewController {
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
        DispatchQueue.main.async { [self] in
            
            var username = ReadWriteUser.readStringData(key: "username")
            
            if username == "" {
                userName.text = "Sem acessos recentes"
            } else {
                userName.text = "Último acesso realizado por: \(username)"
            }
           
        }
    }
}

