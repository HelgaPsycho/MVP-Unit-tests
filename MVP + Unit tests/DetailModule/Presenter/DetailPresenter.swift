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
    init(view: DetailViewProtocol, networkservice: NetworkService, comment: Comment?)
    
    func setComment()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    var networkService: NetworkServiceProtocol! = nil
    var comment: Comment?
    
    required init(view: DetailViewProtocol, networkservice: NetworkService, comment: Comment?) {
        self.view = view
        self.networkService = networkservice
        self.comment = comment
    }
    
    func setComment() {
        self.view?.setComment(comment: comment)
    }
    
}
