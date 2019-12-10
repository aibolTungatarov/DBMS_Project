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
    var universities: [University]
}
