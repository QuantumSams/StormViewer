//
//  JSONresponse.swift
//  StormViewer
//
//  Created by Huy on 18/5/24.
//

import Foundation

class SuccessResponse: Decodable{
    let refresh: String
    let access: String
}


class ErrorResponse: Decodable{
    let detail: String
}
