//
//  AfficheScore.swift
//  MgClicker
//
//  Created by Michel Garlandat on 01/09/2020.
//

import SwiftUI

struct AfficheScore: View {
    var isOnFire: Bool
    
    @EnvironmentObject var gameManager: GameManager
    
    var body: some View {
        // On affiche le score
        HStack {
            if isOnFire {
                Image(systemName: "flag.circle")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            
            Text("Score: \(gameManager.score)")
                .padding()
        }
        .font(.system(.largeTitle))
    }
}

struct AfficheScore_Previews: PreviewProvider {
    static var previews: some View {
        AfficheScore(isOnFire: true).environmentObject(GameManager())
    }
}
