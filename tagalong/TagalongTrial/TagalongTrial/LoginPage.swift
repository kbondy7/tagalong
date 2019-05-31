//
//  LoginPage.swift
//  TagalongTrial
//
//  Created by Kieran Bondy on 5/30/19.
//  Copyright © 2019 Kieran Bondy. All rights reserved.
//

import UIKit

class LoginPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func LoginBtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Home = storyBoard.instantiateViewController(withIdentifier: "WebPage")
        self.present(Home, animated: true, completion: nil)
    }
    
    
    
    @IBAction func RegisterBtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Home = storyBoard.instantiateViewController(withIdentifier: "RegisterPage")
        self.present(Home, animated: true, completion: nil)
        
    }
    

}
