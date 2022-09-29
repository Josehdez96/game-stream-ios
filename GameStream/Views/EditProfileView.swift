//
//  EditProfileView.swift
//  GameStream
//
//  Created by owner on 28/09/22.
//

import SwiftUI

struct EditProfileView: View {
    @State var profileImage: Image? = Image("foto-prueba")
    @State var isPhotoLibraryActive = false
    var body: some View {
        ZStack {
            Color("general-background-color").ignoresSafeArea()
            VStack(spacing: 20){
                Text("Editar perfil").bold().foregroundColor(.white).frame(maxWidth: .infinity).padding([.top, .bottom], 30)

                
                Button(action: { isPhotoLibraryActive = true }) {
                    ZStack {
                        profileImage!.resizable().frame(width: 90, height: 90).clipShape(Circle())
                        Image(systemName: "camera").resizable().foregroundColor(.white).frame(width: 30, height: 30)
                    }.padding(.bottom, 40).sheet(isPresented: self.$isPhotoLibraryActive) {
                        SUImagePickerView(
                            sourceType: .photoLibrary,
                            image: self.$profileImage,
                            isPresented: self.$isPhotoLibraryActive
                        ).onAppear {
                            UINavigationBar.appearance().tintColor = .blue
                        }.onDisappear {
                            UINavigationBar.appearance().tintColor = .white
                        }
                    } // el metodo [sheet] es útil para mostrar información nueva sin necesidad de pasar a otra pantalla
                }
               


                EmailFieldView(title: "Correo eletrónico", email: "ejemplo@gmail.com")
                PasswordFieldView(title: "Contraseña", password: "", initialText: "Introduce tu nueva contraseña")
                GenericTextFieldView(title: "Nombre", initialText: "Introduce tu nombre de usuario").padding(.bottom, 35)
                LogInButtonView(buttonTitle: "ACTUALIZAR DATOS", action: { updateData() })
                Spacer()

            }.padding(.horizontal, 15)
        }
    }
    
    func updateData() -> Void {
        let saveData = SaveData()
        saveData.saveData(email: "joseda@gmail.com", password: "123", name: "Jose Daniel")
        saveData.recoverData()
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
