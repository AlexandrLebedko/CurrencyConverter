//
//  ApiClient.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

public class ApiClient {
    
    private var baseEndpointUrl: URL
    private let session = URLSession(configuration: .default)

    init(endpointUrlString: String) {
        self.baseEndpointUrl = URL(string: endpointUrlString)!
    }
    
    private func urlRequest<T: APIRequest>(_ request: T) -> URLRequest {
        let endpoint = self.endpoint(for: request)
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = request.httpMethod.value
        urlRequest.httpBody = try? JSONEncoder().encode(request)

        if request.httpMethod == .POST {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        return urlRequest
    }
    
    func send<T: APIRequest>(
        _ request: T,
        completion: @escaping ResultCallback<T.Response>) {
        let endpoint = self.endpoint(for: request)
        
        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            if let data = data {
                do {
                    let marvelResponse = try JSONDecoder().decode(T.Response.self, from: data)
                    completion(.success(marvelResponse))
                } catch let error {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    /// Encodes a URL based on the given request
    private func endpoint<T: APIRequest>(for request: T) -> URL {
        guard let baseUrl = URL(string: request.resourceName, relativeTo: baseEndpointUrl) else {
            fatalError("Wrong resourceName: \(request.resourceName)")
        }
    
        if request.httpMethod == .GET {
            var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!
            let parameters = try? URLQueryEncoder.encode(request)
            components.queryItems = parameters

        }
        
        return baseUrl
    }
}
