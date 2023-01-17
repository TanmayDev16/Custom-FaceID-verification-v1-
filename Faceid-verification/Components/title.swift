//
//  LoginView.swift
//  Faceid-verification
//
//  Created by Tanmay on 09/01/23.
//

import SwiftUI

struct title: View {
    var body: some View {
        Text("Custom-Authentication")
            .italic().bold()
            .font(.title)
            .foregroundColor(.black)
            .padding()
            .background(.gray)
    }
}

struct title_Previews: PreviewProvider {
    static var previews: some View {
            title()

    }
}
