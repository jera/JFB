//
//  JDateField.swift
//  JFB
//
//  Created by Vitor Mesquita on 17/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Eureka

public struct JDateField: JField {
    
    public var id: String
    public var placeholder: String?
    public var validations: [ValidationType]
    
    var displayFormat: String
    var minDate: Date?
    var maxDate: Date?
    var minInterval: Int?
    
    private var ruleSet: RuleSet<String> {
        return buildValidations(validations: validations)
    }
    
    init(id: String,
         placeholder: String? = nil,
         validations: [ValidationType] = [],
         minDate: Date? = nil,
         maxDate: Date? = nil,
         minInterval: Int? = nil,
         displayFormat: String = "dd/MM/yyyy") {
        
        self.id = id
        self.placeholder = placeholder
        self.validations = validations
        self.minDate = minDate
        self.maxDate = maxDate
        self.minInterval = minInterval
        self.displayFormat = displayFormat
    }

    public func build() -> BaseRow {
        return MaterialDateRow(id) { row in
            row.placeholder = placeholder
            row.minDate = minDate
            row.maxDate = maxDate
            row.minuteInterval = minInterval
            row.displayFormat = displayFormat
            row.add(ruleSet: ruleSet)
        }
    }
}
