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
    private var jsonEncoder: JSONEncoder
    private var jsonDecoder: JSONDecoder

    init(endpointUrlString: String, jsonDecoder: JSONDecoder?, jsonEncoder: JSONEncoder?) {
        self.baseEndpointUrl = URL(string: endpointUrlString)!
        self.jsonDecoder = jsonDecoder ?? JSONDecoder()
        self.jsonEncoder = jsonEncoder ?? JSONEncoder()
    }
    
    private func urlRequest<T: APIRequest>(_ request: T) -> URLRequest {
        let endpoint = self.endpoint(for: request)
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = request.httpMethod.value
        urlRequest.httpBody = try? jsonEncoder.encode(request)

        if request.httpMethod == .POST {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        return urlRequest
    }
    
    /// Encodes a URL based on the given request
    public func endpoint<T: APIRequest>(for request: T) -> URL {
        guard let baseUrl = URL(string: request.resourceName, relativeTo: baseEndpointUrl) else {
            fatalError("Wrong resourceName: \(request.resourceName)")
        }
    
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!

        if request.httpMethod == .GET {
            let parameters = try? URLQueryEncoder.encode(request)
            components.queryItems = parameters
        }
        
        return components.url ?? baseUrl
    }
    
    func send<T: APIRequest>(
        _ request: T,
        completion: @escaping ResultCallback<T.Response>) {
        let endpoint = self.endpoint(for: request)
        
        print("Endpoint: ", endpoint)
        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            if let data = data {
                do {
                    print("Raw response: ", try? JSONSerialization.jsonObject(with: data, options: .allowFragments))
                    let response = try self.jsonDecoder.decode(T.Response.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
