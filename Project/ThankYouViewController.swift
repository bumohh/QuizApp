//
//  ThankYouViewController.swift
//  Project
//
//  Created by admin on 5/1/21.
//

import UIKit

class ThankYouViewController: UIViewController {
    var labelText = String()
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
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
