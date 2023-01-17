//
//  authmanager.swift
//  Faceid-verification
//
//  Created by Tanmay on 09/01/23.
//

import Foundation
import SwiftUI
import LocalAuthentication
class authmanager : ObservableObject{
    var context = LAContext()
    @Published  var biometrytype : LABiometryType = .none
    var canevaluatepolicy = false
    @Published var isauth = false
    @Published  var errordesc : String?
    @Published var showalert = false
    init(){
        getbiometrytype()
    }
    //using apple developer documentation for biometric policies and FaceID
    func getbiometrytype() {
        canevaluatepolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometrytype = LAContext().biometryType
    }
    func authorize() async {
        context = LAContext()
        if canevaluatepolicy{
            do{
                let success = try await LAContext().evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "user auth")
                if success{
                    DispatchQueue.main.async{
                        self.isauth = true
                        print("You are authorized",self.isauth)
                    }
                }
            }
            catch{
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errordesc=error.localizedDescription
                    self.showalert = true
                    self.biometrytype = .none
                }
            }
        }
    }
    
//sample test case to check for user authetication
func loginwithcred(username:String,password:String){
        if username.lowercased()=="tanmay" && password=="162003"{
            isauth = true
            print("Welcome",username)
        }
        else{
            isauth = false
            errordesc="wrong credentials"
            showalert = true
            print("unauthorized user")
        }
        
    }
}
