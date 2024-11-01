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




// AuthRequest.swift
//import Foundation
//
//struct AuthRequest: Codable {
//    let username: String
//    let password: String
//}
//
//// AuthResponse.swift
//struct AuthResponse: Codable {
//    // Define the response properties based on the expected API response
//    let success: Bool
//    let message: String
//}



//class AuthViewModel {
//    // Callbacks to update the ViewController
//    var onSuccess: ((AuthResponse) -> Void)?
//    var onError: ((String) -> Void)?
//    var onLoading: ((Bool) -> Void)?
//    
//    func authenticate(username: String, password: String) {
//        
////        ?devid=C82110BE-E0BF-4E78-9F55-3CE05EEF75A3&udid=0376C83A-DD97-4443-9EF7-5F832A329FBC&token=4a9934ace460e22c06f9b7b71e17be23
//        
//        guard let url = URL(string: "https://dev.wefaaq.net/api/@fadfedx/auth") else {
//            onError?("Invalid URL")
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "PUT"
//        request.setValue("0376C83A-DD97-4443-9EF7-5F832A329FBC", forHTTPHeaderField: "X-Session-ID")
//        request.setValue("Basic QzgyMTEwQkUtRTBCRi00RTc4LTlGNTUtM0NFMDVFRUY3NUEzOjRhOTkzNGFjZTQ2MGUyMmMwNmY5YjdiNzFlMTdiZTIz", forHTTPHeaderField: "Authorization")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        // Encode the request body
//        let authRequest = AuthRequest(username: username, password: password)
//        guard let httpBody = try? JSONEncoder().encode(authRequest) else {
//            onError?("Failed to encode request")
//            return
//        }
//        request.httpBody = httpBody
//        
//        onLoading?(true) // Show loading indicator
//        
//        // Perform network request
//        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
//            DispatchQueue.main.async {
//                self?.onLoading?(false) // Hide loading indicator
//                
//                if let error = error {
//                    self?.onError?("Request failed: \(error.localizedDescription)")
//                    return
//                }
//                
//                guard let data = data else {
//                    self?.onError?("No data received")
//                    return
//                }
//                
//                // Decode response
//                do {
//                    let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
//                    self?.onSuccess?(authResponse)
//                } catch {
//                    self?.onError?("Failed to decode response: \(error.localizedDescription)")
//                }
//            }
//        }.resume()
//    }
//}
