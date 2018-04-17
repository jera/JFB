//
//  FormBuilderViewController.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import Eureka

class FormBuilderViewController: FormViewController {
    
    private var rows: [JRow] = []
    
    init(rows: [JRow]) {
        super.init(style: .plain)
        self.rows = rows
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private lazy var submitRow: MaterialSubmitRow = {
        return MaterialSubmitRow()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        let section = Section()
        
        rows.map { $0.build() }
            .forEach {[unowned self] (row) in
                section <<< row

                if let materialRow = row as? MaterialTextRow {
                    materialRow.onChange({ (row) in
                        self.submitRow.updateCell()
                    })
                }
        }

        submitRow.submitTitle = "Enviar"

        form +++ section
        form +++ submitRow
    }
}
