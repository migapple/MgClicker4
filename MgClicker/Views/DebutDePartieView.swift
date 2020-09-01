//
//  FinDePartieView.swift
//  MgClicker
//
//  Created by Michel Garlandat on 31/08/2020.
//

import SwiftUI

struct DebutDePartieView: View {
    var nickname: String
    
    @EnvironmentObject var gameManager: GameManager
    
    @State private var showingAlert = false
    
    var body: some View {
        HStack {
            if !gameManager.gameInProgress {
                Button("Nouvelle partie") {
                    if nickname == "" {
                        showingAlert = true
                    } else {
                        self.gameManager.userTouchedStartButton(nickname: nickname)
                    }
                }.padding()
                .buttonStyle(MyButtonStyle())
                .alert(isPresented: $showingAlert, content: {
                    Alert(title: Text("Erreur de saisie"), message: Text("Entrez un pseudo"), dismissButton: .default(Text("OK")))
                })
                
                Button("Clear Scores") {
                    gameManager.clearScores()
                }.padding()
                .buttonStyle(MyButtonStyle())
            }
        }
    }
}

struct FinDePartieView_Previews: PreviewProvider {
    static var previews: some View {
        DebutDePartieView(nickname: "toto").environmentObject(GameManager())
    }
}
