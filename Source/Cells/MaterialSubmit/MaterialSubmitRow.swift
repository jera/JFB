//
//  MaterialSubmitRow.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Eureka

final class MaterialSubmitRow: Row<MaterialSubmitCell>, RowType {

    open var submitTitle: String?
    
    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<MaterialSubmitCell>(nibName: "MaterialSubmitCell")
    }
}
