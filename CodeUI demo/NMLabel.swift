//
//  NMLabel.swift
//  CodeUI demo
//
//  Created by Nodirbek Maksumov on 26/05/21.
//

import UIKit

enum LabelStyle {
    case normal(text: String)
    case grayed(text: String)
    case active(text: String)
    case errorStyle(text: String)
}

class NMLabel: UILabel {
    
    private let paragraphStyle = NSMutableParagraphStyle()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        paragraphStyle.lineHeightMultiple = 1.09
        
        self.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var customStyle: LabelStyle! {
        didSet{
            switch customStyle {
            case .normal(let text):
                self.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                self.attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
                
            case .grayed(let text):
                self.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
                self.attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
                
            case .active(let text):
                self.textColor = UIColor(red: 0, green: 0.1, blue: 1, alpha: 1)
                self.attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
                
            case .errorStyle(let text):
                self.textColor = UIColor(red: 0.958, green: 0.348, blue: 0.004, alpha: 1)
                self.attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
                
            case .none:
                fatalError("Not implemented")
            }
        }
    }
}
