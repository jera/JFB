//
//  ViewController.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loadingx the view, typically from a nib.
    }
    
    let loginForm: [JField] = [
        JTextField(id: "email", type: TextFieldType.email, placeholder: "Email", validations: [.required, .email]),
        JTextField(id: "password", type: TextFieldType.password, placeholder: "Senha", validations: [.required, .minLength(6)])
    ]
    
    @IBAction func buttonAction(_ sender: Any) {
        let nv = UINavigationController(rootViewController: FormBuilderViewController(fields: loginForm, delegate: self))
        present(nv, animated: true)
    }
}

extension ViewController: FormBuilderDelegate {
    
    func formReceivedValues(_ values: [String: Any]) {
        print(values)
    }
}
