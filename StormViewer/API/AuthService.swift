//
//  AuthService.swift
//  StormViewer
//
//  Created by Huy on 18/5/24.
//

import Foundation


enum ServiceError: Error{
    case serverError(String)
    case unknown(String = "Unknown error")
    case decodingError(String = "Decoding error")
}


class AuthService {
    
    
    static var accessToken: String = ""
    static var refreshToken: String = ""
    
    static func login(request: URLRequest, completion: @escaping (Result<String, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else { if let error = error {
                completion(.failure(ServiceError.unknown(error.localizedDescription)))
                
            } else {
                completion(.failure(ServiceError.serverError("hehe")))
            }
                return
            }
            
            let decoder = JSONDecoder()
            
            if let successMessage = try? decoder.decode(SuccessResponse.self, from: data){
                completion(.success("Login successfully"))
                self.accessToken = successMessage.access
                self.refreshToken = successMessage.refresh
            }
            else if let errorMessage = try? decoder.decode(ErrorResponse.self, from: data){
                
                completion(.failure(ServiceError.serverError(errorMessage.detail)))
            }
            else{
                completion(.failure(ServiceError.decodingError()))
            }
            
        }
        
        task.resume()
        
    }
}
