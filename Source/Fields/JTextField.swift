//
//  JTextField.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import Eureka

public struct JTextField: JField {
    
    let id: String
    let type: TextFieldType
    let placeholder: String?
    let validations: [ValidationType]
    
    public init(id: String, type: TextFieldType, placeholder: String? = nil, validations: [ValidationType] = []) {
        self.id = id
        self.type = type
        self.placeholder = placeholder
        self.validations = validations
    }
    
    public func build() -> BaseRow {
        return MaterialTextRow(id) { (row) in
            row.fieldType = type
            row.placeholder = placeholder
            row.add(ruleSet: buildValidations())
        }
    }
    
    private func buildValidations() -> RuleSet<String> {
        var rules = RuleSet<String>()
        validations.forEach { (type) in
            switch type {
            case .required:
                rules.add(rule: RuleRequired(msg: ""))
                
            case .email:
                rules.add(rule: RuleEmail())
                
            case .maxLength(let length):
                rules.add(rule: RuleMaxLength(maxLength: UInt(length)))
                
            case .minLength(let length):
                rules.add(rule: RuleMinLength(minLength: UInt(length)))
            }
        }
        return rules
    }
}
