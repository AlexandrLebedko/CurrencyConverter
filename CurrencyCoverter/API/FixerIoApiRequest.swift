//
//  FixerIoApiRequest.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class FixerIoApiRequest {

    private var accessKey: String
    init() {
        self.accessKey = Api.currencyApiAccessKey
    }
}