//
//  Constants.swift
//  DBMS_Project
//
//  Created by Aibol Tungatarov on 11/28/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

import UIKit

public struct Constants {
    
    static let ERROR_EMPTY_USERNAME = "Please enter an username"
    static let ERROR_EMPTY_PASSWORD = "Please enter a password"
    static let mainColor = UIColor.rgbColor(r: 61, g: 64, b: 113, alpha: 1)
    
    struct ProductionServer {
        static let baseURL = "http://130.61.58.200/api/v1/univer/"
        //get poster_path for image
        static let imageURL = "https://image.tmdb.org/t/p/w185/"
        //for detailedMovie
        static let imageURLwithoutWidth = "https://image.tmdb.org/t/p/"
    }
    struct APIParameterKey {
        static let apiKey = "1421b5c6c77c709c5b2f89d8caddf128"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case apiKey = "api_key"
}

enum ContentType: String {
    case json = "application/json; charset=utf-8"
}

enum AutocompleteTextFieldType: String {
    case city = "City"
    case firstSubject = "First Subject"
    case secondSubject = "Second Subject"
}
