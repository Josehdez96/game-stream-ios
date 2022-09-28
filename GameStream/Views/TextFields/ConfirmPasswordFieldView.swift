//
//  ConfirmPasswordFieldView.swift
//  GameStream
//
//  Created by owner on 19/09/22.
//

import SwiftUI

struct ConfirmPasswordFieldView: View {
    
    init(title: String, confirmPassword: String) {
        self.title = title
        self.confirmPassword = confirmPassword
    }
    
    var title: String
    @State private var confirmPassword = ""
    var body: some View {
        VStack(alignment: .leading){
            Text(title).foregroundColor(.white).bold().padding(.top, 10)
            
            ZStack(alignment: .leading){
                if confirmPassword.isEmpty {
                    Text("*******").font(.caption).foregroundColor(.gray)
                }
                SecureField("", text: $confirmPassword).foregroundColor(.white)
            }
            
            Divider().frame(height: 1).background(.white).padding(.top, -8)
        }
    }
}

struct ConfirmPasswordFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmPasswordFieldView(title: "", confirmPassword: "")
    }
}
