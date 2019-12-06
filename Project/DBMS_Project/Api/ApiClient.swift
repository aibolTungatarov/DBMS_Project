//
//  ApiClient.swift
//  DBMS_Project
//
//  Created by Aibol Tungatarov on 11/28/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import SVProgressHUD
class ApiClient {
    static let shared = ApiClient()
    func request<T: Codable>(_ apiRouter: ApiRouter) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRouter.asURLRequest()
            SVProgressHUD.show()
            Alamofire.request(request)
                .validate()
                .responseJSON { response in
                    SVProgressHUD.dismiss()
                    print(response.description)
                    if response.description.range(of: "-1009") != nil {
                        SVProgressHUD.dismiss()
                        print("No internet connection")
                        return
                    }
                    print("Request: ", request)
                    print("Request Type: ", apiRouter.method)
                    print("Status Code: ", response.response?.statusCode)
                    print("---------------------------")
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            return
                        }
                        do {
                            let model: T = try JSONDecoder().decode(T.self, from: data)
                            
                            observer.onNext(model)
                            
                        } catch let error {
                            
                            observer.onError(error)
                        }
                        
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode {
                            observer.onError(error)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getAccessToken() -> String {
        if let accessToken =  UserDefaults.standard.value(forKey: "requestToken") as? String {
            return accessToken
        } else {
            return ""
        }
    }
}

