//
//  ViewController.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Material

class ViewController: UIViewController {
    
    let loginForm: [JField] = [
        JTextField(id: "email", type: .email, placeholder: "E-mail", validations: [.required, .email]),
        JTextField(id: "password", type: .password, placeholder: "Password", validations: [.required, .minLength(6)])
//        JTextField(id: "name", type: .name, placeholder: "Nome", validations: [.required]),
//        JTextField(id: "cpf", type: .cpf, placeholder: "CPF", validations: [.required, .cpf]),
//        JTextField(id: "phone", type: .phone, placeholder: "Telefone", validations: [.required]),
//        JDateField(id: "date", placeholder: "Data", validations: [.required]),
//        JTimeField(id: "time", placeholder: "Hora", validations: [.required])
    ]
    
    lazy var vc: FormBuilderViewController = { FormBuilderViewController(fields: loginForm, delegate: self) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vc.submitTextColor = .white
        vc.submitBackgroundColor = Color.blue.base
        vc.submitText = "LOGIN"
    }
        
    @IBAction func action(_ sender: Any) {
        let nv = UINavigationController(rootViewController: vc)
        present(nv, animated: true)
    }
}

extension ViewController: FormBuilderDelegate {
    
    func formReceivedValues(_ values: [String: Any]) {
        print(values)
    }
}
