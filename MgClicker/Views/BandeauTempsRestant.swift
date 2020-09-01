//
//  BandeauTempsRestant.swift
//  MgClicker
//
//  Created by Michel Garlandat on 01/09/2020.
//

import SwiftUI

struct BandeauTempsRestant: View {
    @Binding var tempsDuJeux: Int
    
    @EnvironmentObject var gameManager: GameManager
    
    var body: some View {
        if gameManager.gameInProgress {
            
            // Décompte avec progress View
            CountdownView(timeRemaining: tempsDuJeux - gameManager.timeRemaining)
                .padding()
            
            // Affichage temps restant bandeau noir
            Text("Temps restant: \(gameManager.timeRemaining) secondes")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .fill(Color.black)
                        .opacity(0.75)
                )
        }
    }
}

struct BandeauTempsRestant_Previews: PreviewProvider {
    static var previews: some View {
        BandeauTempsRestant(tempsDuJeux: .constant(10)).environmentObject(GameManager())
    }
}
