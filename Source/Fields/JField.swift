//
//  JField.swift
//  JFB
//
//  Created by Vitor Mesquita on 17/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import Eureka

public protocol JField {
    
    var id: String { get set }
    var placeholder: String? { get set }
    var validations: [ValidationType] { get set }
    
    func build() -> BaseRow
}

func buildValidations(validations: [ValidationType]) -> RuleSet<String> {
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
            
        case .cpf:
            rules.add(rule: RuleCPF())
            
        case .regex(let regex):
            rules.add(rule: RuleRegExp(regExpr: regex))
        }
    }
    return rules
}
