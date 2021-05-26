//
//  NMButton.swift
//  CodeUI demo
//
//  Created by Nodirbek Maksumov on 26/05/21.
//

import UIKit

enum ButtonStyle {
    case disabled
    case active
    case waiting
}

class NMButton: UIButton {
    
    lazy var activitySpinner = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 8
        self.setTitle("Продолжить", for: .normal)
    
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 21
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var customStyle: ButtonStyle! {
        didSet {
            switch customStyle {
            case .active:
                isEnabled = true
                self.setTitleColor(UIColor.black, for: .normal)
                self.backgroundColor = UIColor.white
                self.layer.shadowOpacity = 0.3
            case .disabled:
                print("disabled")
                self.isEnabled = false
                self.setTitleColor(UIColor.lightGray, for: .disabled)
                self.backgroundColor = UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1)
                self.layer.shadowOpacity = 0
            case .waiting:
                print("waiting")
                self.isEnabled = false
                self.setTitleColor(UIColor.clear, for: .disabled)
                self.backgroundColor = UIColor.white
                self.layer.shadowOpacity = 0.3
                self.addSubview(activitySpinner)
                activitySpinner.startAnimating()
            case .none:
                print("none")
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if customStyle == .waiting {
            activitySpinner.pin.center()
        }
    }
}
