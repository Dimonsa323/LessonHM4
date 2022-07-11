//
//  UserInfo.swift
//  LessonHM4
//
//  Created by Дима Губеня on 09.07.2022.
//

import Foundation

struct UserInfo {
    let login: String
    let password: String
    
    static func createUser() -> UserInfo {
        return UserInfo(login: "dima", password: "dima7")
    }
}

