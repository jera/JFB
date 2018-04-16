//
//  RuleCPF.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import Foundation
import Eureka

public struct RuleCPF: RuleType {
    
    public typealias RowValueType = String
    
    public var id: String?
    public var validationError: ValidationError
    
    init(msg: String = "CPF inválido") {
        self.validationError = ValidationError(msg: msg)
    }
    
    public func isValid(value: String?) -> ValidationError? {
        guard let value = value, !value.isEmpty else { return ValidationError(msg: "") }
        return value.count == 11 ? nil : validationError
    }
}
