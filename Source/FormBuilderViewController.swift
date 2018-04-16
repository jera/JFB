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

        form +++ Section("Dados do usuário")
            <<< MaterialTextRow() { row in
                row.tag = "cpf"
                row.fieldType = .cpf
                row.placeholder = "Row"
                row.add(rule: RuleCPF())
                row.validationOptions = .validatesOnChange
            }
            <<< MaterialTextRow() { row in
                row.tag = "text"
                row.fieldType = .phone
                row.placeholder = "Phone"
            }
            <<< MaterialTextRow() { row in
                row.tag = "password"
                row.fieldType = .password
                row.placeholder = "Password"
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
