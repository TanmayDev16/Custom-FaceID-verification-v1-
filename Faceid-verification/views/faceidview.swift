//
//  loginview.swift
//  Faceid-verification
//
//  Created by Tanmay on 09/01/23.
//

import SwiftUI

struct faceidview: View {
@EnvironmentObject var authManager : authmanager
   var body: some View {
        ZStack {
            AngularGradient (gradient: Gradient (colors: [.gray,.brown,.gray,.purple,.red,.purple]), center:.center)
                .edgesIgnoringSafeArea(.all)
            VStack (spacing :20){
                title()
//using apple developer biometricAuthentication
        switch authManager.biometrytype{
                case .faceID:
                    button(faceicon:"faceid",text:"login with face id")
                        .onTapGesture{
                            Task.init{
                                await authManager.authorize()
                            }}
                case .touchID:
                    button(faceicon:"touchid",text:"login with touch id")
                        .onTapGesture{
                            Task.init{
                                await authManager.authorize()
                            }}
                default:
                    NavigationLink{
                        credview().environmentObject(authManager)
                    }label: {
                        button(faceicon:"person",text:"login")
                    }
                }
            }
        }
        
    }
}

struct faecidview_Previews: PreviewProvider {
    static var previews: some View {
        faceidview()
            .environmentObject(authmanager())
    }
}
