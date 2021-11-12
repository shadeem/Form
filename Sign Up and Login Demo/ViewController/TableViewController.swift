//
//  TableViewController.swift
//  Sign Up and Login Demo
//
//  Created by Sheraz Hussain on 10/11/2021.
//  Copyright © 2021 Sheraz Hussain. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var mydata = File()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBarr: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //searchBarDesign()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mydata.nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
             let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
             cell.myImageView.image = UIImage(named: mydata.imageArray[indexPath.row])
             cell.myNameLabel.text = mydata.nameArray[indexPath.row]
             cell.mylabel.text = mydata.labelArray[indexPath.row]
             return cell
         }
    
    
    func searchBarDesign() {
        //searchBarr.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //searchBarr.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        //searchBarr.heightAnchor.constraint(equalToConstant: 42).isActive = true
        //searchBarr.widthAnchor.constraint(equalToConstant: 265).isActive = true
        //searchBarr.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    
}


