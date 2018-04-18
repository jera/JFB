//
//  MaterialDateCell.swift
//  JFB
//
//  Created by Vitor Mesquita on 18/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit

final class MaterialDateCell: MaterialBaseField<String> {
    
    private var materialRow: MaterialBaseDateRow {
        return row as! MaterialBaseDateRow
    }
    
    private var datePicker = UIDatePicker()

    override func setup() {
        super.setup()
        
        datePicker.minuteInterval = materialRow.minuteInterval ?? datePicker.minuteInterval
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        field.configureWithType(.text)
        field.inputView = datePicker
        
        if let dateRow = materialRow as? MaterialDateRow {
            datePicker.datePickerMode = .date
            datePicker.minimumDate = dateRow.minDate
            datePicker.maximumDate = dateRow.maxDate
        }
        
        if materialRow is MaterialTimeRow {
            datePicker.datePickerMode = .time
            datePicker.minimumDate = nil
            datePicker.maximumDate = nil
        }
    }
    
    override func update() {
        super.update()
        
        field.text = materialRow.formattedText
        field.placeholder = materialRow.placeholder
        field.detail = materialRow.validationErrors.first?.msg
        field.dividerActiveColor = materialRow.tintColor ?? field.dividerActiveColor
        field.placeholderActiveColor = materialRow.tintColor ?? field.placeholderActiveColor
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        materialRow.didSelectDate(sender.date)
    }
    
    override func textFieldShouldClear(_ textField: UITextField) -> Bool {
        materialRow.clearText()
        return false
    }
}
