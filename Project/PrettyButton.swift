//
//  PrettyButton.swift
//  Project
//
//  Created by admin on 5/5/21.
//

import UIKit

class PrettyButton: UIButton {

   
        @IBInspectable var borderWidth: CGFloat {
            set {
                layer.borderWidth = newValue
            }
            get {
                return layer.borderWidth
            }
        }

        @IBInspectable var cornerRadius: CGFloat {
            set {
                layer.cornerRadius = newValue
            }
            get {
                return layer.cornerRadius
            }
        }

        @IBInspectable var borderColor: UIColor? {
            set {
                guard let uiColor = newValue else { return }
                layer.borderColor = uiColor.cgColor
            }
            get {
                guard let color = layer.borderColor else { return nil }
                return UIColor(cgColor: color)
            }
        
    }

}
