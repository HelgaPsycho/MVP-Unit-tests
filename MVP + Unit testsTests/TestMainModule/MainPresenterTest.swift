//
//  MainPresenterTest.swift
//  MVP + Unit testsTests
//
//  Created by Ольга Егорова on 19.02.2023.
//

import XCTest
@testable import MVP___Unit_tests

class MockView: MainViewProtocol {
    func success() {
        
    }
    
    func failure(error: Error) {
        
    }
    
}

class MockNetworkService: NetworkServiceProtocol {
    var comments: [Comment]!
    
    init() {}
    
    convenience init(comments: [Comment]?){
        self.init()
        self.comments = comments
    }
    
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
    
    
}

final class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var  comments = [Comment]()
    
    override func setUp() {
       let nav = UINavigationController()
        let asseblyBuilder = AssemblyModuleBuilder()
        
        router = Router(navigationController: nav, assemblyBuilder: asseblyBuilder)
    }

    override func tearDown() {
        //тест, который вызывается по окончанию теста, в нем принято nil-ить объекты
        view = nil
        presenter = nil
        networkService = nil
    }

    func testGetSuccessComments(){
        let comment = Comment(postId: 1, id: 1, name: "Foo", email: "Bar", body: "Baz")
        comments.append(comment)
        view = MockView()
        networkService = MockNetworkService(comments: [comment])
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchComments: [Comment]?
        
        networkService.getComments{result in
            switch result {
            case .success(let comments):
               catchComments = comments
            case .failure(let error):
                print(error)
            }
        }
    
        XCTAssertNotNil(catchComments?.count, "0")
        XCTAssertEqual(catchComments?.count, comments.count)
    }
    
    func testGetFailureComments(){
        let comment = Comment(postId: 1, id: 1, name: "Foo", email: "Bar", body: "Baz")
        comments.append(comment)
        view = MockView()
        networkService = MockNetworkService()
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchError: Error?
        
        networkService.getComments{result in
            switch result {
            case .success( _):
               break
            case .failure(let error):
                catchError = error
            }
        }
    
        XCTAssertNotNil(catchError)
    }

}
