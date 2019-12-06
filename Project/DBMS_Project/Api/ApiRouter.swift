//
//  ApiRouter.swift
//  DBMS_Project
//
//  Created by Aibol Tungatarov on 11/28/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.


// recommendations/?first_subject=a&second_subject=b&city=ALL

import Foundation

enum ApiRouter: ApiRequest {
    case getList(page: Int)
    case getRecommendations(firstSubject: String, secondSubject: String, city: String)
    
    var path: String {
        switch self {
        case .getList:
            return "movie/popular"
        case .getRecommendations:
            return "recommendations/"
        }
    }
    
    var parameters: [String : String] {
        switch self {
        case .getList(let page):
            return ["page": String(page), HTTPHeaderField.apiKey.rawValue: Constants.APIParameterKey.apiKey]
        case .getRecommendations(let firstSubject, let secondSubject, let city):
            return ["first_subject":firstSubject, "second_subject":secondSubject, "city": city]
        }
        
    }
    
    var method: RequestType {
        switch self {
        case .getList, .getRecommendations:
            return .GET
        }
    }
    
    func asURLRequest() -> URLRequest {
        let baseUrl = URL(string: Constants.ProductionServer.baseURL)!.appendingPathComponent(path)
        guard var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false) else { fatalError("Couldn't create url components") }
        components.queryItems = parameters.map {
            URLQueryItem(name: $0, value: $1)
        }
        guard let url = components.url else { fatalError("Couldn't get url") }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}

