//
//  SocialNetworkButtonView.swift
//  GameStream
//
//  Created by owner on 18/09/22.
//

import SwiftUI

struct SocialNetworkButtonView: View {
    init(buttonTitle: String) {
        self.buttonTitle = buttonTitle
    }
    
    var buttonTitle: String
    var body: some View {
        Button(action: {}, label: {
            Text(self.buttonTitle).foregroundColor(.white).font(.caption).fontWeight(.bold).frame(width: 100).padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20)).background(RoundedRectangle(cornerRadius: 10)).foregroundColor(Color(red: 28/255, green: 58/255, blue: 79/255, opacity: 1))
        })
    }
}

struct SocialNetworkButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SocialNetworkButtonView(buttonTitle: "")
    }
}
