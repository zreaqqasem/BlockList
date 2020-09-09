
import Foundation
import UIKit

 final class UserManager {
    
    
   static let parameters = ["name": "qasem", "password":"123sss"]

    //MARK:- sign in usrer
    
    static func signin () {
        
                      
                      let url = URL(string: "http://momyt.website/api/signin")! //change the url
                      //create the session object
                      let session = URLSession.shared
                      //now create the URLRequest object using the url object
                      var request = URLRequest(url: url)
                      request.httpMethod = "POST" //set http method as POST

                      do {
                          request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
                      } catch let error {
                          print(error.localizedDescription)
                      }
        
                      request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                      request.addValue("application/json", forHTTPHeaderField: "Accept")
                      //create dataTask using the session object to send data to the server
                      let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

                          guard error == nil else {
                              return
                          }

                          guard let data = data else {
                              return
                          }

                          do {
                              //create json object from data
                              if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                                  print(json)
                                
                                  // handle json...
                              }
                          } catch let error {
                              print(error.localizedDescription)
                          }
                      })
                      task.resume()
    }
    
    
    
    
    //MARK:- block user
    
    static func blockUser (userId: String) {
        
            
           //create the url with URL
           let url = URL(string: "http://momyt.website/api/user/\(userId)/block")! //change the url
           //create the session object
           let session = URLSession.shared
           //now create the URLRequest object using the url object
           var request = URLRequest(url: url)
           request.httpMethod = "GET" //set http method as POST
           request.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRkNzQ1MjdjODFmYWU0MjhjMGUzZTBhYjlkOGU5NmU5MWJhODY5ZDIzOWY4Njg2OTA3Nzg2YjAxYTk3NmVmN2Q5ZmI1NWE0Yzk1ODA4YTlkIn0.eyJhdWQiOiIxIiwianRpIjoiZGQ3NDUyN2M4MWZhZTQyOGMwZTNlMGFiOWQ4ZTk2ZTkxYmE4NjlkMjM5Zjg2ODY5MDc3ODZiMDFhOTc2ZWY3ZDlmYjU1YTRjOTU4MDhhOWQiLCJpYXQiOjE1OTkzOTcwNDQsIm5iZiI6MTU5OTM5NzA0NCwiZXhwIjoxNjMwOTMzMDQzLCJzdWIiOiI0MSIsInNjb3BlcyI6W119.lXdQtp6G5zcF3oHbmJ8OZ5XfFlGC-dceo9l8EZ-R7F0ySkBguIHaZSeXHc2aJwDyTmgT94pBgKugpci7vgqTRg8FEdTgvsB6JZtBiZtJdjcnFqCyEXgPSH66RLyF8a8TqR8P8Xq3xXTqngZiMOsTrmaFA5zfmUZGmIU_PZyf7T2_ejKVqHe_JReGcG4saIw0KNy59BAGHKR-nn21u4laxxwTmnAiyJcIk7qCrurlANsLNNJXN_98QdfNe6zFpupwYpLnKRyd29igxIuQyumrPaz8_zVY6c7pHUSDlSrJwdbMNJsqEq71F8Y1R0P4GKPz21GG4WgShb_Za18dQwnvf2nIJq-ePT2ZfH-BnbkcfzwbBx5Bp3FQQkYooTGp8K1qGMdmMpduFt8pJtVPKmi0DUf9U4JzWdRPPG-XFXsN6kK4c2mAxJsLPR3sr4mAPcY657tfmLa6s2LXdmLjFjgukMk_LSmwCVr-ftdKqEiWZpehBGgnQCVo38WNroRsDHp7cWdHYGzq2GHe7m9BcNmnlqxbQ_3RiuZqLYmjJRUvekP_XTsqypjTcBDkW9o9Z4DuBlIoz6kzEo9bDND0J4BMM2OTT4t3olkYrlKNtfwpYMXldbkv9CiC8PlfkFNqQQRnylWLHRbSfH5W7pC7xLn5qz8a4BtK9mWnHPjySLnMYik", forHTTPHeaderField: "Authorization")
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")

           //create dataTask using the session object to send data to the server
           let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

               guard error == nil else {
                   return
               }

               guard let data = data else {
                   return
               }

               do {
                   if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                       print(json)
                       // handle json...
                   }
               } catch let error {
                   print(error.localizedDescription)
               }
           })
           task.resume()
        
        }
    
    
    
    //MARK:- unblockUser
    
    static func unBlockUser (userId: String) {

        let Url = String(format: "http://momyt.website/api/user/\(userId)/unblock")
         guard let serviceUrl = URL(string: Url) else { return }
        
         var request = URLRequest(url: serviceUrl)
         request.httpMethod = "GET"
         request.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRkNzQ1MjdjODFmYWU0MjhjMGUzZTBhYjlkOGU5NmU5MWJhODY5ZDIzOWY4Njg2OTA3Nzg2YjAxYTk3NmVmN2Q5ZmI1NWE0Yzk1ODA4YTlkIn0.eyJhdWQiOiIxIiwianRpIjoiZGQ3NDUyN2M4MWZhZTQyOGMwZTNlMGFiOWQ4ZTk2ZTkxYmE4NjlkMjM5Zjg2ODY5MDc3ODZiMDFhOTc2ZWY3ZDlmYjU1YTRjOTU4MDhhOWQiLCJpYXQiOjE1OTkzOTcwNDQsIm5iZiI6MTU5OTM5NzA0NCwiZXhwIjoxNjMwOTMzMDQzLCJzdWIiOiI0MSIsInNjb3BlcyI6W119.lXdQtp6G5zcF3oHbmJ8OZ5XfFlGC-dceo9l8EZ-R7F0ySkBguIHaZSeXHc2aJwDyTmgT94pBgKugpci7vgqTRg8FEdTgvsB6JZtBiZtJdjcnFqCyEXgPSH66RLyF8a8TqR8P8Xq3xXTqngZiMOsTrmaFA5zfmUZGmIU_PZyf7T2_ejKVqHe_JReGcG4saIw0KNy59BAGHKR-nn21u4laxxwTmnAiyJcIk7qCrurlANsLNNJXN_98QdfNe6zFpupwYpLnKRyd29igxIuQyumrPaz8_zVY6c7pHUSDlSrJwdbMNJsqEq71F8Y1R0P4GKPz21GG4WgShb_Za18dQwnvf2nIJq-ePT2ZfH-BnbkcfzwbBx5Bp3FQQkYooTGp8K1qGMdmMpduFt8pJtVPKmi0DUf9U4JzWdRPPG-XFXsN6kK4c2mAxJsLPR3sr4mAPcY657tfmLa6s2LXdmLjFjgukMk_LSmwCVr-ftdKqEiWZpehBGgnQCVo38WNroRsDHp7cWdHYGzq2GHe7m9BcNmnlqxbQ_3RiuZqLYmjJRUvekP_XTsqypjTcBDkW9o9Z4DuBlIoz6kzEo9bDND0J4BMM2OTT4t3olkYrlKNtfwpYMXldbkv9CiC8PlfkFNqQQRnylWLHRbSfH5W7pC7xLn5qz8a4BtK9mWnHPjySLnMYik", forHTTPHeaderField: "Authorization")
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         request.timeoutInterval = 20
         let session = URLSession.shared
         session.dataTask(with: request) { (data, response, error) in
             if let response = response {
                 print(response)
                
             }
             if let data = data {
                 do {
                     let json = try JSONSerialization.jsonObject(with: data, options: [])
                     print(json)

                 } catch {

                     print(error)

                 }
             }
         }.resume()
    }
        
    
}

