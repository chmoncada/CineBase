//
//  WebAPIRequest.swift
//  Cinebase
//
//  Created by Gustavo Villar on 4/11/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import Alamofire

protocol WebAPIRequestProtocol: class {
    /// Resumes the request.
    func resume()
    
    /// Suspends the request.
    func suspend()
    
    /// Cancels the request.
    func cancel()
    
    /// The progress of fetching the response data from the server for the request.
    var progress: Progress { get }
    
    /// Sets a closure to be called periodically during the lifecycle of the `Request` as data is read from the server.
    @discardableResult
    func downloadProgress(queue: DispatchQueue, closure: @escaping (Progress) -> Void) -> Self
}


/**
 Wrapper class for the underlying http library's request.
 */
class WebAPIRequest: WebAPIRequestProtocol {
    
    private let alamofireRequest: Alamofire.DataRequest
    
    /**
     Converts `Alamofire.DataRequest` to `Inkafarma.DataRequest`
     to avoid `Alamofire` dependency
     
     - parameter alamofireRequest: Alamofire.Result
     */
    init(_ alamofireRequest: Alamofire.DataRequest) {
        self.alamofireRequest = alamofireRequest
    }
    
    var urlRequest: URLRequest? {
        return alamofireRequest.request
    }
    
    /// Resumes the request.
    open func resume() {
        alamofireRequest.resume()
    }
    
    /// Suspends the request.
    open func suspend() {
        alamofireRequest.suspend()
    }
    
    /// Cancels the request.
    open func cancel() {
        alamofireRequest.cancel()
    }
    
    /// The progress of fetching the response data from the server for the request.
    open var progress: Progress {
        return alamofireRequest.progress
    }
    
    /// Sets a closure to be called periodically during the lifecycle of the `Request` as data is read from the server.
    @discardableResult
    func downloadProgress(queue: DispatchQueue = DispatchQueue.main, closure: @escaping (Progress) -> Void) -> Self {
        alamofireRequest.downloadProgress(queue: queue, closure: closure)
        return self
    }
}
