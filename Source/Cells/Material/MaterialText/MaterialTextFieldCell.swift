//
//  MaterialTextFieldCell.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Eureka

final class MaterialTextFieldCell: MaterialBaseField<String> {
    
    private var materialRow: MaterialTextRow {
        return row as! MaterialTextRow
    }

    override func setup() {
        super.setup()
        field.configureWithType(materialRow.fieldType)
    }
    
    override func update() {
        super.update()
        
        field.text = materialRow.formattedText
        
        field.placeholder = materialRow.placeholder
        field.detail = materialRow.validationErrors.first?.msg
        field.dividerActiveColor = materialRow.tintColor ?? field.dividerActiveColor
        field.placeholderActiveColor = materialRow.tintColor ?? field.placeholderActiveColor
    }
    
    // MARK: - UITextFieldDelegate
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        materialRow.updateText(text: string, range: range)
        return false
    }
    
    override func textFieldShouldClear(_ textField: UITextField) -> Bool {
        materialRow.clearText()
        return false
    }
}
