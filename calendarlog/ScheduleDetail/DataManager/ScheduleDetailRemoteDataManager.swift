//
//  ScheduleDetailRemoteDataManager.swift
//  calendarlog
//
//  Created by JerryJung on 2018. 7. 5..
//  Copyright © 2018년 penguinexpedition. All rights reserved.
//

import Alamofire

class ScheduleDetailRemoteDataManager: ScheduleDetailRemoteDataManagerInputProtocol {
    var remoteRequestHandler: ScheduleDetailRemoteDataManagerOutputProtocol?
    
    func retrieveScheduleDetail(_ email: String, _ sequence: Int) {
        ()
    }
}
