//
//  LoginViewController.swift
//  Twitter
//
//  Created by Geo on 9/22/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender:    self)
        }
    }
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        
        let auth_url = "https://api.twitter.com/oauth/request_token"

        TwitterAPICaller.client?.login(url: auth_url, success: {
            
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("failed to login")
            print(Error)
        })
    }
}
