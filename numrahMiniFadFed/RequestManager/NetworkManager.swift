//
//  NetworkManager.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 27/10/24.
//


import Foundation
import SwiftyJSON
import UIKit


final class NetworManger {
    
    //        func UserData(comp: @escaping (_ model: UserDataModel?, _ isError: Bool) -> Void){
    //            let config = URLSessionConfiguration.default
    //            let session = URLSession(configuration: config)
    //            var url: URL? = nil
    //
    //            url = URL(string: Domain.dev + APIEndpoint.auth)!
    //            var urlRequest = URLRequest(url: url!)
    //            urlRequest.httpMethod = "PUT"
    //            urlRequest.setValue("application/json", forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
    //                    urlRequest.setValue("Authorization ", forHTTPHeader?Field: HTTPHeaderField.authentication)
    //            print("urlrequest : \(urlRequest)")
    //
    //            let task = session.dataTask(with: urlRequest) { (data, response, error ) in
    //                if let response = response as? HTTPURLResponse, response.isResponseOK() {
    //                    if let data = data {
    //                                            print("JSON vegeta = ",JSON(data))
    //                        let parseData = try? JSONDecoder().decode(UserDataModel.self, from: data)
    //                        //                    print("parseData vegeta = ",parseData)
    //                        comp(parseData, false)
    //                    } else {
    //                        comp(nil, true)
    //                    }
    //                } else {
    //                    comp(nil, true)
    //                }
    //            }
    //            task.resume()
    //        }
}



 
