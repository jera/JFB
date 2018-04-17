//
//  FormRowType.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import NSStringMask

public enum ValidationType {
    case required
    case email
    case maxLength(Int)
    case minLength(Int)
    case cpf
    case regex(String)
}

public enum TextFieldType {
    case email
    case password
    case text
    case name
    case phone
    case cpf
    
    var max: Int {
        switch self {
        case .cpf,
             .phone:
            return 11
        default:
            return Int.max
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .email:
            return UIKeyboardType.emailAddress
        case .cpf:
            return UIKeyboardType.numberPad
        case .phone:
            return UIKeyboardType.phonePad
        default:
            return UIKeyboardType.default
        }
    }
    
    func applyMask(_ string: String?) -> String? {
        switch self {
        case .phone:
            return NSStringMask.maskString(string, withPattern: "\\((\\d{2})\\) (\\d{5})-(\\d{4})")
        case .cpf:
            return NSStringMask.maskString(string, withPattern: "(\\d{3}).(\\d{3}).(\\d{3})-(\\d{2})")
        default:
            return string
        }
    }
}
