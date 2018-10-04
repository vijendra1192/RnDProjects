//
//  CustomVC.swift
//  RnDProjects
//
//  Created by Vijendra  on 04/10/18.
//  Copyright © 2018 Vijendra . All rights reserved.
//

import UIKit

class CustomVC: UIViewController {

    @IBOutlet weak var customTableView: UITableView!
    
    
    var dataArr : Array<Any>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        customTableView.delegate = self
        customTableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
}

extension CustomVC : UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return (dataArr?.count)!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataArr![section] as AnyObject).count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "MyProfileTableViewCell") as? MyProfileTableViewCell
        
        
        return profileCell!
    }
}
