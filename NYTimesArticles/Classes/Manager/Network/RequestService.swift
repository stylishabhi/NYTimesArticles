//
//  RequestService.swift
//  NYTimesArticles
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation
//import Reachability

final class RequestService {
    
    func loadData(urlString: String, session: URLSession = URLSession(configuration: .default), completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask? {
        
        //Ignoring wrong URL
        guard let url = URL(string: urlString) else {
            completion(.failure(.network(string: "Wrong url format")))
            return nil
        }
        //Creating GET request
        var request = RequestFactory.request(method: .GET, url: url)
        
        //Checking network connection
        /*if let reachability = Reachability(), reachability.connection == .none {
            request.cachePolicy = .returnCacheDataDontLoad
        }*/
        let task = session.dataTask(with: request) { (data, response, error) in
            
            
            /*if error != nil || data == nil {
             debugPrint("Client error!")
             completion(.failure(.custom(string: "Client error!")))
             return
             }
             
             guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
             debugPrint("Server error!")
             completion(.failure(.custom(string: "Server error!")))
             return
             }
             
             guard let mime = response.mimeType, mime == "application/json" else {
             debugPrint("Wrong MIME type!")
             completion(.failure(.custom(string: "Wrong MIME type!")))
             return
             }*/
            
            
            //For failure case
            if let error = error {
                completion(.failure(.network(string: kNoNetworkErrorMessgae + error.localizedDescription)))
                return
            }
            
            //For success case
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
        return task
    }
    
}

