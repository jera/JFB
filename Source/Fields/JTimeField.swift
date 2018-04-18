//
//  JTimeField.swift
//  JFB
//
//  Created by Vitor Mesquita on 18/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Eureka

public struct JTimeField: JField {
    
    public var id: String
    public var placeholder: String?
    public var validations: [ValidationType]
    
    var minInterval: Int?
    
    private var ruleSet: RuleSet<String> {
        return buildValidations(validations: validations)
    }
    
    init(id: String, placeholder: String? = nil, validations: [ValidationType] = [], minInterval: Int? = nil) {
        self.id = id
        self.placeholder = placeholder
        self.validations = validations
        self.minInterval = minInterval
    }
    
    public func build() -> BaseRow {
        return MaterialTimeRow(id) { row in
            row.placeholder = placeholder
            row.minuteInterval = minInterval
            row.add(ruleSet: ruleSet)
        }
    }
}
