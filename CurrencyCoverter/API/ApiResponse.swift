//
//  ApiResponse.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

public struct APIResponse<Results: Decodable>: Decodable {
    
    public let response: Results?
    public let error: String?
}
