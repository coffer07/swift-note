//
//  NetWork.swift
//  XNote
//
//  Created by 高翔 on 2017/1/4.
//  Copyright © 2017年 高翔. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum NetworkResultCode:NSInteger{
    case Success = 0
    case NetworkError = -1000
}

protocol NetworkRequest {
    func postRequest(header:[String:String]?,param:[String:Any]?,urlString:String,completion:@escaping(_ code:NSInteger,_ result:JSON?,_ errorMessage:String)->Void)->Request?
    func getRequest(header:[String:String]?,param:[String:Any]?,urlString:String,completion:@escaping(_ code:NSInteger,_ result:JSON?,_ errorMessage:String)->Void)->Request?
}

class Network:NSObject,NetworkRequest{
    
    static var sharedInstance = Network()
    private static var errorMessage = "网络问题"
    
    private override init() {
        super.init()
    }
    
    internal func postRequest(header: [String : String]?, param: [String : Any]?, urlString: String, completion: @escaping (NSInteger, JSON?, String) -> Void) -> Request? {
        
        debugLog("param:\(param),url:\(urlString),header:\(header)")
        
        let request = Alamofire.request(urlString, method: .post, parameters: param, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            self.handleResult(response: response, completion: completion)
        }
        return request
    }

    internal func getRequest(header: [String : String]?, param: [String : Any]?, urlString: String, completion: @escaping (NSInteger, JSON?, String) -> Void) -> Request? {
        
        var urlStr = urlString
        if param != nil{
            for (index,dic) in param!.enumerated(){
                if index == 0{
                    urlStr = "\(urlStr)?\(dic.0)=\(dic.1)"
                }else{
                    urlStr = "\(urlStr)&\(dic.0)=\(dic.1)"
                }
            }
        }
        debugLog("param:\(param),url:\(urlString),header:\(header)")
        
        urlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        let request = Alamofire.request(urlString, method: .get, parameters: param, encoding: URLEncoding.default, headers: header).responseString { (response) in
            self.handleResult(response: response, completion: completion)
        }
        return request
        
    }

    func handleResult(response:DataResponse<String>,completion:(_ code:NSInteger,_ result:JSON?,_ errorMessage:String)->Void){

        if response.result.isFailure == true{
            var errorMsg = Network.errorMessage
            if let errMsg = response.result.error?.localizedDescription {
                errorMsg = errMsg
            }
            debugLog("errorMsg:\(errorMsg)")
            completion(NetworkResultCode.NetworkError.rawValue, nil, errorMsg)
        }
        if response.result.isSuccess == true{
            debugLog(response.result.value)
            if (response.response?.statusCode)! < 500{
                if let jsonObject = response.result.value?.jsonObject(){
                    print(jsonObject.object)
                    completion(NetworkResultCode.Success.rawValue,jsonObject,"")
                }
            }else if response.response != nil{
                var errorMsg = Network.errorMessage
                if let errMsg = response.result.error?.localizedDescription {
                    errorMsg = errMsg
                }
                debugLog("errorMsg:\(errorMsg)")
                completion(response.response!.statusCode,nil,errorMsg)
            }else{
                completion(NetworkResultCode.NetworkError.rawValue,nil,Network.errorMessage)
            }
        }
    }
    
}
