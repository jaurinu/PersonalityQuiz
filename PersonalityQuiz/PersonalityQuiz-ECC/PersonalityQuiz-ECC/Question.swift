//
//  Question.swift
//  PersonalityQuiz-ECC
//
//  Created by Apple Device 9 on 10/19/19.
//  Copyright © 2019 Squad-Dios. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single
    case multiple
    case ranged
}
