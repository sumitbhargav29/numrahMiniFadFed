//
//  SignUpViewModel.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 31/10/24.
//
 
import Foundation
import CryptoKit
 
class SignUpViewModel: ObservableObject {
    
     private var savedDeviceID: String? {
        return UserDefaults.standard.string(forKey: "DeviceID")
    }
    
    private var savedSessionID: String? {
        return UserDefaults.standard.string(forKey: "SessionID")
    }
    
    private let baseURL = "https://dev.wefaaq.net/api/@fadfedx/auth"
    
    // Token generation method
    func generateToken(sessionID: String, devid: String) -> String {
        let key = SymmetricKey(data: Data(devid.utf8))
        let hmac = HMAC<Insecure.MD5>.authenticationCode(for: Data(sessionID.utf8), using: key)
        // Convert the HMAC to a hexadecimal string
        let token = hmac.map { String(format: "%02hhx", $0) }.joined()
        // Print the generated token
        print("kakarot Generated Token: \(token)")
        return token
    }
    
    
    func signUp(username: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        // Use saved values from UserDefaults for the device ID and session ID
        guard let devid = savedDeviceID,
              let sessionID = savedSessionID else {
            completion(false, "Device ID or Session ID is missing.")
            return
        }
        
        // Construct the URL for the sign-up request
        guard let url = URL(string: "\(baseURL)?devid=\(devid)&udid=\(sessionID)&token=\(generateToken(sessionID: sessionID, devid: devid))") else {
            completion(false, "Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue(sessionID, forHTTPHeaderField: "X-Session-ID")
        
        // Set up basic auth header
        let authValue = "\(devid):\(generateToken(sessionID: sessionID, devid: devid))"
        if let authData = authValue.data(using: .utf8) {
            let base64Auth = authData.base64EncodedString()
            request.setValue("Basic \(base64Auth)", forHTTPHeaderField: "Authorization")
            print("kakarot base64Auth = ",base64Auth)
            
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let signUpRequest = SignUpRequest(username: username, password: password)
        do {
            request.httpBody = try JSONEncoder().encode(signUpRequest)
        } catch {
            completion(false, "Error encoding signup request: \(error.localizedDescription)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    print("Network error: \(error.localizedDescription)")
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
                    let signUpResponse = try JSONDecoder().decode(SignUpResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(signUpResponse.success, signUpResponse.message)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(false, "Error decoding response: \(error.localizedDescription)")
                    }
                }
            } else {
                DispatchQueue.main.async {
                    print("Error: \(httpResponse.statusCode)")
                    completion(false, "Error: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}






//struct UserViewModel {

//    func getUserData(comp: @escaping (_ isInternet: Bool, _ isError: Bool, _ data: UserDataModel) -> Void) {
//        if NetworkReachability.shared.isConnectedToInternet() {
//            NetworManger().UserData { model, isError in
//                if isError {
//                    comp(true, true, nil)
//                } else {
//                    if let model = model {
//                        comp(true, false, model)
//                    } else {
//                        comp(true, true, nil)
//                    }
//                }
//            }
//        } else {
//            comp(false, false, nil)
//        }
//    }
//}
