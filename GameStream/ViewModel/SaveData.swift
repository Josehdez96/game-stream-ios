//
//  SaveData.swift
//  GameStream
//
//  Created by owner on 28/09/22.
//

import Foundation

class SaveData {
    private var userDefaultsKey = "userData"
    var email: String = ""
    var password: String = ""
    var name: String = ""
    
    func saveData(email: String, password: String, name: String) -> Void {
        UserDefaults.standard.set([email, password, name], forKey: userDefaultsKey)
    }
    
    func recoverData() -> Void {
        let userData = UserDefaults.standard.stringArray(forKey: userDefaultsKey)
        print("DATOS RECUPERADOS: \(userData ?? ["NADA PRRO"])")
    }

}
