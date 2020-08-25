//
//  AideView.swift
//  MgClicker
//
//  Created by Michel Garlandat on 25/08/2020.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack {
            Text("Le but du jeux est d'appuyer le plus vite possible sur le bouton")
                .padding()
            
            Image(systemName: "plus.square")
                .font(.title)
                .padding()
            
            Text("pendant 10 secondes")
                .padding()
            
            Text("N'oubliez pas d'entrer votre pseudo pour entrer dans le hall of fames.")
                .padding()
        }
    }
}

struct AideView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
