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

    @IBOutlet weak var textField: TextField!
    
    private var materialRow: MaterialTextRow {
        return row as! MaterialTextRow
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }
    
    override func setup() {
        super.setup()
        selectionStyle = .none
        
        textField.clearButtonMode = .whileEditing
        textField.placeholderVerticalOffset = 35.0
        textField.detailVerticalOffset = 0
    
        height = { return 74 } // textField's height == 50 + margins top and bottom == 8
    }
    
    override func update() {
        super.update()
        
        textField.text = materialRow.formattedText
        textField.placeholder = materialRow.placeholder
        textField.keyboardType = materialRow.rowType.keyboardType
        textField.detail = materialRow.validationErrors.first?.msg
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        materialRow.updateText(text: string)
        return false
    }
}
