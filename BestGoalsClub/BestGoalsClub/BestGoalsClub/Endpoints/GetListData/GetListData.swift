//
//  GetListData.swift
//  BestGoalsClub
//
//  Created by Rost on 10.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class GetListData {
        
    /// ---> Function for load data from API <--- ///
    static func loadList(_ url: String, completion: ((_ response: AnyObject) -> Void)?) {
        guard let resultUrl = URL(string: url) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: resultUrl)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                completion!(error as AnyObject)
                
                return
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                let result = JsonHandler.handleData(data)
                
                DispatchQueue.main.async {
                    completion!(result as AnyObject)
                }
            }
        })
        
        task.resume()
    }
}
