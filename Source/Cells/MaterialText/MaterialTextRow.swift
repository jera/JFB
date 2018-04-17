//
//  MaterialTextRow.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Eureka

final class MaterialTextRow: MaterialBaseRow<MaterialTextFieldCell>, RowType {
    
    open var fieldType: TextFieldType = .text

    var formattedText: String? {
        return fieldType.applyMask(value)
    }

    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<MaterialTextFieldCell>(nibName: "MaterialTextFieldCell")
    }
    
    func updateText(text: String, range: NSRange) {
        if range.length == value?.count {
            clearText()
            return
        }
        
        var allText = value ?? ""
        
        if !text.isEmpty {
            allText += text
        }
        
        if text.isEmpty && !allText.isEmpty {
            allText.removeLast()
            
            let removedLastText = allText
            allText = ""
            
            for character in removedLastText {
                allText += String(character)
            }
        }
        
        if allText.count <= fieldType.max {
            value = allText.isEmpty ? nil : allText
            cell.update()
        }
    }
}
