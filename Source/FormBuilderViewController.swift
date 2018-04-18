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
    
    /// Color to apply at all input tint color and navigation accessory view
    open var tintColor: UIColor = Color.blue.base
    
    /// Text to show on submit button
    open var submitText: String? {
        set { submitRow.submitTitle = newValue }
        get { return submitRow.submitTitle }
    }
    
    /// Submit button's text color
    open var submitTextColor: UIColor {
        set { submitRow.textColor = newValue }
        get { return submitRow.textColor }
    }
    
    /// Submit button's background color
    open var submitBackgroundColor: UIColor {
        set { submitRow.backgroundColor = newValue }
        get { return submitRow.backgroundColor }
    }
    
    /// Submit button's background color when was disable
    open var submitDisableColor: UIColor {
        set { submitRow.disableColor = newValue }
        get { return submitRow.disableColor }
    }
    
    /// Submit button's click callback color
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
    }
    
    /// TODO refactor
    private func setOnChangeValueToUpdateSubmitButton() {
        form.allRows.forEach { (row) in
            
            if let materialTextRow = row as? MaterialTextRow {
                materialTextRow.onChange { (row) in self.submitRow.updateCell() }
            }
            
            if let materialDateRow = row as? MaterialDateRow {
                materialDateRow.onChange { (row) in self.submitRow.updateCell() }
            }
            
            if let materialDateRow = row as? MaterialTimeRow {
                materialDateRow.onChange { (row) in self.submitRow.updateCell() }
            }
        }
    }
    
    /// TODO refactor
    private func applyLayoutForRows() {
        navigationAccessoryView.tintColor = tintColor
        
        form.allRows.forEach { (row) in
            
            if let materialTextRow = row as? MaterialTextRow {
                materialTextRow.tintColor = tintColor
            }
            
            if let materialDateRow = row as? MaterialDateRow {
                materialDateRow.tintColor = tintColor
            }
        }
    }
}
