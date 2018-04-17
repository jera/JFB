//
//  MaterialTextFieldCell.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Eureka
import Material

final class MaterialTextFieldCell: Cell<String>, CellType, UITextFieldDelegate {
    
    @IBOutlet private weak var textField: TextField!
    
    private var materialRow: MaterialTextRow {
        return row as! MaterialTextRow
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }
    
    open override func cellCanBecomeFirstResponder() -> Bool {
        return !row.isDisabled && textField.canBecomeFirstResponder == true
    }
    
    open override func cellBecomeFirstResponder(withDirection: Direction) -> Bool {
        return textField.becomeFirstResponder()
    }
    
    open override func cellResignFirstResponder() -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func setup() {
        super.setup()
        selectionStyle = .none
        
        textField.detailColor = .red
        textField.detailVerticalOffset = 0
        textField.placeholderVerticalOffset = 35.0
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = materialRow.fieldType.keyboardType
        
        height = { return 74 }
    }
    
    override func update() {
        super.update()
        
        textField.text = materialRow.formattedText
        textField.placeholder = materialRow.placeholder
        textField.detail = materialRow.validationErrors.first?.msg
        textField.isVisibilityIconButtonEnabled = materialRow.fieldType == .password
    }
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        materialRow.updateText(text: string, range: range)
        return false
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        materialRow.clearText()
        return false
    }
    
   func textFieldDidBeginEditing(_ textField: UITextField) {
        formViewController()?.beginEditing(of: self)
        formViewController()?.textInputDidBeginEditing(textField, cell: self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        formViewController()?.endEditing(of: self)
        formViewController()?.textInputDidEndEditing(textField, cell: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return formViewController()?.textInputShouldReturn(textField, cell: self) ?? true
    }
}
