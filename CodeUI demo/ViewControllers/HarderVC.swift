//
//  HarderVC.swift
//  CodeUI demo
//
//  Created by Nodirbek Maksumov on 11/05/21.
//

import UIKit
import PinLayout

class HarderVC: UIViewController {

    //spisok uslovno podelen na dvoe, budet imitatsiya na soobscheniya segodnyashnie i vcherashnie
    let msgList =
        [
            [
                Message(phone: "+7 965 407 00 39", text: "Привет, увидел ваше объявление на Авито... ", time: "15:30", isPhoneCheked: true),
                Message(phone: "+7 988 350 22 16", text: "Это Пётр, у нас для вас предложение", time: "15:31", isPhoneCheked: true),
            ],
            [
                Message(phone: "+7 965 300 00 30", text: "Зашёл на ваш сайт, интересует прайс", time: "15:32", isPhoneCheked: false),
                Message(phone: "+7 988 350 22 16", text: "Это Пётр, у нас для вас предложение", time: "15:33", isPhoneCheked: true),
                Message(phone: "+7 965 300 00 30", text: "Зашёл на ваш сайт, интересует прайс", time: "15:34", isPhoneCheked: false)

            ]
        ]

    
    //Gradient layer
    let gl: CAGradientLayer = {
        let l = CAGradientLayer()
        l.colors = [
            UIColor(red: 1, green: 0.54, blue: 0, alpha: 1).cgColor,
            UIColor(red: 1, green: 0.18, blue: 0, alpha: 1).cgColor
          ]
        
        l.locations = [0, 1]
        
        return l
    }()
    
    let upperView: UIView = {
    
        let v = UIView()
        v.backgroundColor = UIColor(red: 1, green: 0.54, blue: 0, alpha: 1)
        return v
    }()
    
    let table: UITableView = {
        let tbl = UITableView(frame: CGRect.zero, style: .grouped)
        
        tbl.backgroundColor = UIColor.clear
        return tbl
    }()
    
    let shieldImg: UIImageView = {
        let sh = UIImageView()
        sh.image = UIImage(named: "shield")
        sh.pin.width(48).height(58.67)
        sh.layer.shadowOpacity = 0.4
        sh.layer.shadowOffset = CGSize(width: 0, height: 10)
        sh.layer.shadowRadius = 10
        sh.layer.shadowColor = UIColor.gray.cgColor
        return sh
    }()
    
    let helpLbl: UILabel = {
        let l = UILabel()
        l.text = "Помощь"
        l.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        l.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        return l
    }()
    
    let premiumLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        var paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineHeightMultiple = 1.39

        lbl.attributedText = NSMutableAttributedString(string: "PREMIUM", attributes: [NSAttributedString.Key.kern: 2, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return lbl
    }()
    
    let shevronImg: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "shevron")
        i.contentMode = .scaleAspectFit
        
        return i
    }()
    
    let serviceStatusLbl: UILabel = {
        let lb = UILabel()
        
        lb.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        lb.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        var paragraphStyle = NSMutableParagraphStyle()

        lb.attributedText = NSMutableAttributedString(string: "Сервис включен", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return lb
    }()
    
    let dialogCountLbl: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lb.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lb.text = "45 диалогов сегодня"
        lb.layer.backgroundColor = UIColor.clear.cgColor
        
        return lb
    }()
    
    let dialCountView: UIView = {
        let v = UIView()
        //v.frame = CGRect(x: 0, y: 0, width: 133, height: 30)
        v.layer.cornerRadius = 15
        v.backgroundColor = UIColor(red: 0.958, green: 0.348, blue: 0.004, alpha: 1)
        return v
    }()
    
    override func viewDidLayoutSubviews() {
        upperView.pin.top().hCenter().width(100%)
        upperView.pin.height(30%)
        
        gl.frame = upperView.frame
        
        shieldImg.pin.hCenter().vCenter(-10)
        helpLbl.pin.left(24).vCenter().sizeToFit()
        shevronImg.pin.right(24).vCenter().height(7).width(11)
        
        serviceStatusLbl.pin.below(of: shieldImg).margin(11.67).hCenter().sizeToFit()
        
        dialCountView.pin.hCenter().below(of: serviceStatusLbl).margin(9).width(140).height(30)
        
        dialogCountLbl.pin.sizeToFit().center()
        //dialCountView.pin.sizeToFit()
        
        premiumLbl.pin.before(of: shevronImg).vCenter().sizeToFit()
        
        table.pin.horizontally().below(of: upperView).bottom()
        
        //table.pin.left().right().bottom().below(of: upperView)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        upperView.layer.addSublayer(gl)
        upperView.addSubview(shieldImg)
        upperView.addSubview(helpLbl)
        upperView.addSubview(premiumLbl)
        upperView.addSubview(shevronImg)
        upperView.addSubview(serviceStatusLbl)
        dialCountView.addSubview(dialogCountLbl)
        upperView.addSubview(dialCountView)
        
        view.addSubview(upperView)
        view.addSubview(table)
        
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
        table.reloadData()
        
    }
}

extension HarderVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return msgList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DataTableViewCell(style: .default, reuseIdentifier: nil)
        cell.set(msg: msgList[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // The UITableView will call the cell's sizeThatFit() method to compute the height.
        // WANRING: You must also set the UITableView.estimatedRowHeight for this to work.
        return 90
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Cегодня"
        } else {
            return "Вчера"
        }
    }
}

