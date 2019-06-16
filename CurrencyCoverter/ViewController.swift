//
//  ViewController.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let request = GetLatestRatesRequest(base: nil, symbols: ["EUR", "USD"])
        if let data = try? JSONEncoder().encode(request) {
            
            print("Request: ", try? JSONSerialization.jsonObject(with: data, options: .allowFragments))

        }
    }


}

