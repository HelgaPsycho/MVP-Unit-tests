//
//  RouterTest.swift
//  MVP + Unit testsTests
//
//  Created by Ольга Егорова on 24.02.2023.
//

import XCTest
@testable import MVP___Unit_tests

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

final class RouterTest: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController =  MockNavigationController()
    var assembly: AssemblyModuleBuilder!    

    override func setUp() {
        assembly = AssemblyModuleBuilder()
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDown() {
        router = nil
    }
    
    func testRouter(){
        router.showDetail(comment: nil)
        var detailViewControler = navigationController.presentedVC
        XCTAssertTrue(detailViewControler is DetailViewController)
        
        detailViewControler = assembly.createDetailModule(comment: nil, router: router)
        XCTAssertTrue(detailViewControler is DetailViewController)
        XCTAssertNotNil(detailViewControler)

    }

  

}
