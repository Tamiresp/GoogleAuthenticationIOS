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
    
    var labelText: String = "" {
        didSet {
            if let labelType = userName {
                labelType.text = labelText
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
        changelabel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.changeLabelNotification(_:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)
        
    }
    
    @objc func changeLabelNotification(_ notification: NSNotification) {
        changelabel()
    }
    
    func changelabel() {
        DispatchQueue.main.async { [self] in
            
            var username = ReadWriteUser.readStringData(key: "username")
            
            if username == "" {
                labelText = "Sem outros acessos recentemente"
            } else {
                labelText = "Último acesso realizado por: \(username)"
                //userName!.text = labelText
            }
        }
    }
}

