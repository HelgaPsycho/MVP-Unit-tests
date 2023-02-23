//
//  ModuleBuilder.swift
//  MVP + Unit tests
//
//  Created by Ольга Егорова on 19.02.2023.
//

import Foundation
import UIKit

protocol AssemblyBuiderProtocol {
    func createMainModule(router: RouterProtocol)-> UIViewController
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuiderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let networkService = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let networkService = NetworkService()
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, networkservice: networkService, router: router, comment: comment)
        view.presenter = presenter
        return view
    }
    
    
    
}
