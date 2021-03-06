//
//  Router.swift
//  CallingApp
//
//  Created by Islam on 2/7/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

public class Router: NetworkRouter {

    private var task: URLSessionTask?
    private var session: URLSession?

    public var baseURL: URL?

    private init() {

        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess      = true
        configuration.httpCookieAcceptPolicy    = .onlyFromMainDocumentDomain
        configuration.requestCachePolicy        = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForRequest = 10.0

        session = URLSession(configuration: configuration)
    }

    public static let shared = Router()

    func request(_ router: EndPoint, success: @escaping NetworkRouterSuccessCompletion,
                 failure: @escaping NetworkRouterFailedCompletion) {

        if let session = session {
            do {
                let request = try self.buildRequest(from: router)
                task = session.dataTask(with: request, completionHandler: { (data, response, error) in

                    if let error = error {
                        failure(error)
                    } else {
                        let statusCode = self.isSuccessCode(response)
                        if statusCode, let data = data, let response = response {
                            success(data, response)
                        }
                    }
                })
            } catch {
                failure(error)
            }

            self.task?.resume()
        }
    }

    func cancel() {
        self.task?.cancel()
    }
}

extension Router {

    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {

        var request = URLRequest(url: URL(fileURLWithPath: ""))
        if let path = route.path, let baseURL = baseURL {
            request = URLRequest(url: baseURL.appendingPathComponent(path))
        }
        request.httpMethod = route.method.rawValue

        do {
            switch route.method {
                case .get:
                    try self.configure(bodyParameters: nil, urlParameters: route.parameters, request: &request)
                case .post:
                    try self.configure(bodyParameters: route.parameters, urlParameters: nil, request: &request)
            }
            try self.addition(headers: route.headers, request: &request)
        } catch {
            throw error
        }

        return request
    }

    fileprivate func configure(bodyParameters: Parameters?, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParametersEncoder.encode(request: &request, parameters: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameteersEncoder.encode(request: &request, parameters: urlParameters)
            }
        } catch {
            throw error
        }
    }

    fileprivate func addition(headers: HTTPHeaders?, request: inout URLRequest) throws {
        guard let headers = headers else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }

    private func isSuccessCode(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }

    private func isSuccessCode(_ response: URLResponse?) -> Bool {
        guard let urlResponse = response as? HTTPURLResponse else {
            return false
        }
        return isSuccessCode(urlResponse.statusCode)
    }
}
