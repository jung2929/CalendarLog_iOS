//
//  UserInfoInteractor.swift
//  calendarlog
//
//  Created by JerryJung on 2018. 7. 5..
//  Copyright © 2018년 penguinexpedition. All rights reserved.
//

class UserInfoInteractor: UserInfoInteractorInputProtocol {
    var presenter: UserInfoInteractorOutputProtocol?
    var remoteDatamanager: UserInfoRemoteDataManagerInputProtocol?
    
}

extension UserInfoInteractor: UserInfoRemoteDataManagerOutputProtocol {
    func onError(_ message: String) {
        presenter?.onError(message)
    }
}
