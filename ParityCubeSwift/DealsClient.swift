//
//  DealsClient.swift
//  ParityCubeSwift
//
//  Created by KiranKumar Gaware on 8/2/18.
//  Copyright © 2018 Xoriant Solutions pvt ltd. All rights reserved.
//

import UIKit
import Foundation
//Pin task
class DealsClient: NSObject {

    func fetchDeals(completion:@escaping (_ deals: [NSDictionary])-> ()) {
        
        guard let requestURL = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses") else {
            print("Fatal Error")
            return
        }
        
//        var request = URLRequest(url: requestURL)
//        request.httpMethod = "POST"
//
//        var headers = request.allHTTPHeaderFields ?? [:]
//        headers["Accept"] = "application/json"
//        headers["Accept"] = "text/javascript"
//        request.allHTTPHeaderFields = headers

//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
        
        URLSession.shared.dataTask(with: requestURL) { (data, urlResponse, error) in
            if error != nil {
                
            }else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: [.mutableContainers]) as? [NSDictionary] {
                        print(json)
                        completion((json as? [NSDictionary])!)
                    }
                }catch let tempError as NSError {
                    print("Failed to load: \(tempError.localizedDescription)")
                }
                
            }
        }.resume()
//        let dataTask = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
//            if error != nil {
//
//            }else {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data!, options: [.mutableContainers])
//                    print(json)
//                }catch let tempError as NSError {
//                    print("Failed to load: \(tempError.localizedDescription)")
//                }
//
//            }
        
            
        
 //       }
    
        
    }
}
