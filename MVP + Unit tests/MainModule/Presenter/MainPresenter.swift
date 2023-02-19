//
//  MainPresenter.swift
//  MVP + Unit tests
//
//  Created by Ольга Егорова on 19.02.2023.
//

import Foundation

protocol MainViewProtocol: class {
    //пишем ключевое слова  class чтобы ссылку можно было сделать слабой
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
    
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
    
    
}

