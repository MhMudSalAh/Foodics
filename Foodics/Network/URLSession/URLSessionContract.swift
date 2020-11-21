//
//  URLSessionContract.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import Foundation

protocol URLSessionProviderProtocol {
    
    func request<T>(type: T.Type?, service: ServiceProtocol, completion: @escaping (APIResponse<T>) -> ()) where T: Decodable
    
    func handleResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (APIResponse<T>) -> ())
    
    func info(_ task: URLSessionDataTask, _ body: Any?, _ data: Data?, _ response: URLResponse?, _ error: Error?)
}
