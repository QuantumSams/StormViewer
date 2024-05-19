//
//  Endpoint.swift
//  StormViewer
//
//  Created by Huy on 18/5/24.
//

import Foundation

enum Endpoint{
    
    case login(path: String = "/api/auth/login", userModel: UserLoginModel)
    
    var request: URLRequest? {
        guard let url = self.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.addValues(for: self)
        request.httpBody = httpBody
        return request
    }
    
    private var url: URL?{
        var component = URLComponents()
        component.scheme = Constants.scheme
        component.host = Constants.baseURL
//        component.port = Constants.port
        component.path = path
        return component.url
    }
    
    private var path: String{
        switch self{
        case .login(path: let path, _):
            return path
            
        }
    }
    
    private var httpMethod: String{
        switch self{
        case .login: return HTTP.Method.post.rawValue
        }
    }
    
    private var httpBody: Data?{
        switch self{
            
        case .login(_, userModel: let userModel):
            let json = try? JSONEncoder().encode(userModel)
            return json
        }
    }
}

extension URLRequest{
    mutating func addValues(for endpoint: Endpoint){
        switch endpoint{
        case .login(path: _):
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
        }
    }
}
