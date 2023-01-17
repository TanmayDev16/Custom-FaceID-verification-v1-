//
//  credview.swift
//  Faceid-verification
//
//  Created by Tanmay on 09/01/23.
//

import SwiftUI

struct credview: View {
    @EnvironmentObject var authManager : authmanager
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        ZStack {
            AngularGradient (gradient: Gradient (colors: [.gray,.brown,.gray,.purple,.red,.purple]), center:.center)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing : 20){
                title()

                TextField("Username", text:$username)
                    .foregroundColor(.black)
                    .background(.white)
                    .padding(.horizontal)
                SecureField("Password",text:$password)
                    .foregroundColor(.black)
                    .background(.white)
                    .padding(.horizontal)
                
                button(isvisible: false, text: "login")
                    .onTapGesture{
                        authManager.loginwithcred(username: username, password: password)
                    }
                
            }
            .bold()
            .padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity)
        }}}

struct credview_Previews: PreviewProvider {
    static var previews: some View {
        credview()
            .environmentObject(authmanager())
    }
}
