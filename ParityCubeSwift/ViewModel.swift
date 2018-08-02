//
//  ViewModel.swift
//  ParityCubeSwift
//
//  Created by KiranKumar Gaware on 8/2/18.
//  Copyright © 2018 Xoriant Solutions pvt ltd. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    @IBOutlet var dealsClient: DealsClient!
    var deals : [NSDictionary]?
    func fetchDeals(completion: @escaping () -> ()) {
        dealsClient.fetchDeals { arrayOfDict in
            self.deals = arrayOfDict
            completion()
        }
    }
    
    func numberOfItemsForSection(section: Int) -> Int {
        return self.deals?.count ?? 0
    }
    
    func titleForRowAtIndexpath(indexPath: IndexPath) -> String{
        return self.deals?[indexPath.row].value(forKey: "name") as! String
    }
}
