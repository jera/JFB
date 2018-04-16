//
//  FormStructs.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import Eureka

public protocol JRow {
    
    func build() -> BaseRow
}

public struct JField: JRow {
    
    let id: String
    let type: TextFieldType
    let placeholder: String?
    
    public init(id: String, type: TextFieldType, placeholder: String?) {
        self.id = id
        self.type = type
        self.placeholder = placeholder
    }
    
    public func build() -> BaseRow {
        return MaterialTextRow(id) { (row) in
            row.fieldType = type
            row.placeholder = placeholder
        }
    }
}
