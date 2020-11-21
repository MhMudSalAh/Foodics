//
//  URLSessionProvider.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit
import SystemConfiguration

final class URLSessionProvider: URLSessionProviderProtocol {

    private var session: URLSessionProtocol
    private let REQUEST_TIME = 80.00
    private var online = false
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func urlCahcePolicy(_ isCache: Bool) -> URLRequest.CachePolicy {
        online = Reachability.isOnline()
        return isCache ? (online ? .reloadIgnoringCacheData : .returnCacheDataDontLoad) : .reloadIgnoringCacheData
    }
    
    func request<T>(type: T.Type?, service: ServiceProtocol, completion: @escaping (APIResponse<T>) -> ()) where T: Decodable {
        let request = URLRequest(service: service, cachePolicy: urlCahcePolicy(/* MARK: Enable Cache */ true), timeoutInterval: REQUEST_TIME)
        
        var task: URLSessionDataTask? = nil
        task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            
            #if DEBUG
            // MARK: Console Action
            self?.info(task!, request.httpBody, data, response, error)
            #endif
            
            self?.handleResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        task?.resume()
    }
    
    func handleResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (APIResponse<T>) -> ()) {
        guard error == nil else {
            // MARK: UI Action
            let apiError = APIError(type: online ? .server : .network)
            //Banner.showAPIError(apiError)
            Console.logError(apiError.type)
            return completion(.failure(apiError))
        }
        
        guard let response = response else {
            // MARK: UI Action
            let apiError = APIError(type: .noData)
            //Banner.showAPIError(apiError)
            Console.logError(apiError.type)
            return completion(.failure(apiError))
        }
        
        guard let apiData = data, let result = try? JSONDecoder().decode((APIData<T>).self, from: apiData) else {
            // MARK: UI Action
            let apiError = APIError(type: .parsing)
            //Banner.showAPIError(apiError)
            Console.logError(apiError.type)
            return completion(.failure(apiError))
        }
        
        switch response.statusCode {
        case 200...299:
            if result.status ?? (200 != 0) {
                if let data = result.data {
                    completion(.success(data, result.meta))
                } else {
                    completion(.complete)
                }
            } else {
                // MARK: UI Action
                let apiError = APIError(type: .server)
                //Banner.showAPIError(apiError)
                Console.logError(apiError.type)
                return completion(.failure(apiError))
            }
        default:
            let apiError = APIError(code: response.statusCode, message: result.message, errors: result.errors, type: .known)
            Console.logError(apiError.type)
            completion(.failure(apiError))
        }
    }
    
    func info(_ task: URLSessionDataTask, _ body: Any?, _ data: Data?, _ response: URLResponse?, _ error: Error?) {
        let url: String = task.originalRequest?.url?.absoluteString ?? ""
        let headers: [String: String] = task.originalRequest?.allHTTPHeaderFields ?? [:]
        let statusCode: Int = (task.response as? HTTPURLResponse)?.statusCode ?? 0
        let response: String = String(data: data ?? Data(), encoding: .utf8) ?? ""
        Console.logAPI(url, headers, body as Any, statusCode, response, error)
    }
}

