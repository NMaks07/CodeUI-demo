//
//  Message.swift
//  CodeUI demo
//
//  Created by Nodirbek Maksumov on 12/05/21.
//

import Foundation

struct Message: Codable {
    var phoneNumber: String
    var text: String!
    var time: String
    var isPhoneCheked:Bool
    
    init(phone: String, text: String?, time: String, isPhoneCheked: Bool) {
        self.phoneNumber = phone
        self.text = text
        self.time = time
        self.isPhoneCheked = isPhoneCheked
    }
}
