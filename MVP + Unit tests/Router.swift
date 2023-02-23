//
//  RouterProtocol.swift
//  MVP + Unit tests
//
//  Created by Ольга Егорова on 23.02.2023.
//

import Foundation
import UIKit

protocol RouterMain {
    //общий протокол для всех роутеров
    //каждый роутер должен иметь свой navigationController
    
    var navigationController: UINavigationController? {get set}
    var assemblyBuilder: AssemblyBuiderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    //протокол для конкретного роутера
    func initViewController()
    func showDetail(comment: Comment?)
    func popToRoot()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    
    var assemblyBuilder: AssemblyBuiderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuiderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    
    func initViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else {return}
            navigationController.viewControllers = [mainViewController]
            }
        }

    
    func showDetail(comment: Comment?) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailModule(comment: comment, router:  self) else {return}
            navigationController.pushViewController(detailViewController, animated: true)
            }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }

    
}
