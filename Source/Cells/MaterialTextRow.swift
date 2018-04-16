//
//  MaterialTextRow.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Eureka

final class MaterialTextRow: Row<MaterialTextFieldCell>, RowType {
    
    open var rowType: FormRowType = .text
    open var placeholder: String?
    
    var formattedText: String? {
        return rowType.applyMask(value)
    }

    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<MaterialTextFieldCell>(nibName: "MaterialTextFieldCell")
    }
    
    func updateText(text: String) {
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
        
        if allText.count <= rowType.max {
            value = allText.isEmpty ? nil : allText
            cell.update()
        }
    }
}
