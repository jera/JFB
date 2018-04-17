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
    
    open var placeholder: String?
    
    open var tintColor: UIColor? {
        didSet { cell.update() }
    }

    required init(tag: String?) {
        super.init(tag: tag)
    }
    
    func clearText() {
        value = nil
        cell.update()
    }
}
