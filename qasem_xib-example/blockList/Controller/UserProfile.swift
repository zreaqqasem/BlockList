//
//  UserProfile.swift
//  qasem_xib-example
//
//  Created by Qasem Zreaq on 9/7/20.
//  Copyright © 2020 Qasem Zreaq. All rights reserved.
//

import UIKit

class UserProfile: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    @IBAction func backToBlockList(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
