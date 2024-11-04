//
//  KeyNamesConstants.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 27/10/24.
//


import Foundation
import UIKit

let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate
let windowScene = UIApplication.shared.windows.first
let NotiCenter = NotificationCenter.default
let NavWindowSceneOBJ = UIApplication.shared.connectedScenes.first as? UIWindowScene
let sceneDelegate = NavWindowSceneOBJ?.delegate as? SceneDelegate


struct Constants {
    static let acceptHeader = "Accept"
    static let authorizationHeader = "Authorization"
    static let contentType = "Content-Type"
    static let contentTypeVal = "application/json"
    static let appNameType = "x-stored-app"
}

//MARK: - APP NAME
public let AppName :String = "Numrah MiniFadFed"

//MARK: - STORY BOARD NAMES
public let SB_MAIN :String = "Main"
public let MainInStoryboard = UIStoryboard(name: "Main", bundle: nil)


//MARK: - Socket.io constant
//var SOCKET_DOMAIN = URL.init(string:"wss://dev.wefaaq.net/")!
var SOCKET_DOMAIN = URL.init(string:"wss://dev.wefaaq.net/@fadfedx")!



//MARK: - VIEW CONTROLLER ID


//Login-Register
public let idHomeVC = "HomeVC"
public let idHomePage = "HomePage"
public let idSignUpVC = "SignUpVC"
public let idChatListVC = "ChatListVC"
public let idChatVC = "ChatVC"

 
//Custome PopUp
public let idSearchVCPopUp = "SearchVCPopUp"


// Table cell identifier
public let idChatListTVC = "ChatListTVC"
public let idTextMsgTVC = "TextMsgTVC"
public let idRTextMsgTVC = "RTextMsgTVC"




//MARK: - USER DEFAULTS KEY
let UD_IsLoggedIn  = "UDLoggedIn"
let UD_OnBoardScreenLoaded   = "UDOnBoardScreenLoaded"
let UD_ApiToken    = "UDApiToken"
let UD_ApiTokenTemp    = "UDApiTokenTemp"
let UD_AppVersion    = "UDAppVersion"

let UD_PushToken   = "UDPushToken"
let UD_UserDetails   = "UDUserDetails"
let UD_HideShowSwipeAlertMessage   = "UDHideShowSwipeAlertMessage"


//MARK: - FONT NAMES
let FT_Black = "Avenir-Black"
let FT_Book = "Avenir-Book"
let FT_Heavy = "Avenir-Heavy"
let FT_Light = "Avenir-Light"
let FT_Medium = "Avenir-Medium"
let FT_Roman = "Avenir-Roman"
let FT_Oblique = "Avenir-Oblique"


//MARK: - MESSAGES
let ServerResponseError = "Server Response Error"
let RetryMessage = "Something went wrong please try again..."
let InternetNotAvailable = "Internet connection appears to be offline."
let EnterFullname = "Please enter full name"

