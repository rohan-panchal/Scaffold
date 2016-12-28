//
//  HTTPNetworking.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/6/16.
//
//

import Foundation

public enum HTTPMethod {
    case get
    case post
    case put
    case patch
    case delete
}

public enum HTTPEncoding {
    case url
    case urlEncoded
    case json
}
