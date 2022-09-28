//
//  SignInView.swift
//  GameStream
//
//  Created by owner on 15/09/22.
//

import SwiftUI

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isHomeViewActive = false
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                EmailFieldView(title: "Correo eletrónico", email: self.email).padding(.top, 60)
                PasswordFieldView(title: "Contraseña", password: self.password)
                
                Text("¿Olvidaste tu contraseña?").foregroundColor(Color("dark-cian")).font(.system(size: 12)).frame(maxWidth: .infinity, alignment: .trailing).padding(.bottom, 30)
                
                LogInButtonView(buttonTitle: "INICIAR SESIÓN", action: logIn)
                
                Text("Inicia sesión con redes sociales").foregroundColor(.white).frame(maxWidth: .infinity).padding(EdgeInsets(top: 40, leading: 0, bottom: 15, trailing: 0))
                
                HStack(alignment: .center, spacing: 15){
                    SocialNetworkButtonView(buttonTitle: "Facebook")
                    SocialNetworkButtonView(buttonTitle: "Twitter")
                }.frame(maxWidth: .infinity)
                
            }.padding(.horizontal, 40)
            NavigationLink(isActive: $isHomeViewActive, destination: { HomeView() }, label: { EmptyView() })
        }
    }
    
    func logIn() -> Void {
        isHomeViewActive = true
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
