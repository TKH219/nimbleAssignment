//
//  AlamofireClient.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 07/03/2022.
//

import Foundation
import Alamofire

struct DecodableType: Decodable { let url: String }
typealias callBack = (((Dictionary<String, Any>)?) -> ())
typealias error = (((Any?) -> ()))
typealias callBackWithAny = (((Any?) -> ()))

class AlamofireClient: NSObject {
    
    var baseUrl:String = ""
    
    init(withBaseUrl:String) {
        super.init()
        baseUrl = withBaseUrl
    }
    
    func requestPost(params: Dictionary<String, Any>, path: String ,withBlockSuccess block: @escaping callBackWithAny, withError error: @escaping error) {
        let urlString: String = "\(self.baseUrl)/\(path)"
        let url =  URL(string: urlString)!
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: self.createHeaderRequest())
            .validate(contentType: ["application/json"])
            .responseData { response in
                print(response)
                switch response.result {
                case .success(let data):
                    guard let json = try? JSONSerialization.jsonObject(with: data) else {
                        block(nil)
                        return
                    }
                    
                    if let statusCode = response.response?.statusCode {
                        self.handleStatusCode(statusCode: statusCode) { err in
                            if err == nil {
                                block(json)
                                error(nil)
                            } else {
                                block(nil)
                                error(json)
                            }
                        }
                    }
                    
                case .failure(let err):
                    error(err)
                }
            }
    }
    
    func requestPut(params:Dictionary<String, Any>, path:String ,withBockSuccess block:@escaping callBackWithAny, withError error:@escaping error){
        
        let urlString: String = "\(self.baseUrl)/\(path)"
        let url =  URL(string: urlString)!
        
        AF.request(url, method: .put, parameters: params, encoding:  JSONEncoding.default, headers: self.createHeaderRequest()).validate(contentType: ["application/json"]).responseData { (response) in
            switch response.result {
            case .success(let data):
                guard let json = try? JSONSerialization.jsonObject(with: data) else {
                    block(nil)
                    return
                }
                
                if let statusCode = response.response?.statusCode {
                    self.handleStatusCode(statusCode: statusCode) { err in
                        if err == nil {
                            block(json)
                            error(nil)
                        } else {
                            block(nil)
                            error(json)
                        }
                    }
                }
            case .failure(let err):
                error(err)
            }
        }
    }
    
    func requestGet(params:Dictionary<String, Any>, path:String ,withBockSuccess block:@escaping callBackWithAny,withError error:@escaping error){
        
        let urlString: String = "\(self.baseUrl)/\(path)"
        let url =  URL(string: urlString)!
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: self.createHeaderRequest())
            .validate(contentType: ["application/json"])
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    guard let json = try? JSONSerialization.jsonObject(with: data) else {
                        block(nil)
                        return
                    }
                    
                    if let statusCode = response.response?.statusCode {
                        self.handleStatusCode(statusCode: statusCode) { err in
                            if err == nil {
                                block(json)
                                error(nil)
                            } else {
                                block(nil)
                                error(json)
                            }
                        }
                    }
                case .failure(let error):
                    print(error)
                    block(nil)
                }
            }
        
    }
    
    func requestDelete(params:Dictionary<String, Any>, path:String ,withBockSuccess block:@escaping callBackWithAny,withError error:@escaping error){
        
        let pathTemp = path.replacingOccurrences(of: " ", with: "%20")
        let strUrl = pathTemp.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let urlWithoutSlash = strUrl?.replacingOccurrences(of: "//", with: "/")
        let urlString: String = "\(self.baseUrl)/\(urlWithoutSlash!)"
        let url =  URL(string: urlString)!
        
        AF.request(url, method: .delete, parameters: params, encoding: URLEncoding.default, headers: self.createHeaderRequest()).validate(contentType: ["application/json"]).responseData { (response) in
            switch response.result {
            case .success(let data):
                guard let json = try? JSONSerialization.jsonObject(with: data) else {
                    block(nil)
                    return
                }
                
                if let statusCode = response.response?.statusCode {
                    self.handleStatusCode(statusCode: statusCode) { err in
                        if err == nil {
                            block(json)
                            error(nil)
                        } else {
                            block(nil)
                            error(json)
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func createHeaderRequest() -> HTTPHeaders {
        return HTTPHeaders([:])
    }
    
    func handleStatusCode(statusCode: Int, completion: ((CustomError?) -> ())) {
        switch statusCode {
        case 200:
            completion(nil)
            break
        case 400:
            completion(CustomError.invalidToken)
            break
        case 401:
            completion(CustomError.invalidClientCredentials)
            break
        case 403:
            completion(CustomError.invalidClient)
            break
        default:
            completion(CustomError.error)
            break
        }
    }
}
