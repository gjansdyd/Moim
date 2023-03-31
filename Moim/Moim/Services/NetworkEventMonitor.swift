//
//  NetworkEventMonitor.swift
//  Moim
//
//  Created by mun on 2023/03/31.
//

import Alamofire

final class NetworkEventMonitor: Alamofire.EventMonitor {
    internal let queue = DispatchQueue(label: "NetworkingLogger")
    private let tag = "API"
    private let logStringLengthLimit = 524288 // default max length
    
    func requestDidResume(_ request: Request) {
        var msgs: [String] = ["\(request)"]
        let headers = request.request?.allHTTPHeaderFields.map { $0.description }
        if var str = headers, !str.isEmpty {
            msgs.append("Headers:")
            if str.count > logStringLengthLimit {
                str = str.substring(to: logStringLengthLimit) + "..."
            }
            msgs.append("    " + str)
        }
        
        let body = request.request?.httpBody?.uniCodeToStr
        if var str = body, !str.isEmpty {
            msgs.append("body:")
            if str.count > logStringLengthLimit {
                str = str.substring(to: logStringLengthLimit) + "..."
            }
            msgs.append("    " + str)
        }
        print(tag, "➡️", msgs.joined(separator: "\n"))
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        var str = response.data?.uniCodeToStr ?? ""
        if str.count > logStringLengthLimit {
            str = str.substring(to: logStringLengthLimit) + "..."
        }
        let msgs: [String] = [
            "\(request)",
            "    " + str
        ]
        print(tag, "⬅️", msgs.joined(separator: "\n"))
    }
    
    func request(_ request: Request, didFailToCreateURLRequestWithError error: AFError) {
        print(tag, "❗️❗️❗️", error.localizedDescription)
    }
    
    func request(_ request: Request, didCompleteTask task: URLSessionTask, with error: AFError?) {
        guard let error = error else { return }
        print(tag, "❗️❗️❗️", error.localizedDescription)
    }
}
