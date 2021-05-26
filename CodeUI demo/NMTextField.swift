//
//  NMTextField.swift
//  CodeUI demo
//
//  Created by Nodirbek Maksumov on 26/05/21.
//

import UIKit

enum TextFieldStyle {
    case grayed
    case okStyle
    case errorStyle
}

class NMTextField: UITextField {
    
    private var rightViewLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.translatesAutoresizingMaskIntoConstraints = false
        self.rightViewLabel = UILabel()
        self.rightViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.rightView = UIView()
        //self.leftView = ChekedView()
        
        self.rightView?.translatesAutoresizingMaskIntoConstraints = false
        self.rightView?.addSubview(rightViewLabel)

    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var customStyle: TextFieldStyle! {
        didSet{
            switch customStyle {
            case .grayed:
                self.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1).cgColor
                self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                rightViewMode = .never
            case .okStyle:
                self.layer.borderColor = UIColor(red: 0, green: 0.1, blue: 1, alpha: 1).cgColor
                self.backgroundColor = UIColor(red: 0, green: 0.1, blue: 1, alpha: 0.1)
                rightViewLabel.text = "✓"
                rightViewLabel.textColor = UIColor(red: 0, green: 0.1, blue: 1, alpha: 1)
                rightViewMode = .always
                //leftViewMode = .always
            case .errorStyle:
                self.layer.borderColor = UIColor(red: 0.958, green: 0.348, blue: 0.004, alpha: 1).cgColor
                self.backgroundColor = UIColor(red: 1, green: 0.978, blue: 0.946, alpha: 1)
                rightViewLabel.text = "⎼"
                rightViewLabel.textColor = UIColor(red: 0.958, green: 0.348, blue: 0.004, alpha: 1)
                rightViewMode = .always
            case .none:
                #warning("none style, I dont know from where this option come frome")
            }
        }
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let offset = 5
        let width  = 35
        let height = Int(bounds.height)
        let x = Int(bounds.width) - width - offset
        let y = 0
        let rightViewBounds = CGRect(x: x, y: y, width: width, height: height)
        return rightViewBounds
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let offset = 5
        let width  = 25
        let height = Int(bounds.height)
        let x = offset
        let y = 0
        let leftViewBounds = CGRect(x: x, y: y, width: width, height: height)
        return leftViewBounds

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rightViewLabel.pin.sizeToFit().center()
    }
    
}
