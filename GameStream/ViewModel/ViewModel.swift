//
//  ViewModel.swift
//  GameStream
//
//  Created by owner on 21/09/22.
//

import Foundation

class ViewModel: ObservableObject {
    // Esta es la manera como se conecta el Model con el View Model y el [@Published] quiere decir que se va a "publicar" a cualquiera que quiera escuchar
    @Published var gamesInfo = [Game]()
    
    init() {
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let jsonData = data {
                    print("Tamaño del JSON: \(jsonData)")
                    
                    if let parsedResponse = response as? HTTPURLResponse {
                        print("STATUS CODE: \(parsedResponse.statusCode)")
                    }
                   
                    
                    let decodeData = try JSONDecoder().decode([Game].self, from: jsonData)
                    
                    // Aquí le decimos a Swift, "vete a otro hilo diferente del CPU, otro hilo diferente a donde está la UI de la app para no trabarla mientras asigna estos valores
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodeData)
                    }
                }
            } catch {
                print("Hemos tenido un error: \(error)")
            }
        }.resume() // Para que continue la app
    }
}
