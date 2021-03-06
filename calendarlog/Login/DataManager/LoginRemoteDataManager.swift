//
//  LoginRemoteDataManager.swift
//  calendarlog
//
//  Created by JerryJung on 2018. 5. 24..
//  Copyright © 2018년 penguinexpedition. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class LoginRemoteDataManager: LoginRemoteDataManagerInputProtocol {
    var remoteRequestHandler: LoginRemoteDataManagerOutputProtocol?
    
    func retrieveEmail(_ email: String) {
        let parameters: Parameters = ["email": email]
        Alamofire
            .request("\(API.baseUrl)login", method: .get, parameters: parameters)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<DefaultResponse>) in
                switch response.result {
                case .success(let defaultResponse):
                    if defaultResponse.isSuccess {
                        self.remoteRequestHandler?.onLoginEmailRetrieved()
                    } else {
                        if defaultResponse.message.count > 0 {
                            self.remoteRequestHandler?.onErrorForEmail(with: defaultResponse.message)
                        } else {
                            self.remoteRequestHandler?.onLoginEmailNotRetrieved(email)
                        }
                    }
                case .failure:
                    self.remoteRequestHandler?.onErrorForEmail(with: "이메일 확인에 실패하였습니다.")
                }
            })
    }
    
    func tryLogin(_ email: String, _ password: String) {
        let parameters: Parameters = ["email": email, "password": password]
        Alamofire
            .request("\(API.baseUrl)login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<DefaultResponse>) in
                switch response.result {
                case .success(let defaultResponse):
                    if defaultResponse.isSuccess {
                        self.remoteRequestHandler?.onLoginSuccess(email, password)
                    } else {
                        self.remoteRequestHandler?.onErrorForPassword(with: defaultResponse.message)
                    }
                case .failure:
                    self.remoteRequestHandler?.onErrorForPassword(with: "로그인에 실패하였습니다.")
                }
            })
    }
}
