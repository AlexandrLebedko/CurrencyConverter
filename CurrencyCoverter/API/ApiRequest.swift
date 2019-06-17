//
//  ApiRequest.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

public protocol APIRequest: Encodable {
    associatedtype Response: Decodable
    
    var resourceName: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String]? { get }
}
