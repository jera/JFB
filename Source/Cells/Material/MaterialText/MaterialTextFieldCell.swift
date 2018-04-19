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
        field.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
    
    override func update() {
        super.update()
        
        field.placeholder = materialRow.placeholder
        field.detail = materialRow.validationErrors.first?.msg
        field.dividerActiveColor = materialRow.tintColor ?? field.dividerActiveColor
        field.placeholderActiveColor = materialRow.tintColor ?? field.placeholderActiveColor
        
        if materialRow.fieldType.hasMask {
            field.text = materialRow.formattedText
        }
    }
    
    @objc private func textDidChange(_ textField: UITextField) {
        guard !materialRow.fieldType.hasMask else { return }
        materialRow.setValue(text: textField.text)
    }
    
    // MARK: - UITextFieldDelegate
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if materialRow.fieldType.hasMask {
            materialRow.updateText(text: string, range: range)
            return false
        }
        
        return super.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
    }
    
    override func textFieldShouldClear(_ textField: UITextField) -> Bool {
        materialRow.clearText()
        
        if materialRow.fieldType.hasMask {
            return false
        }
        
        return super.textFieldShouldClear(textField)
    }
}
