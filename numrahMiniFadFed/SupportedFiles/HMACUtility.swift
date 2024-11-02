//
//  HMACUtility.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 02/11/24.
//

import Foundation
import CommonCrypto

public class HMACUtility {
    
    /// Generates an MD5 token based on session UUID and device UDID.
    /// - Parameters:
    ///   - sessionUUID: The UUID of the session.
    ///   - deviceUDID: The UDID of the device.
    /// - Returns: A token string or `nil` if generation fails.
    public static func generateMD5Token(sessionUUID: String?, deviceUDID: String?) -> String? {
        guard let sessionUUID = sessionUUID, let deviceUDIDData = deviceUDID?.data(using: .utf8) else {
            return nil
        }
        
        do {
            let hmac = try HMAC(key: sessionUUID, variant: .md5)
            let tokenData = try hmac.authenticate(deviceUDIDData)
            return tokenData.map { String(format: "%02hhx", $0) }.joined()
        } catch {
            print("HMAC generation error: \(error.localizedDescription)")
            return nil
        }
    }
    
    public enum HMACVariant {
        case md5, sha1, sha256, sha384, sha512
        
        var algorithm: CCHmacAlgorithm {
            switch self {
            case .md5: return CCHmacAlgorithm(kCCHmacAlgMD5)
            case .sha1: return CCHmacAlgorithm(kCCHmacAlgSHA1)
            case .sha256: return CCHmacAlgorithm(kCCHmacAlgSHA256)
            case .sha384: return CCHmacAlgorithm(kCCHmacAlgSHA384)
            case .sha512: return CCHmacAlgorithm(kCCHmacAlgSHA512)
            }
        }
        
        var digestLength: Int {
            switch self {
            case .md5: return Int(CC_MD5_DIGEST_LENGTH)
            case .sha1: return Int(CC_SHA1_DIGEST_LENGTH)
            case .sha256: return Int(CC_SHA256_DIGEST_LENGTH)
            case .sha384: return Int(CC_SHA384_DIGEST_LENGTH)
            case .sha512: return Int(CC_SHA512_DIGEST_LENGTH)
            }
        }
    }
    
    public struct HMAC {
        private let key: Data
        private let variant: HMACVariant
        
        public init(key: String, variant: HMACVariant) throws {
            guard let keyData = key.data(using: .utf8) else {
                throw NSError(domain: "Invalid key", code: 0, userInfo: nil)
            }
            self.key = keyData
            self.variant = variant
        }
        
        public func authenticate(_ data: Data?) throws -> Data {
            guard let data = data else {
                throw NSError(domain: "Invalid data", code: 1, userInfo: nil)
            }
            
            var result = Data(count: variant.digestLength)
            _ = result.withUnsafeMutableBytes { resultBytes in
                key.withUnsafeBytes { keyBytes in
                    data.withUnsafeBytes { dataBytes in
                        CCHmac(variant.algorithm, keyBytes.baseAddress, key.count, dataBytes.baseAddress, data.count, resultBytes.bindMemory(to: UInt8.self).baseAddress)
                    }
                }
            }
            return result
        }
    }
}
