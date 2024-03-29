//
//  DependencyContainer.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class DependencyContainer {
    
    lazy var currencyApiClient: ApiClient = {
        return CurrencyApiClient(endpointUrlString: CurrencyApi.currencyEndpointUrlString,
                                 jsonDecoder: CurrencyJSONDecoder(),
                                 jsonEncoder: CurrencyJSONEncoder())
    }()
    
    lazy var currencyService: ICurrencyService = {
        return CurrencyService(currencyApiClient: currencyApiClient)
    }()
    
    lazy var settings: IAppSettings = {
        return AppSettings(keychainWrapper: KeychainWrapper.standard)
    }()

}
