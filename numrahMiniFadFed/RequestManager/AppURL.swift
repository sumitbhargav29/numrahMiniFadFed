//
//  AppURL.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 27/10/24.
//


import UIKit

struct Domain {
    static var dev = "https://dev.wefaaq.net/api/@fadfedx/"
}

extension Domain {
    static func baseUrl() -> String {
        print(Domain.dev)
        return Domain.dev
    }
}

struct APIEndpoint {
    static let auth  = "auth"
    static let login  = "login"

}

enum HTTPHeaderField: String {
    case authentication  = "Authorization"
    case contentType     = "Content-Type"
    case acceptType      = "Accept"
    case acceptEncoding  = "Accept-Encoding"
    case acceptLangauge  = "Accept-Language"
}

enum ContentType: String {
    case json            = "application/json"
    case multipart       = "multipart/form-data"
    case ENUS            = "en-us"
}

enum MultipartType: String {
    case image = "Image"
    case csv = "CSV"
}

enum MimeType: String {
    case image = "image/png"
    case csvText = "text/csv"
}

enum UploadType: String {
    case avatar
    case file
}



