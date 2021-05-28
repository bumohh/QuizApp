//
//  WelcomeViewController.swift
//  Project
//
//  Created by admin on 4/26/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    

    var labelText = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
        // Do any additional setup after loading the view.
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
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

