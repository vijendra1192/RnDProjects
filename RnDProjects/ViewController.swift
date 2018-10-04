//
//  ViewController.swift
//  RnDProjects
//
//  Created by Vijendra  on 29/09/18.
//  Copyright © 2018 Vijendra . All rights reserved.
//

import UIKit

struct StatusStruct {
    var status : String?
    var name : String?
}

struct Section {
    var title : String
    var cell : [StatusStruct]?
}

enum TableState {
    case noData
    case loaded
    case error
}


class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var customTableView: UITableView!
    
    //MARK: Properties
    let statusDataArr = [[StatusStruct(status: "1", name: "section1"),
                         StatusStruct(status: "2", name: "section1"),
                         StatusStruct(status: "3", name: "section1"),
                         StatusStruct(status: "4", name: "section1"),
                         StatusStruct(status: "5", name: "section1"),
                         StatusStruct(status: "6", name: "section1"),
                         StatusStruct(status: "6", name: "")],
                         [
                        StatusStruct(status: "1", name: "section2"),
                        StatusStruct(status: "2", name: "section2"),
                        StatusStruct(status: "3", name: "section2"),
                        StatusStruct(status: "4", name: "section2"),
                        StatusStruct(status: "5", name: "section2"),
                        StatusStruct(status: "6", name: "")],
                         [
                            StatusStruct(status: "1", name: "section3"),
                            StatusStruct(status: "2", name: "section3"),
                            StatusStruct(status: "3", name: "section3"),
                            StatusStruct(status: "4", name: "section3"),
                            StatusStruct(status: "5", name: "")]
                         ]
    
    var sections = [Section(title: "sec1", cell: nil),
                    Section(title: "sec2", cell: nil),
                    Section(title: "sec3", cell: nil)];
    
    var tableState : TableState = .noData
    {
        didSet
            {
                switch tableState
                {
                    case TableState.noData:
                    print("Data loaded")
                    break
                    
                    case TableState.loaded: break
                    
                    case TableState.error: break
                    
                }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customTableView.delegate = self
        self.customTableView.dataSource = self
        self.customTableView.rowHeight = 60
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return statusDataArr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return statusDataArr[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell_ = tableView.dequeueReusableCell(withIdentifier: "StatusTableViewCell") as? StatusTableViewCell
        
        cell_?.statuses = statusDataArr[indexPath.section][indexPath.row]
        
        return cell_!
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return sections[section].title
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("selected item is \(statusDataArr[indexPath.section][indexPath.row])")
        self.tableState = TableState.loaded
    }
}
