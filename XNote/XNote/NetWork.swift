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
    case Success = 0,Fail = -1,TokenExpirated = 401,NetworkError = -100,VerifyCodeExpirated = 10002,NeedReLogin = 1000,TimeOut = 504,BadGate = 502,NetTimeOut = -1001,cannotConnectServer = -1003,notConnectToInternet = -1009,lostConnection = -1005,GoodsNotEnough = 10003
    
    var errorMessage:String{
        switch self{
        case .NeedReLogin:
            return "请先登录"
        case .TimeOut,.NetTimeOut,.cannotConnectServer,.notConnectToInternet,.lostConnection:
            return "您的网络好像不太给力，请稍后重试"
        case .TokenExpirated:
            return "token失效"
        case .BadGate:
            return "请求数据失败"
        default:
            return "未知错误"
        }
    }
}

protocol NetworkRequest {
    func postRequest(header:[String:String]?,param:[String:AnyObject]?,urlString:String,completion:@escaping(_ code:NSInteger,_ result:JSON?,_ errorMessage:String)->Void)->Request?
    func getRequest(header:[String:String]?,param:[String:AnyObject]?,urlString:String,completion:@escaping(_ code:NSInteger,_ result:JSON?,_ errorMessage:String)->Void)->Request?
}

class Network:NSObject,NetworkRequest{
    
    static var sharedInstance = Network()
    
    var requestList = [Request]()
    
    private override init() {
        super.init()
    }
    
    internal func postRequest(header: [String : String]?, param: [String : AnyObject]?, urlString: String, completion: @escaping (NSInteger, JSON?, String) -> Void) -> Request? {

        #if DEBUG
            print("param:\(param),url:\(urlString),header:\(header)")
        #endif

        let request = Alamofire.request(urlString, method: .post, parameters: param, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            self.handleResult(response: response, completion: completion)
        }
        requestList.append(request)

        return request
    }

    internal func getRequest(header: [String : String]?, param: [String : AnyObject]?, urlString: String, completion: @escaping (NSInteger, JSON?, String) -> Void) -> Request? {
        
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
        urlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        let request = Alamofire.request(urlString, method: .get, parameters: param, encoding: URLEncoding.default, headers: header).responseString { (response) in
            self.handleResult(response: response, completion: completion)
        }
        requestList.append(request)
        return request
        
    }

    func handleResult(response:DataResponse<String>,completion:(_ code:NSInteger,_ result:JSON?,_ errorMessage:String)->Void){
//        for (i,_request) in self.requestList.enumerate(){
//            if _request.request == response.request{
//                self.requestList.removeAtIndex(i)
//                break
//            }
//        }
//        if response.result.isFailure == true{
//            var errorMsg = "未知错误"
//            if let code = response.result.error?.code{
//                if let networkError = NetworkResultCode(rawValue: code){
//                    errorMsg = networkError.errorMessage
//                    print("fail:\(code),\(errorMsg)")
//                }
//            }
//            completion(code: NetworkResultCode.NetworkError.rawValue, result: nil, errorMessage: errorMsg)
//        }
//        if response.result.isSuccess == true{
//            print(response.result.value)
//            if response.response?.statusCode < 500{
//                if let jsonObject = response.result.value?.jsonObject(){
//                    print(jsonObject.object)
//                    if jsonObject["code"].number == NetworkResultCode.Success.rawValue{
//                        print("success")
//                        completion(code:NetworkResultCode.Success.rawValue,result: jsonObject,errorMessage: "")
//                    }else{
//                        if let errorMsg = jsonObject["message"].string{
//                            if errorMsg == ""{
//                                completion(code:jsonObject["code"].number!.integerValue,result: nil,errorMessage: "未知错误")
//                            }else{
//                                completion(code:jsonObject["code"].number!.integerValue,result: nil,errorMessage: errorMsg)
//                            }
//                        }else{
//                            var errorCode = -1
//                            if let code = jsonObject["code"].number{
//                                errorCode = code.integerValue
//                            }
//                            completion(code:errorCode,result:nil,errorMessage: "未知错误")
//                        }
//                        
//                    }
//                    
//                }
//            }else if response.response != nil{
//                var errorMsg = "未知错误"
//                if let networkError = NetworkResultCode(rawValue: response.response!.statusCode){
//                    errorMsg = networkError.errorMessage
//                }else if let errorReason = response.result.error?.localizedFailureReason{
//                    errorMsg = errorReason
//                }
//                completion(code:response.response!.statusCode,result:nil,errorMessage: errorMsg)
//            }else{
//                completion(code:response.response!.statusCode,result:nil,errorMessage: "未知错误")
//            }
//            
//        }
    }
    
}
