//
//  MaterialBaseRow.swift
//  JFB
//
//  Created by Vitor Mesquita on 17/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Eureka

class MaterialBaseRow<Cell: CellType>: Row<Cell> where Cell: BaseCell {
    
    var placeholder: String?
    
    var tintColor: UIColor? {
        didSet { cell.update() }
    }
    
    var formattedText: String? {
        return nil
    }

    required init(tag: String?) {
        super.init(tag: tag)
    }
    
    func clearText() {
        value = nil
        cell.update()
    }
}
