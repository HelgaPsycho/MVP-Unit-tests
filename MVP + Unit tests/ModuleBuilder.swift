//
//  ModuleBuilder.swift
//  MVP + Unit tests
//
//  Created by Ольга Егорова on 19.02.2023.
//

import Foundation
import UIKit

protocol Buider {
    static func createMain()-> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController
}

class ModulBuilder: Buider {
    static func createMain() -> UIViewController {
        let networkService = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    
    static func createDetailModule(comment: Comment?) -> UIViewController {
        let networkService = NetworkService()
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, networkservice: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
    
    
    
}
