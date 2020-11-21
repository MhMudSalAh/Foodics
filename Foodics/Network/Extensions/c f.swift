//
//  URLRequest+Extension.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import UIKit
import SystemConfiguration

extension URLRequest {
    
    init(service: ServiceProtocol, cachePolicy: CachePolicy, timeoutInterval: TimeInterval) {
        let urlComponents = URLComponents(service: service)
        self.init(url: urlComponents.url!, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        httpMethod = service.method.rawValue
        
        /// Set the spasific headers which assigned by routes
        
        service.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }
        
        /// Set the generic headers which are global for any route
       
        addValue(APIHeader.applicationJson.rawValue, forHTTPHeaderField: APIHeader.accept.rawValue)
        
        /// Set user access token if it is exist
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjI4MzNhMzJmZDlmN2UwYjczNzU4YzIwMmNiNjU5NzhlYjQ1YTBlMTQwMTk5NjJlYjIzMzE1MDhkYTVjYjhkZDc0ZGUyZDYxNzhmOTc2M2I5In0.eyJhdWQiOiI4Zjc4NjY2NC0wNTg5LTQ3MTgtODBkMS1lMTY4M2FmYmM3MjQiLCJqdGkiOiIyODMzYTMyZmQ5ZjdlMGI3Mzc1OGMyMDJjYjY1OTc4ZWI0NWEwZTE0MDE5OTYyZWIyMzMxNTA4ZGE1Y2I4ZGQ3NGRlMmQ2MTc4Zjk3NjNiOSIsImlhdCI6MTYwNTQzMzE5MywibmJmIjoxNjA1NDMzMTkzLCJleHAiOjE2MzY5NjkxOTMsInN1YiI6IjhmN2I2NmYwLWE1MjctNGNkNC05MjNkLTYyODM3MDQ1Yjk5NSIsInNjb3BlcyI6WyJnZW5lcmFsLnJlYWQiXSwiYnVzaW5lc3MiOiI4ZjdiNjZmMC1hNTUxLTRlNmYtODU5Mi0wMmRhZjBjNTUzODYiLCJyZWZlcmVuY2UiOiIxMDAwMDAifQ.BSZ86qab-Nb_q5yCqfg5sFRRS4W57udcqO6-5DQxgvFYyPi4OGhuJXQWhzmC9dvqa6X1RmZI6TqN0agksXfyKHkShzqKRbAHHPhJxI7GheTmI9biD-IAJVvgD4pa662Nc3iuuks7RBcN3ho5FtzEYd6OL4oacDkkhQtuRQ2esx4BTGrrmNloANiYBAQbd2fGfKdrhRv-JInqxE7WhwuEXUkoC98SXvUETftsFXX-rzqdW9oywC0wcyZYNnZsOTuUTI1iBFt76zzSGKp0qb1VITxeD_J7t4u0wm--LrnRKVcK7gUc_eM_ZcqeuT27keDr92yveXPrK4MVgJsZwwIjGZ1N-xMJn-wtQ6BHz3iTF0ShJiQPZNOGPcWWas6ZuxcuYRw1h2abnyCCMZN4wSPYTcY9yMIaJ303pR4Y0H3OBK9zAIAoFegQiX0MOdGZbXv79ab-kxcURRoR5CA6xhB1H4mA5TMndQDHB6jOVydqyNi7XHBkbialaz6n8FG-HLrvHHe4xBX-vhkU7vRNAME4LQdg-SwANJKpEdpEUX3WgVjvWzpp6DZqWNflqPRcK710j3CdU4yapzDICpKX5ZIy_E1Z6nRQUjYsmOrTefCJ8lbqb1dIoNzIOJCpEd5xc5sqlh50URuVyZxmjLvyr6mtYOs8LSow-u2itTdmPCCbsbI"

        addValue("Bearer \(token)", forHTTPHeaderField: APIHeader.authorization.rawValue)
        
        /// Set the spasific body which assigned by routes
        
        guard let body = service.body else { return }
        guard let dic = (body as! Codable).asDictionary() else { return }
        httpBody = try? JSONSerialization.data(withJSONObject: dic)
    }
}
