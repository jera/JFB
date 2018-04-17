//
//  FormBuilderViewController.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import Eureka
import Material

public class FormBuilderViewController: FormViewController {
    
    // MARK: - Public
    
    ///
    open var tintColor: UIColor = Color.blue.base
    
    ///
    open var submitText: String? {
        set { submitRow.submitTitle = newValue }
        get { return submitRow.submitTitle }
    }
    
    ///
    open var submitTextColor: UIColor {
        set { submitRow.textColor = newValue }
        get { return submitRow.textColor }
    }
    
    ///
    open var submitBackgroundColor: UIColor {
        set { submitRow.backgroundColor = newValue }
        get { return submitRow.backgroundColor }
    }
    
    ///
    open var submitDisableColor: UIColor {
        set { submitRow.disableColor = newValue }
        get { return submitRow.disableColor }
    }
    
    ///
    open var submitPulseColor: UIColor {
        set { submitRow.pulseColor = newValue }
        get { return submitRow.pulseColor }
    }
    
    // MARK: - Private
    
    private var fields: [JField] = []
    private weak var delegate: FormBuilderDelegate?
    
    private lazy var mainSection: Section = {
        return Section()
    }()
    
    private lazy var submitRow: MaterialSubmitRow = {
        return MaterialSubmitRow().didSubmit {[weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.formReceivedValues(strongSelf.form.values())
        }
    }()
    
    public init(fields: [JField], delegate: FormBuilderDelegate?) {
        super.init(style: .plain)
    
        self.fields = fields
        self.delegate = delegate
        
        fields.map { $0.build() }.forEach {[unowned self] (row) in
            self.mainSection <<< row
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        form +++ mainSection
        form +++ submitRow
        
        setOnChangeValueToUpdateSubmitButton()
        applyLayoutForRows()
        navigationAccessoryView.tintColor = tintColor
    }
    
    private func setOnChangeValueToUpdateSubmitButton() {
        form.allRows.forEach { (row) in
            if let materialRow = row as? MaterialTextRow {
                materialRow.onChange { (row) in self.submitRow.updateCell() }
            }
        }
    }
    
    private func applyLayoutForRows() {
        form.allRows.forEach { (row) in
            if let materialRow = row as? MaterialTextRow {
                materialRow.tintColor = tintColor
            }
        }
    }
}
