//
//  ViewController.swift
//  MVP + Unit tests
//
//  Created by Ольга Егорова on 19.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - IBOutlet
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButtonAction(_ sender: Any){
        self.presenter.showGreeting()
    }

}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
    
    
}


