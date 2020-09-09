//
//  BlockListManager.swift
//  qasem_xib-example
//
//  Created by Qasem Zreaq on 9/7/20.
//  Copyright © 2020 Qasem Zreaq. All rights reserved.
//

import Foundation
import UIKit

protocol blockListManager {

    func updataBlockListTable (_ blockModel : CurrentUserBlockListModel)
    
}

class BlockListManager  {

     var Blockdelegate : blockListManager?
    
     func blockList (offset: String, limit:String) {
        
     let Url = String(format: "http://momyt.website/api/user/blockList/\(offset)/\(limit)")
     guard let serviceUrl = URL(string: Url) else { return }
    
     var request = URLRequest(url: serviceUrl)
     request.httpMethod = "GET"
     request.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRkNzQ1MjdjODFmYWU0MjhjMGUzZTBhYjlkOGU5NmU5MWJhODY5ZDIzOWY4Njg2OTA3Nzg2YjAxYTk3NmVmN2Q5ZmI1NWE0Yzk1ODA4YTlkIn0.eyJhdWQiOiIxIiwianRpIjoiZGQ3NDUyN2M4MWZhZTQyOGMwZTNlMGFiOWQ4ZTk2ZTkxYmE4NjlkMjM5Zjg2ODY5MDc3ODZiMDFhOTc2ZWY3ZDlmYjU1YTRjOTU4MDhhOWQiLCJpYXQiOjE1OTkzOTcwNDQsIm5iZiI6MTU5OTM5NzA0NCwiZXhwIjoxNjMwOTMzMDQzLCJzdWIiOiI0MSIsInNjb3BlcyI6W119.lXdQtp6G5zcF3oHbmJ8OZ5XfFlGC-dceo9l8EZ-R7F0ySkBguIHaZSeXHc2aJwDyTmgT94pBgKugpci7vgqTRg8FEdTgvsB6JZtBiZtJdjcnFqCyEXgPSH66RLyF8a8TqR8P8Xq3xXTqngZiMOsTrmaFA5zfmUZGmIU_PZyf7T2_ejKVqHe_JReGcG4saIw0KNy59BAGHKR-nn21u4laxxwTmnAiyJcIk7qCrurlANsLNNJXN_98QdfNe6zFpupwYpLnKRyd29igxIuQyumrPaz8_zVY6c7pHUSDlSrJwdbMNJsqEq71F8Y1R0P4GKPz21GG4WgShb_Za18dQwnvf2nIJq-ePT2ZfH-BnbkcfzwbBx5Bp3FQQkYooTGp8K1qGMdmMpduFt8pJtVPKmi0DUf9U4JzWdRPPG-XFXsN6kK4c2mAxJsLPR3sr4mAPcY657tfmLa6s2LXdmLjFjgukMk_LSmwCVr-ftdKqEiWZpehBGgnQCVo38WNroRsDHp7cWdHYGzq2GHe7m9BcNmnlqxbQ_3RiuZqLYmjJRUvekP_XTsqypjTcBDkW9o9Z4DuBlIoz6kzEo9bDND0J4BMM2OTT4t3olkYrlKNtfwpYMXldbkv9CiC8PlfkFNqQQRnylWLHRbSfH5W7pC7xLn5qz8a4BtK9mWnHPjySLnMYik", forHTTPHeaderField: "Authorization")
       // request.setValue("application/json", forHTTPHeaderField: "Authorization")

     request.setValue("application/json", forHTTPHeaderField: "Content-Type")
     request.timeoutInterval = 10
     let session = URLSession.shared
     session.dataTask(with: request) { (data, response, error) in
        
         if let safeData = data {
             do {
                if let blockList =  self.parseJSON(safeData)  {
                    
                    self.Blockdelegate?.updataBlockListTable(blockList)
                 //   print(blockList.users)
                }
                    
                 let json = try JSONSerialization.jsonObject(with: safeData, options: [])
                 print(json)
             } catch {
                 print(error)
             }
         }
     }.resume()
    }
    
    
    func parseJSON(_ blockdata: Data) -> CurrentUserBlockListModel? {
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode([String: CurrentUserBlockList].self, from: blockdata)
            let myModel = decodedData["blocked_list"]!
            let usersArray = myModel.users
            let count = myModel.total
            let neededModel = CurrentUserBlockListModel(users: usersArray, total: count)
            return neededModel
            
        } catch {
            
            print(error)
            
            return nil
        }
        
    }

    
}
