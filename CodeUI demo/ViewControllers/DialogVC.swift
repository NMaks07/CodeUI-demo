//
//  DialogVC.swift
//  CodeUI demo
//
//  Created by Nodirbek Maksumov on 27/05/21.
//

import UIKit
import PinLayout

class DialogVC: UIViewController {
    
    let redBtn : NMRoundButton = {
        let btn = NMRoundButton()
        btn.caption = "Сбросить"
        btn.img.image = UIImage(named: "phoneOff")
        return btn
    }()
    
    let laterBtn: NMRoundButton = {
        let btn = NMRoundButton()
        btn.setGradientColor(startColor: UIColor(red: 1, green: 0.54, blue: 0, alpha: 1), endColor: UIColor(red: 1, green: 0.18, blue: 0, alpha: 1))
        btn.caption = "Позже"
        btn.img.image = UIImage(named: "minusSign")
        return btn
    }()
    
    let moreBtn: NMRoundButton = {
        let btn = NMRoundButton()
        btn.caption = "Подробнее"
        btn.setGradientColor(startColor: UIColor(red: 1, green: 0.54, blue: 0, alpha: 1), endColor: UIColor(red: 1, green: 0.18, blue: 0, alpha: 1))
        btn.img.image = UIImage(named: "threeDots")
        return btn
    }()
    
    let acceptCallBtn: NMRoundButton = {
        let btn = NMRoundButton()
        btn.setGradientColor(startColor: UIColor(red: 1, green: 0.54, blue: 0, alpha: 1), endColor: UIColor(red: 1, green: 0.18, blue: 0, alpha: 1))
        btn.caption = "Принять"
        btn.img.image = UIImage(named: "phoneOn")
        return btn
    }()
    
    let buttonsContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    override func loadView() {
        super.loadView()
        
        buttonsContainerView.addSubview(redBtn)
        buttonsContainerView.addSubview(moreBtn)
        buttonsContainerView.addSubview(acceptCallBtn)
        buttonsContainerView.addSubview(laterBtn)
        view.addSubview(buttonsContainerView)
        
    }
    
    override func viewDidLayoutSubviews() {
        
        buttonsContainerView.pin.bottom(20)
        
        redBtn.pin.bottom().left()
        laterBtn.pin.bottom().after(of: redBtn)
        moreBtn.pin.bottom().after(of: laterBtn)
        acceptCallBtn.pin.bottom().after(of: moreBtn)
        
        buttonsContainerView.pin.justify(.center).sizeToFit()
    }
    
}
