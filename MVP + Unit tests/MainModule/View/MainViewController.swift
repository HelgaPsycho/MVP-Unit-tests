//
//  ViewController.swift
//  MVP + Unit tests
//
//  Created by Ольга Егорова on 19.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - IBOutlet
    

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comment = presenter.comments?[indexPath.row]
        cell.textLabel?.text = comment?.body
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter.comments?[indexPath.row]
        let detailViewController = ModulBuilder.createDetailModule(comment: comment)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension MainViewController: MainViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
    
}


