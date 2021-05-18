//
//  DataTableViewCell.swift
//  CodeUI demo
//
//  Created by Nodirbek Maksumov on 12/05/21.
//

import UIKit
import PinLayout

class DataTableViewCell: UITableViewCell {

    let phoneNum: UILabel = {
        let l = UILabel()
        l.textColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
        l.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.09

        // Line height: 18 pt
        // (identical to box height)

        //l.attributedText = NSMutableAttributedString(string: "+7 965 407 00 39", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let checkedImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let timeLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.09
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let msgLbl: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white

        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.09
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: nil)
        contentView.addSubview(phoneNum)
        contentView.addSubview(checkedImg)
        contentView.addSubview(timeLbl)
        contentView.addSubview(msgLbl)
        
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        contentView.addSubview(phoneNum)
//        contentView.addSubview(checkedImg)
//        contentView.addSubview(timeLbl)
//        contentView.addSubview(msgLbl)
//        // Initialization code
//    }

    func set(msg: Message){
        self.phoneNum.text = msg.phoneNumber
        
        if msg.isPhoneCheked {
            checkedImg.image = UIImage(named: "chekedActive")
        } else {
            checkedImg.image = UIImage(named: "chekedDisabled")
        }
        
        msgLbl.text = msg.text
        timeLbl.text = msg.time
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //print("layoutcell rabotaet")
        phoneNum.pin.left(16).top(24).sizeToFit()
        checkedImg.pin.after(of: phoneNum).margin(4).size(12).centerLeft(to: phoneNum.anchor.centerRight)
        
        timeLbl.pin.top(24).right(16).sizeToFit()
        
        msgLbl.pin.left(16).below(of: phoneNum).margin(7).sizeToFit().bottom(23)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
