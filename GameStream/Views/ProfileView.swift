//
//  ProfileView.swift
//  GameStream
//
//  Created by owner on 28/09/22.
//

import SwiftUI

struct ProfileView: View {
    @State var profileImage: UIImage = UIImage(named: "foto-prueba")!
    var body: some View {
        ZStack{
            Color("general-background-color").ignoresSafeArea()
            VStack{
                Text("Perfil").bold().foregroundColor(.white).frame(maxWidth: .infinity).padding([.top, .bottom], 30)

                ZStack {
                    Image(uiImage: profileImage).resizable().frame(width: 90, height: 90).clipShape(Circle())
                    Image(systemName: "camera").resizable().foregroundColor(.white).frame(width: 30, height: 30)
                }
                Text("Ana Banana").foregroundColor(.white).frame(maxWidth: .infinity)
                Spacer()
                SettingsSection()
                Spacer()
            }
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).onAppear(perform: {
            // Revisando si tengo datos de usuario
            if let profileImageExist = returnUiImage(named: "profilephoto.png") {
                profileImage = profileImageExist
            } else {
                print("No encontré imagen")
            }
            
        })
    }
    
    func returnUiImage(named: String) -> UIImage? {
        if let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: directory.absoluteString).appendingPathComponent(named).path)
        } else {
            return nil
        }
    }
}

struct SettingsSection: View {
    var body: some View {
        VStack(spacing: 2){
            Text("AJUSTES").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading).padding(15)
            SettingButton(settingTitle: "Cuenta")
            SettingButton(settingTitle: "Notificaciones", toggleButton: true)
            SettingButton(settingTitle: "Editar perfil")
            SettingButton(settingTitle: "Califica esta aplicación")
        }
    }
}

struct SettingButton: View {
    init(settingTitle: String, toggleButton: Bool = false) {
        self.settingTitle = settingTitle
        self.toggleButton = toggleButton
    }
    
    @State private var isToggleOn = true
    @State private var isSettingActive = false
    var settingTitle: String
    var toggleButton: Bool
    var body: some View {
        Button(action: { isSettingActive = true }) {
            ZStack{
                Color("blue-gray")
                HStack{
                    Text(settingTitle).foregroundColor(.white)
                    Spacer()
                    if toggleButton {
                        Toggle("", isOn: $isToggleOn)
                    } else {
                        Image(systemName: "chevron.right").foregroundColor(.white)
                    }
                }.padding(.horizontal, 15)
            }.frame(height: 65)
        }
        NavigationLink(isActive: $isSettingActive) {
            EditProfileView()
        } label: {
            EmptyView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
