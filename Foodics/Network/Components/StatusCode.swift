//
//  StatusCode.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

import Foundation

public enum StatusCode {
    
    case Success
    case Unauthorized
    case ValidationException
    case BusinessException
    case RefreshToken
    case InternalServerError
    case Offline
    case NotFound
    case Other(Int)
    
    public var value: Int {
        switch self {
        case .Success:
            return 200
        case .Unauthorized:
            return 401
        case .ValidationException:
            return 405
        case .BusinessException:
            return 406
        case .RefreshToken:
            return 451
        case .NotFound:
            return 404
        case .InternalServerError:
            return 500
        case .Other(let code):
            return code
        case .Offline:
            return 0
        }
    }
}

extension StatusCode: Equatable {
    
    public init(statusCode: Int) {
        
        switch statusCode {
        case 200:
            self = .Success
        case 401:
            self = .Unauthorized
        case 405:
            self = .ValidationException
        case 406:
            self = .BusinessException
        case 451:
            self = .RefreshToken
        case 404:
            self = .NotFound
        case 500:
            self = .InternalServerError
        case 503:
            self = .InternalServerError
        case 0:
            self = .Offline
        default:
            self = .Other(statusCode)
        }
    }
    
    public static func ==(lhs: StatusCode, rhs: StatusCode) -> Bool {
        switch (lhs, rhs) {
            
        case (.Success, .Success):
            return true
        case (.NotFound, .NotFound):
            return true
        case (.Unauthorized, .Unauthorized):
            return true
        case (.ValidationException, .ValidationException):
            return true
        case (.BusinessException, .BusinessException):
            return true
        case (.RefreshToken, .RefreshToken):
            return true
        case (.InternalServerError, .InternalServerError):
            return true
        case ( .Other,.Other ):
            return true
        case (.Offline, Offline):
            return true
        default:
            return false
        }
    }
}
