//
//  LogInButtonView.swift
//  GameStream
//
//  Created by owner on 18/09/22.
//

import SwiftUI

struct LogInButtonView: View {
    init(buttonTitle: String, action: @escaping () -> Void) {
        self.buttonTitle = buttonTitle
        self.action = action
    }
    
    var buttonTitle: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(self.buttonTitle).foregroundColor(.white).fontWeight(.bold).frame(maxWidth: .infinity).padding(.vertical, 10).overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("dark-cian"), lineWidth: 1).shadow(color: .white, radius: 5))
        }
    }
}

struct LogInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogInButtonView(buttonTitle: "", action: {})
    }
}
