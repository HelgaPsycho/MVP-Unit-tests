//
//  DetailPresenter.swift
//  MVP + Unit tests
//
//  Created by Ольга Егорова on 20.02.2023.
//

import Foundation

protocol DetailViewProtocol: class {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol {
    init(view: DetailViewProtocol, networkservice: NetworkService,  router: RouterProtocol, comment: Comment?)
    
    func setComment()
    func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    var networkService: NetworkServiceProtocol! = nil
    var comment: Comment?
    
    required init(view: DetailViewProtocol, networkservice: NetworkService, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkservice
        self.comment = comment
        self.router = router
    }
    
    func tap() {
        router?.popToRoot()
    }
    
    func setComment() {
        self.view?.setComment(comment: comment)
    }
    
}
