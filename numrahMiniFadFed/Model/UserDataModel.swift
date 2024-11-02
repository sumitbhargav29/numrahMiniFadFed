//
//  UserDataModel.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 31/10/24.
//

import Foundation

struct UserDataModel {
    let udid, token: String?
}
 
struct SignUpRequest: Encodable {
    let username: String
    let password: String
}

struct SignUpResponseModel: Decodable {
    let udid: String
    let token: String
}
