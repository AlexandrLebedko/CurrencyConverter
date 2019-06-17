//
//  CurrencyApiClient.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class CurrencyApiClient: ApiClient {
    
    override func endpoint<T>(for request: T) -> URL where T : APIRequest {
        let url = super.endpoint(for: request)
        let accessKeyComponent = URLQueryItem(name: "access_key", value: Api.currencyApiAccessKey)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        var queryItems = components?.queryItems ?? []
        queryItems.append(accessKeyComponent)
        components?.queryItems = queryItems
        return components?.url ?? url
    }
}
