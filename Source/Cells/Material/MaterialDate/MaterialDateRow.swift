//
//  MaterialDateRow.swift
//  JFB
//
//  Created by Vitor Mesquita on 18/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Eureka

class MaterialBaseDateRow: MaterialBaseRow<MaterialDateCell> {
    
    var minuteInterval: Int?
    var dateFormatter = DateFormatter()
    
    func didSelectDate(_ date: Date) { /* Do nothing */}
}

final class MaterialDateRow: MaterialBaseDateRow, RowType {
    
    open var minDate: Date?
    open var maxDate: Date?
    
    open var displayFormat: String = "dd/MM/yyyy"
    
    override var formattedText: String? {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: value ?? "") else { return nil }
        dateFormatter.dateFormat = displayFormat
        return dateFormatter.string(from: date)
    }
    
    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<MaterialDateCell>()
    }
    
    override func didSelectDate(_ date: Date) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        value = dateFormatter.string(from: date)
        cell.update()
    }
}

final class MaterialTimeRow: MaterialBaseDateRow, RowType {
    
    override var formattedText: String? {
        return value
    }
    
    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<MaterialDateCell>()
    }
    
    override func didSelectDate(_ date: Date) {
        dateFormatter.dateFormat = "HH:mm"
        value = dateFormatter.string(from: date)
        cell.update()
    }
}
