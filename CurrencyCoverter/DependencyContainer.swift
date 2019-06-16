//
//  DependencyContainer.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class DependencyContainer {
    
    lazy var currencyApiClient: ApiClient = {
        return ApiClient(endpointUrlString: Api.currencyEndpointUrlString)
    }()
    
    lazy var currencyService: ICurrencyService = {
        return CurrencyService(currencyApiClient: currencyApiClient)
    }()

}
