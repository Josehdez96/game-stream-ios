//
//  SearchGame.swift
//  GameStream
//
//  Created by owner on 26/09/22.
//

import Foundation

class SearchGame: ObservableObject {
    
    @Published var searchedGame: GameViewObject?
    
    func search(gameName: String) -> Void {
        searchedGame = nil
        let gameWithoutSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) // Eliminación de espacios para usarlos en la url despues
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameWithoutSpaces ?? "cuphead")")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let jsonData = data {
                    let decodeData = try JSONDecoder().decode(SearchResults.self, from: jsonData)
                    
                    // Aquí le decimos a Swift, "vete a otro hilo diferente del CPU, otro hilo diferente a donde está la UI de la app para no trabarla mientras asigna estos valores
                    DispatchQueue.main.async {
                        print("2. El juego BUSCADO es: \(decodeData.results[0])")
                        self.searchedGame = GameViewObject(game: decodeData.results[0])
                    }
                }
            } catch {
                print("Hemos tenido un error: \(error)")
            }
        }.resume() // Para que continue la app

    }
}
