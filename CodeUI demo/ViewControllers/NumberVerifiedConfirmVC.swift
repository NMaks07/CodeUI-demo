//
//  NumberVerifiedConfirmVC.swift
//  CodeUI demo
//
//  Created by Nodirbek Maksumov on 23/05/21.
//

import UIKit

class NumberVerifiedConfirmVC: UIViewController {

    //Gradient layer, градиентный слой сделаю отдельным переменным так как придётся много раз его frame переопределять в viewDidLayoutSubviews
    let gradientLayer: CAGradientLayer = {
        
        let layer = CAGradientLayer()
        
        layer.colors = [
            UIColor(red: 0, green: 0.833, blue: 0.233, alpha: 1).cgColor,
            UIColor(red: 0.004, green: 0.733, blue: 0.208, alpha: 1).cgColor
        ]
        
        layer.locations = [0, 1]
        
        return layer
    }()

    let congratsLbl: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 26, weight: .medium)
        view.textColor = .white
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.93

        view.attributedText = NSMutableAttributedString(string: "Поздравляем.\nВаш номер подтвержден.", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let shieldImg: UIImageView = {
        let sh = UIImageView()
        sh.image = UIImage(named: "shield")
        sh.pin.width(66).height(80.67)
        sh.layer.shadowOpacity = 0.4
        sh.layer.shadowOffset = CGSize(width: 0, height: 10)
        sh.layer.shadowRadius = 10
        sh.layer.shadowColor = UIColor.gray.cgColor
        return sh
    }()

    
    let okBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 10
        btn.setTitle("Начать", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOpacity = 0.3
        btn.layer.shadowRadius = 21
        btn.layer.shadowOffset = CGSize(width: 0, height: 5)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
}


extension NumberVerifiedConfirmVC {
    override func loadView() {
        super.loadView()
        view.layer.addSublayer(gradientLayer)
        view.addSubview(okBtn)
        view.addSubview(congratsLbl)
        view.addSubview(shieldImg)
    }

    override func viewDidLayoutSubviews() {
        gradientLayer.frame = view.frame
        
        okBtn.pin.height(48).left(16).right(16).bottom(34)
        congratsLbl.pin.horizontally(16).top(86).sizeToFit()
        
        shieldImg.pin.center(to: view.anchor.center)
        
    }
}
