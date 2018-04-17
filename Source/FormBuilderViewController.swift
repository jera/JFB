//
//  FormBuilderViewController.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import Eureka

public class FormBuilderViewController: FormViewController {
    
    private var fields: [JField] = []
    private weak var delegate: FormBuilderDelegate?
    
    public init(fields: [JField], delegate: FormBuilderDelegate?) {
        super.init(style: .plain)
        self.fields = fields
        self.delegate = delegate
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private lazy var submitRow: MaterialSubmitRow = {
        return MaterialSubmitRow()
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        let section = Section()
        
        fields.map { $0.build() }
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
