//
//  RegisterView.swift
//  GameStream
//
//  Created by owner on 15/09/22.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("Elije una foto de perfil").foregroundColor(.white).frame(maxWidth: .infinity).padding(.top, 35)
                
                Text("Puedes cambiar o elegirla mas adelante")
                    .foregroundColor(.gray).padding(.bottom)
                
                ZStack {
                    Image("foto-prueba").resizable().frame(width: 90, height: 90)
                    Image(systemName: "camera").resizable().foregroundColor(.white).frame(width: 30, height: 30)
                }
                
                EmailFieldView(title: "Correo eletrónico*", email: self.email).padding(.top, 8)
                PasswordFieldView(title: "Contraseña*", password: self.password)
                ConfirmPasswordFieldView(title: "Confirmar constraseña*", confirmPassword: self.confirmPassword)
                
                LogInButtonView(buttonTitle: "REGÍSTRATE", action: {}).padding(.top, 20)
                
                Text("Registrate con redes sociales").foregroundColor(.white).frame(maxWidth: .infinity).padding(EdgeInsets(top: 30, leading: 0, bottom: 15, trailing: 0))
                
                HStack(alignment: .center, spacing: 15){
                    SocialNetworkButtonView(buttonTitle: "Facebook")
                    SocialNetworkButtonView(buttonTitle: "Twitter")
                }.frame(maxWidth: .infinity)
                
                
            }.padding(.horizontal, 40)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
