//
//  button.swift
//  Faceid-verification
//
//  Created by Tanmay on 09/01/23.
//

import SwiftUI

struct button: View {
    var faceicon : String = "person"
    var isvisible = true
    var text:String
    var body: some View {
        HStack{
            Image(systemName: faceicon)
            Text(text)
        }
        .italic().bold()
        .padding()
        .background(.brown)
        .cornerRadius(40)
    }
}

struct button_Previews: PreviewProvider {
    static var previews: some View {
        button(faceicon:"faceid",text:"Scan FaceID")
    }
}
