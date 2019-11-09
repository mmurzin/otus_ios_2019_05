//
//  NetworkClient.swift
//  homework-1
//
//  Created by michael on 15/09/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation


class NetworkClientBuilder {
    private var scheme = "http"
    private var host = ""
    
    func setScheme(scheme:String) -> NetworkClientBuilder {
        self.scheme = scheme
        return self
    }
    
    func setHost(host:String) -> NetworkClientBuilder {
        self.host = host
        return self
    }
    
    func build() -> NetworkClient{
        if(host.isEmpty){
            fatalError("Host can not be emty")
        }
        return NetworkClient(scheme: self.scheme, host: self.host)
    }
}

struct NetworkClient {
    private let scheme: String
    private let host: String
    private let session = URLSession.shared
    
    fileprivate init(scheme:String, host:String) {
        self.scheme = scheme
        self.host = host
    }
    
    func request(method:String,
                 path:String,
                 queryParams: [String: String],
                 complition: @escaping (_ json: Any, _ data: Data) -> Void){
        
        var urlComponents = URLComponents()
        urlComponents.scheme = self.scheme
        urlComponents.host = self.host
        urlComponents.path = path
        urlComponents.setQueryItems(with: queryParams)
        print(urlComponents)
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                print("Client error: \(String(describing: error))")
                return
            }
            
            guard let res = response as? HTTPURLResponse, (200...299).contains(res.statusCode) else {
                print("Server error")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                complition(json, data!)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
}


