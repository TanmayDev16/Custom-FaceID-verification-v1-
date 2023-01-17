//
//  ContentView.swift
//  Faceid-verification
//
//  Created by Tanmay on 09/01/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authManager = authmanager()
    var body: some View {
        NavigationView{
            VStack {
                faceidview()
                    .environmentObject(authManager)
            }

            .edgesIgnoringSafeArea(.all)
            
            //this is a catch kind of block to prevent crashing of this faceid app due to some unwanted bugs
            .alert(isPresented: $authManager.showalert){
                Alert(title: Text("Error detecting you face"),dismissButton: .default(Text("OK")))
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
