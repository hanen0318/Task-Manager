//
//  UsersListViewController.swift
//  TaskManager
//
//  Created by Daniel Carvalho on 23/10/22.
//

import UIKit

protocol UsersListViewControllerDelegate {
    
    func userListViewController( selectedUser user : UserModel )
    
}






class UsersListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var delegate : UsersListViewControllerDelegate?

    @IBOutlet var tableView : UITableView!
    @IBOutlet var actBusy : UIActivityIndicatorView!
    @IBOutlet var txtSearch : UITextField!
    var displayUsers = [UserModel]()
    
    @IBAction func SearchUser(_ sender: Any) {
        displayUsers = []
            let users = DataSource.allUsers
            
            if txtSearch.text!.isEmpty {
                displayUsers = DataSource.allUsers
                tableView.reloadData()
                return
            }
            
            for user in users {
                if user.email.contains(txtSearch.text!) || user.name.contains(txtSearch.text!) {
                    displayUsers.append(user)
                }
            }
            
            tableView.reloadData()
            
        }
    
    
    
   
    private var busy : Bool = false {
        didSet{
            DispatchQueue.main.async {
                if self.busy {
                    self.actBusy.isHidden = false
                    self.actBusy.startAnimating()
                } else {
                    self.actBusy.isHidden = true
                    self.actBusy.stopAnimating()
                }
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customizeView()
        
        initialize()
        
        /*
        textfield.addTarget(self, action: #selector(searchUsers), for:  .editingChanged)
        textfield.delegate = self
        */
    
    }
    /*
    @objc func searchUsers(sender: UITextField){
        self.filteredUser.removeAll()
        let searchData:Int = textfield.text!.count
        
        if searchData != 0{
            searching = true
            var i : Int = 0
            for user in AllUsers.self{
                if let usertosearch = textfield.text{
                    
                    
            }
        }
    }
     */
     
    
    func initialize() {
        
        displayUsers=DataSource.allUsers
        tableView.delegate = self
        tableView.dataSource = self
        
        //register for the nb
        
        tableView.register(UINib(nibName: UserTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier)
        
    }

    func customizeView() {
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        
        
        //cell.textLabel!.text = DataSource.allUsers[indexPath.row].name.capitalized
        
        cell.setContent(user: displayUsers[indexPath.row])
        cell.imgstar.image = nil
        
        
        if displayUsers[indexPath.row].uid == Session.loggedUser!.uid {
            
            cell.imgstar.image = UIImage(systemName: "star.fill")
            cell.imgstar.tintColor = UIColor.yellow

        }
        
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayUsers.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedUser = displayUsers[indexPath.row]
        
        if delegate != nil {
            delegate!.userListViewController(selectedUser: selectedUser)
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
