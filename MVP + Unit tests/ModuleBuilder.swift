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
}

class ModulBuilder: Buider {
    static func createMain() -> UIViewController {
        let model = Person(firstName: "David", lastName: "Blain")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
    
    
}
