//
//  Utilities.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 11/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.


import Foundation
import UIKit

class Utilities {

    // To style a text field
    static func styleTextField(_ textfield:UITextField) {

        // Create the bottom line
        let bottomLine = CALayer()

        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)

        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor

        // Remove border on text field
        textfield.borderStyle = .none

    
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)

    }

    static func styleFilledButton(_ button:UIButton) {

        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 1.0, green: 0.5, blue: 0.0, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }

    static func styleHollowButton(_ button:UIButton) {

        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }

    static func isPasswordValid(_ password : String) -> Bool {

        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }

}


// Set custom button using IBDesignable
//import UIKit
//@IBDesignable
//class CustomButton: UIButton {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupButton()
//    }
//
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupButton()
//    }
//
//
//    func setupButton() {
//        setShadow()
//        setTitleColor(.red, for: .normal)
//
////        backgroundColor      = UIColor.init(red: 48/255, green: 99/255, blue: 173/255, alpha: 1)
//        titleLabel?.font     = UIFont(name: "HelveticaNeue-Light", size: 30)
//        layer.cornerRadius   = 30
//        layer.borderWidth    = 2.0
//        layer.borderColor    = UIColor.darkGray.cgColor
//    }
//
//
//    private func setShadow() {
//        layer.shadowColor   = UIColor.black.cgColor
//        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
//        layer.shadowRadius  = 8
//        layer.shadowOpacity = 0.5
//        clipsToBounds       = true
//        layer.masksToBounds = false
//    }
//
//
//    func shake() {
//        let shake           = CABasicAnimation(keyPath: "position")
//        shake.duration      = 0.1
//        shake.repeatCount   = 2
//        shake.autoreverses  = true
//
//        let fromPoint       = CGPoint(x: center.x - 8, y: center.y)
//        let fromValue       = NSValue(cgPoint: fromPoint)
//
//        let toPoint         = CGPoint(x: center.x + 8, y: center.y)
//        let toValue         = NSValue(cgPoint: toPoint)
//
//        shake.fromValue     = fromValue
//        shake.toValue       = toValue
//
//        layer.add(shake, forKey: "position")
//    }
//}
