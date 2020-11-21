//
//  URLComponents+Extension.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import Foundation

extension URLComponents {
    
    init(service: ServiceProtocol) {
        let urlString = API.BASE_URL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let baseUrl = URL(string: urlString)
        let url = baseUrl!.appendingPathComponent(service.path)
        
        /// Build the URL
        
        self.init(url: url, resolvingAgainstBaseURL: false)!
        
        /// Set the spasific guery params which assigned by routes
        
        guard let parameters = service.parameters else { return }
        queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
    }
}
