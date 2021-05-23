//
//  RegistrationVC.swift
//  CodeUI demo
//
//  Created by Nodirbek Maksumov on 10/05/21.
//

import UIKit
import PinLayout

class RegistrationVC: UIViewController {

    let sphere: UIView = {
       let circleView = UIView()
        //v makete shirina kruga bol'she no chtoby ne zamorachivat'sya delayu odinakovo s shirinoy ekrana
        circleView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        circleView.layer.cornerRadius = circleView.layer.bounds.width/2
        circleView.layer.backgroundColor = UIColor(red: 0.963, green: 0.958, blue: 1, alpha: 1).cgColor
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.layer.masksToBounds = true
        return circleView
    }()
    
    let smileImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Panel")
        //img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.pin.size(48)
        
        let smile = UIImageView()
        smile.image = UIImage(named: "Vector")
        smile.translatesAutoresizingMaskIntoConstraints = false
        smile.pin.size(26.67).all(10.67)
        
        img.addSubview(smile)
        img.layer.shadowColor = UIColor.blue.cgColor
        img.layer.shadowOpacity = 0.5
        img.layer.shadowRadius = 5
        img.layer.shadowOffset = CGSize(width: 0, height: 5)
                
        return img
    }()
    
    let helloLbl: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.93

        view.attributedText = NSMutableAttributedString(string: "Привет.\nНачнем регистрацию?", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let stepLbl: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.06
        view.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
        view.attributedText = NSMutableAttributedString(string: "Шаг первый", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //snizu teper' delayu elementy
    let okBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 10
        //btn.layer.borderWidth = 1
        //btn.layer.borderColor = UIColor.black.cgColor
        btn.setTitle("Продолжить", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOpacity = 0.3
        btn.layer.shadowRadius = 21
        btn.layer.shadowOffset = CGSize(width: 0, height: 5)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let warnLbl: UILabel = {
        var lbl = UILabel()

        lbl.textColor = UIColor(red: 0.412, green: 0.412, blue: 0.412, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.13

        // Line height: 16 pt

        lbl.attributedText = NSMutableAttributedString(string: "Создавая аккаунт вы соглашаетесь с обработкой персональных данных, условием использования и политикой приватности. ", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let strokeLine: UIView = {
        let line = UIView()
        
        line.pin.height(1).width(UIScreen.main.bounds.width)
        line.backgroundColor = UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1)
        return line
    }()
    
    let informLbl: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textColor = UIColor(red: 0, green: 0.1, blue: 1, alpha: 1)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.09
        view.attributedText = NSMutableAttributedString(string: "Отлично! Нажмите кнопку Продолжить", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    let smsCodeFld: UITextField = {
        let fld = UITextField()
        fld.layer.cornerRadius = 5
        fld.layer.borderWidth = 2
        fld.layer.borderColor = UIColor(red: 0, green: 0.1, blue: 1, alpha: 1).cgColor
        fld.backgroundColor = UIColor(red: 0, green: 0.1, blue: 1, alpha: 0.1)
        fld.translatesAutoresizingMaskIntoConstraints = false
        let rightLbl = UILabel()
        rightLbl.text = "✔︎  "
        rightLbl.pin.sizeToFit()
        fld.rightView = rightLbl
        fld.rightViewMode = .whileEditing
        return fld
    }()
    
    let fldCaptionLbl: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.06
        view.attributedText = NSMutableAttributedString(string: "Введите код из SMS", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.backgroundColor = UIColor.white.cgColor
        view.addSubview(sphere)
        view.addSubview(smileImg)
        view.addSubview(helloLbl)
        view.addSubview(stepLbl)
        view.addSubview(okBtn)
        view.addSubview(warnLbl)
        view.addSubview(strokeLine)
        view.addSubview(informLbl)
        view.addSubview(smsCodeFld)
        view.addSubview(fldCaptionLbl)

        okBtn.addTarget(self, action: #selector(self.okBtnPressed), for: .touchUpInside)
        
        //smileImg.pin.size(48)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        sphere.pin.left(-140).top(-100)
        smileImg.pin.top(86).left(16)
        
        helloLbl.pin.top(to: smileImg.edge.bottom).margin(24)
        helloLbl.pin.left(to: smileImg.edge.left)
        helloLbl.pin.sizeToFit(.content)
        
        stepLbl.pin.top(to: helloLbl.edge.bottom).margin(8)
        stepLbl.pin.left(to: helloLbl.edge.left)
        stepLbl.pin.sizeToFit()
        
        okBtn.pin.height(48)
        okBtn.pin.left(16).right(16)
        okBtn.pin.bottom(34)
        
        warnLbl.pin.left(16).right(16)
        warnLbl.pin.sizeToFit(.content)
        warnLbl.pin.above(of: okBtn).margin(21)
        
        strokeLine.pin.width(100%)
        strokeLine.pin.above(of: warnLbl).margin(21)
        
        informLbl.pin.sizeToFit(.content)
        informLbl.pin.left(16).right(16)
        informLbl.pin.above(of: strokeLine).margin(67)

        smsCodeFld.pin.left(16).right(16).height(48)
        smsCodeFld.pin.above(of: informLbl).margin(11)

        fldCaptionLbl.pin.sizeToFit()
        fldCaptionLbl.pin.left(16).right(16)
        fldCaptionLbl.pin.above(of: smsCodeFld).margin(14)

    }

    fileprivate func showMainTabController() {
        let vc1 = HarderVC(); vc1.view.backgroundColor = .white
        let vc2 = UIViewController(); vc2.view.backgroundColor = .yellow
        let vc3 = UIViewController(); vc3.view.backgroundColor = .orange
        
        let images = [
            UIImage(named: "tb1"),
            UIImage(named: "tb2"),
            UIImage(named: "tb3")
        ]
        let titles = [
            "Dialogi",
            "Akkaunt",
            "Nastroyki"
        ]
        
        let tabbar = UITabBarController()
        tabbar.modalPresentationStyle = .fullScreen
        tabbar.viewControllers = [
            vc1, vc2, vc3
        ]
        
        if let items = tabbar.tabBar.items {
            items[0].image = images[0]
            items[1].image = images[1]
            items[2].image = images[2]
            
            items[0].title = titles[0]
            items[1].title = titles[1]
            items[2].title = titles[2]
        }
        
        tabbar.tabBar.tintColor = UIColor.darkGray
        present(tabbar, animated: true, completion: nil)
    }
    
    fileprivate func showNumberVerifiedVC(){
        let vc = NumberVerifiedConfirmVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func okBtnPressed(){

        showNumberVerifiedVC()
        //showMainTabController()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
