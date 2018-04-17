//
//  MaterialAppearence.swift
//  JFB
//
//  Created by Vitor Mesquita on 17/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import Material

extension TextField {
    
    func configureWithType(_ type: TextFieldType) {
        
        if #available(iOS 10.0, *) {
            self.textContentType = UITextContentType("")
        }
        
        self.detailColor = .red
        self.detailVerticalOffset = 0
        self.placeholderVerticalOffset = 35.0
        self.clearButtonMode = .whileEditing
        
        switch type {
            
        case .email:
            self.keyboardType = .emailAddress
            self.autocorrectionType = .no
            self.autocapitalizationType = .none
            
        case .cpf:
            self.keyboardType = .numberPad
            self.autocorrectionType = .no
            self.autocapitalizationType = .none
            
        case .phone:
            self.keyboardType = .phonePad
            self.autocorrectionType = .no
            self.autocapitalizationType = .none
            
        case .password:
            self.keyboardType = .default
            self.autocorrectionType = .no
            self.autocapitalizationType = .none
            self.isVisibilityIconButtonEnabled = true
            
            if #available(iOS 11.0, *) {
                self.textContentType = .password
            }
            
        case .name:
            self.keyboardType = .default
            self.autocorrectionType = .no
            self.autocapitalizationType = .words
            
        case .text:
            self.keyboardType = .default
            self.autocorrectionType = .no
            self.autocapitalizationType = .sentences
        }
    }
}
