//
//  Answer.swift
//  PersonalityQuiz-ECC
//
//  Created by Apple Device 9 on 10/19/19.
//  Copyright © 2019 Squad-Dios. All rights reserved.
//

import Foundation

struct Answer {
    var text: String
    var type: Type
}

enum Type {
    case front, back, fullstack
    
    var definition: String {
        switch self {
        case .front:
            return "Eres front"
        case .back:
            return "Eres back"
        case .fullstack:
            return "Eres fullStack"
        }
    }
}
