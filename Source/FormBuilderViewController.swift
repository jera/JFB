//
//  FormBuilderViewController.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import Eureka

class FormBuilderViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none

//        var rules = RuleSet<String>()
//        rules.add(rule: RuleRequired())
//        rules.add(rule: RuleEmail())
        
        form +++ Section("Dados do usuário")
            <<< MaterialTextRow() { row in
                row.tag = "te xt"
                row.rowType = .cpf
                row.placeholder = "Row"
                row.add(rule: RuleCPF())
                row.validationOptions = .validatesOnChange
            }
            <<< ButtonRow() { btn in
                btn.title = "Submit"
                
                }
                .onCellSelection { cell, row in
                    print("did select")
                    print(self.form.values())
        }
    }
}
