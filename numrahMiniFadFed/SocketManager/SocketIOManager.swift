//
//  SocketIOManager.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 31/10/24.
//

import Foundation
import SocketIO
import UIKit
import CommonCrypto

class SocketIOManager {
    
    private var savedDeviceID: String? {
        return UserDefaults.standard.string(forKey: "DeviceID")
    }
    
    private var savedSessionID: String? {
        return UserDefaults.standard.string(forKey: "SessionID")
    }
    
    private var savedUserToken: String? {
        return UserDefaults.standard.string(forKey: "userToken")
    }
    
    
    private var base64Auth: String?
    
    var socketManager = SocketManager(socketURL: SOCKET_DOMAIN)
    var socketClient: SocketIOClient?
    var isConnected:Bool = false
    static let shared: SocketIOManager = {
        let instance = SocketIOManager()
        return instance
    }()
    
    func connect() {
        
        guard let devid = savedDeviceID,
              let sessionID = savedSessionID else {
            //            completion(false, "Device ID or Session ID is missing.")
            return
        }
        
        // Generate the MD5 token using HMACUtility
        guard let token = HMACUtility.generateMD5Token(sessionUUID: sessionID, deviceUDID: devid) else {
            //            completion(false, "Failed to generate token.")
            return
        }
        
        
        
        
        if self.isConnected{return}
        self.isConnected = true
        print("try Connection")
        self.socketManager = SocketManager(socketURL: SOCKET_DOMAIN)
        
        //        let authValue = "\(devid):\(token)"
        //        if let authData = authValue.data(using: .utf8) {
        //            base64Auth = authData.base64EncodedString()
        //            print("Base64Auth =", base64Auth)
        //        }
        
        
        //with basic auth
        //        self.socketManager.setConfigs([.log(true), .compress, .forceNew(true), .reconnects(true), .reconnectAttempts(2), .reconnectWait(2) ,.forceWebsockets(true),.connectParams(["X-Session-ID":sessionID,"devid":devid,"token":token ,"Authorization":"Basic \(savedUserToken ?? "")" ]),.version(SocketIOVersion.three),.extraHeaders(["User-Agent" : "Fadfed/1.0(iOS/15.2)","Sec-WebSocket-Protocol":"v2.fadfedly.com"])])
        
        self.socketManager.setConfigs([.log(true), .compress, .forceNew(true), .reconnects(true), .reconnectAttempts(2), .reconnectWait(2) ,.forceWebsockets(true),.connectParams(["X-Session-ID":sessionID,"devid":devid,"token":token ,"auth": savedUserToken ?? "" ]),.version(SocketIOVersion.three),.extraHeaders(["User-Agent" : "Fadfed/1.0(iOS/15.2)","Sec-WebSocket-Protocol":"v2.fadfedly.com"])])
        
        
        print("see val of sessionID = ",sessionID)
        print("see val of devid = ",devid)
        print("see val of token = ",token)
        print("see val of savedUserToken = ",savedUserToken ?? "")
        
        
        self.socketClient = self.socketManager.defaultSocket
        
        self.socketClient!.connect()
        
        //        self.onConnect()
        //        self.onDisConnect()
        //        self.onReconnect()
    }
    
    func disconnect() {
        self.socketOffMethods()
        self.socketClient?.disconnect()
    }
    func isConneced() -> Bool{
        if self.socketClient?.status == .connected { return true }
        return false
    }
    
    func isDisconnected() -> Bool{
        if self.socketClient?.status == .disconnected { return true }
        return false
    }
    
    func socketOnMethods() {
        
    }
    
    func socketOffMethods() {
        self.socketClient?.off(clientEvent: .connect)
        //self.socketClient?.off(clientEvent: .disconnect)
        self.socketClient?.off(clientEvent: .reconnect)
        self.socketClient?.off(SOCKET_METHOD.listChats.rawValue)
        
    }
    
}
