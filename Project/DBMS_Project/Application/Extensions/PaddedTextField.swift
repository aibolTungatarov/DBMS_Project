//
//  PaddedTextField.swift
//  DBMS_Project
//
//  Created by Aibol Tungatarov on 12/6/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

import UIKit
open class PaddedTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 10)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
