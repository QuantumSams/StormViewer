//
//  HTTP.swift
//  StormViewer
//
//  Created by Huy on 18/5/24.
//

import Foundation


enum HTTP{
    enum Method: String{
        case get = "GET"
        case post = "POST"
    }
    
    enum Headers{
        enum Key: String{
            case contentType = "Content-Type"
            
        }
        enum Value: String{
            case applicationJson = "application/json"
            
        }
    }
}
