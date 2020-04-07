//
//  ViewController.swift
//  ParityCubeSwift
//
//  Created by KiranKumar Gaware on 7/26/18.
//  Copyright © 2018 Xoriant Solutions pvt ltd. All rights reserved.
//

import UIKit
//Task1
//Login
class ViewController: UIViewController {
    @IBOutlet var viewModel: ViewModel!
   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchDeals {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) ->Int {
        return viewModel.numberOfItemsForSection(section: section)
    }
    
    func tableView(_ tableView: UITableView!, cellForRowAt indexPath: IndexPath!) -> UITableViewCell!
    {
        let cell: DealCell = tableView.dequeueReusableCell(withIdentifier: "DealCellID") as! DealCell
        //cell.textLabel.text="row#\(indexPath.row)"
        //cell.detailTextLabel.text="subtitle#\(indexPath.row)"
        cell.lblName.text = viewModel.titleForRowAtIndexpath(indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


