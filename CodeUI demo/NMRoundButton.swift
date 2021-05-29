//
//  NMRoundButton.swift
//  CodeUI demo
//
//  Created by Nodirbek Maksumov on 27/05/21.
//

import UIKit

class NMRoundButton: UIButton {

    private let gradientLayer = CAGradientLayer()
    
    var caption:String!{
        didSet{
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.09

            captionLbl.attributedText = NSMutableAttributedString(string: self.caption, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var img:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    
    let captionLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 0.412, green: 0.412, blue: 0.412, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        lbl.textAlignment = .center

        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    func setGradientColor(startColor: UIColor, endColor: UIColor){
        gradientLayer.colors = [
                startColor.cgColor,
                endColor.cgColor
              ]
            
        gradientLayer.locations = [0, 1]
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
        
        self.layer.cornerRadius = self.bounds.width/2
        gradientLayer.cornerRadius = self.bounds.width/2
        self.backgroundColor = UIColor.lightGray
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.addSublayer(gradientLayer)
        self.addSubview(captionLbl)
        self.addSubview(img)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.pin.size(48)
        captionLbl.pin.sizeToFit().hCenter().top(to: self.edge.bottom)
        gradientLayer.frame = self.frame
        img.pin.center().sizeToFit()
    }
    
}
