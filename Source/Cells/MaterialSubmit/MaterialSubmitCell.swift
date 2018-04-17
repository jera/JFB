//
//  MaterialSubmitCell.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Material
import Eureka

final class MaterialSubmitCell: Cell<String>, CellType {

    @IBOutlet weak var submitButton: RaisedButton!
    
    private var materialRow: MaterialSubmitRow {
        return row as! MaterialSubmitRow
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        submitButton.addTarget(self, action: #selector(self.didTapSubmition), for: .touchUpInside)
    }

    override func setup() {
        super.setup()
        selectionStyle = .none
        accessoryView = .none
        
        height = { return 82}
    }
    
    override func update() {
        super.update()
        
        submitButton.pulseColor = materialRow.pulseColor
        submitButton.backgroundColor = materialRow.backgroundColor
        submitButton.setTitle(materialRow.submitTitle, for: .normal)
        submitButton.setTitleColor(materialRow.textColor, for: .normal)
        submitButton.setBackgroundImage(UIImage.fromColor(color: materialRow.disableColor), for: .disabled)
        
        submitButton.isEnabled = formViewController()?.form.validate().isEmpty ?? false
    }
    
    @objc private func didTapSubmition() {
        formViewController()?.view.endEditing(true)
        materialRow.submitBlock?()
    }
}
