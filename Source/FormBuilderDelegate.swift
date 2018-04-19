//
//  FormBuilderDelegate.swift
//  JFB
//
//  Created by Vitor Mesquita on 17/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import Foundation

public protocol FormBuilderDelegate: class {
    
    func formReceivedValues(_ values: [String: Any])
}
