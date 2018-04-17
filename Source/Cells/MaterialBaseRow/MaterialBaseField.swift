//
//  MaterialBaseField.swift
//  JFB
//
//  Created by Vitor Mesquita on 17/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Eureka
import Material

class MaterialBaseField<T>: Cell<T>, CellType, UITextFieldDelegate where T: Equatable {
    
    override var detailTextLabel: UILabel? {
        return nil
    }
    
    internal lazy var field: TextField = {
        let textField = TextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func setup() {
        super.setup()
        addTextField()
        
        selectionStyle = .none
        height = { return 74 }
        
        field.delegate = self
    }
    
    open override func cellCanBecomeFirstResponder() -> Bool {
        return !row.isDisabled && field.canBecomeFirstResponder == true
    }
    
    open override func cellBecomeFirstResponder(withDirection: Direction) -> Bool {
        return field.becomeFirstResponder()
    }
    
    open override func cellResignFirstResponder() -> Bool {
        return field.resignFirstResponder()
    }
    
    // MARK: - UITextFieldDelegate
    
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
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return formViewController()?.textInputShouldClear(textField, cell: self) ?? true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return formViewController()?.textInput(textField, shouldChangeCharactersInRange: range, replacementString: string, cell: self) ?? true
    }
}

extension MaterialBaseField {
    
    func addTextField() {
        field.removeFromSuperview()
        
        contentView.addSubview(field)
        
        let constraints = [
            field.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            field.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            field.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            field.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
