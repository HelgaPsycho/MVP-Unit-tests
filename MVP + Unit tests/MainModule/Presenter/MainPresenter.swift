//
//  MainPresenter.swift
//  MVP + Unit tests
//
//  Created by Ольга Егорова on 19.02.2023.
//

import Foundation

protocol MainViewProtocol: class {
    //протокол на выход
    //пишем ключевое слова  class чтобы ссылку можно было сделать слабой
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: class {
    //протокол на вход
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? {get set}
    func tapTheComment(comment: Comment?)

}

class MainPresenter: MainViewPresenterProtocol {
  
    var comments: [Comment]?
    var router: RouterProtocol?
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol
    
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.router = router
        self.view = view
        self.networkService = networkService
        getComments()
    }
    
    func tapTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
        
    
    func getComments() {
        networkService.getComments{[weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
            
        }
    }

    
}

