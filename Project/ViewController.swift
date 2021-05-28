//
//  ViewController.swift
//  Project
//
//  Created by admin on 4/22/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "To Our Survey App"
        label.font = UIFont.systemFont(ofSize: 48)
        label.sizeToFit()
        label.center = CGPoint(x: 200, y:90)
        view.addSubview(label)
        
        UIView.animate(withDuration: 2.0, delay: 1, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.2, options: [.preferredFramesPerSecond60], animations: {
            self.label.center = CGPoint(x: 200, y:290)
        }, completion: nil)
        
        // Do any additional setup after loading the view.
        
        let deadlineTime = DispatchTime.now() + .seconds(10)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.performSegue(withIdentifier: "Welcome", sender: self)
        }
 
    }
}

