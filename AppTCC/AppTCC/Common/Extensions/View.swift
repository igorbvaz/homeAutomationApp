//
//  View.swift
//  AppTCC
//
//  Created by Igor Vaz on 23/08/18.
//  Copyright © 2018 Igor Vaz. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
