//
//  HTTPHeaders.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import Foundation

struct HTTPHeaders{
    static func defaultHeaders() -> [String: String] {
       
        return [
            "accept" : "application/json",
            "Authorization" : "",
        ]
    }
}
