//
//  Response.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/16/20.
//

enum Response<T> {

    case onSuccess(T, Meta?)
    case onFailure(APIError)
    case onPage(Meta)
    case onCompleted
}
