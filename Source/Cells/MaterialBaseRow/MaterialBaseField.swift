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

class MaterialBaseField<T>: Cell<T>, CellType where T: Equatable {
    
    override func setup() {
        super.setup()
        selectionStyle = .none
        height = { return 74 }
    }
}
