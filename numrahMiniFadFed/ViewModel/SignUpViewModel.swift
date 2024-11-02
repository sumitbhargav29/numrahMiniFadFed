//
//  SignUpViewModel.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 31/10/24.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    private var savedDeviceID: String? {
        return UserDefaults.standard.string(forKey: "DeviceID")
    }
    
    private var savedSessionID: String? {
        return UserDefaults.standard.string(forKey: "SessionID")
    }
    
    private let baseURL = "https://dev.wefaaq.net/api/@fadfedx/auth"
    
    func signUp(username: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        
        guard NetworkReachability.shared.isConnectedToInternet() else {
            completion(false, "No internet connection.")
            return
        }
        
        guard let devid = savedDeviceID,
              let sessionID = savedSessionID else {
            completion(false, "Device ID or Session ID is missing.")
            return
        }
        
        // Generate the MD5 token using HMACUtility
        guard let token = HMACUtility.generateMD5Token(sessionUUID: sessionID, deviceUDID: devid) else {
            completion(false, "Failed to generate token.")
            return
        }
        
        // Construct the URL for the sign-up request
        guard let url = URL(string: "\(baseURL)?devid=\(devid)&udid=\(sessionID)&token=\(token)") else {
            completion(false, "Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue(sessionID, forHTTPHeaderField: "X-Session-ID")
        
        // Set up basic auth header
        guard let authToken = HMACUtility.generateMD5Token(sessionUUID: sessionID, deviceUDID: devid) else {
            completion(false, "Failed to generate auth token.")
            return
        }
        
        let authValue = "\(devid):\(authToken)"
        if let authData = authValue.data(using: .utf8) {
            let base64Auth = authData.base64EncodedString()
            request.setValue("Basic \(base64Auth)", forHTTPHeaderField: "Authorization")
            print("Base64Auth =", base64Auth)
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let signUpRequest = SignUpRequest(username: username, password: password)
        do {
            request.httpBody = try JSONEncoder().encode(signUpRequest)
        } catch {
            completion(false, "Error encoding signup request: \(error.localizedDescription)")
            return
        }
        
        // Execute the network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(false, "Network error: \(error.localizedDescription)")
                }
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(false, "No data or response")
                }
                return
            }
            
            if httpResponse.statusCode == 200 {
                do {
                    print("Raw data:", String(data: data, encoding: .utf8) ?? "Unable to decode data to String")
                    let signUpResponse = try JSONDecoder().decode(SignUpResponseModel.self, from: data)
                    
                    // Save `udid` and `token` in UserDefaults
                    UserDefaults.standard.set(signUpResponse.udid, forKey: "userUDID")
                    UserDefaults.standard.set(signUpResponse.token, forKey: "userToken")
                    
                    DispatchQueue.main.async {
                        completion(true, "Token received successfully")
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(false, "Error decoding response: \(error.localizedDescription)")
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(false, "Error: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}




