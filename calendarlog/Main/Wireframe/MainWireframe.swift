//
//  MainWireframe.swift
//  calendarlog
//
//  Created by JerryJung on 2018. 5. 28..
//  Copyright © 2018년 penguinexpedition. All rights reserved.
//

class MainWireframe: MainWireFrameProtocol {
    class func createMainModule() -> MainView {
        let view = MainView()
        //let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
        let presenter: MainPresenterProtocol = MainPresenter()
//        let interactor: RegisterInteractorInputProtocol & RegisterRemoteDataManagerOutputProtocol = RegisterInteractor()
//        let remoteDataManager: RegisterRemoteDataManagerInputProtocol = RegisterRemoteDataManager()
        let wireFrame: MainWireFrameProtocol = MainWireframe()
//
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
//        presenter.interactor = interactor
//        interactor.presenter = presenter
//        interactor.remoteDatamanager = remoteDataManager
//        remoteDataManager.remoteRequestHandler = interactor
        
        return view
    }
}
