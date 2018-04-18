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
    
    open var textColor: UIColor = .black
    open var backgroundColor: UIColor = .white
    open var disableColor: UIColor = .lightGray
    open var pulseColor: UIColor = .lightGray
    
    var submitBlock: (() -> Void)?
    
    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<MaterialSubmitCell>(nibName: "MaterialSubmitCell")
    }
    
    public func didSubmit(_ callback: @escaping () -> Void) -> MaterialSubmitRow {
        self.submitBlock =  callback
        return self
    }
}
