//
//  Speciality.swift
//  DBMS_Project
//
//  Created by Aibol Tungatarov on 12/9/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

import Foundation

struct Speciality: Codable {
    var name: String
    var code: String
    var description: String
    var universities: [University]
    var total_grant: Int
    var grant_rus: Int
    var grant_kaz: Int
}
