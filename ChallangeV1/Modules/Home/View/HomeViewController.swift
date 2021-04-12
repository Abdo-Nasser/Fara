//
//  HomeViewController.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    //Attributes
    var presenter: HomePresenterProtocol?

    //OutLets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.attach()
    }
    
    func setupUI(){
        registerCell()
        setupDelegates()
    }
}

//MARK: - HomeViewControllerProtocol
extension HomeViewController: HomeViewControllerProtocol {
    
    func showLoading(_ show: Bool){
        if show {
            showIndicatorAnimation()
        }else{
            hideIndicatorAnimation()
        }
    }
    
    func UpdateUI(){
        tableView.reloadData()
    }
}

//MARK: - TableView Delegate & DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func registerCell(){
        let homeNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(homeNib, forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    func setupDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.viewModel.listOfUsers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let user = presenter?.viewModel.listOfUsers[indexPath.row] ?? User()
        cell.configure(user: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = presenter?.viewModel.listOfUsers[indexPath.row] ?? User()
        presenter?.openUserProfile(user: user) 
    }
}
