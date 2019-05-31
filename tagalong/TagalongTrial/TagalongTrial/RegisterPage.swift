//
//  RegisterPage.swift
//  TagalongTrial
//
//  Created by Kieran Bondy on 5/30/19.
//  Copyright © 2019 Kieran Bondy. All rights reserved.
//

import UIKit

class RegisterPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func BackBtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Home = storyBoard.instantiateViewController(withIdentifier: "LoginPage")
        self.present(Home, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
