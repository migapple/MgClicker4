//
//  ContentView.swift
//  MgClicker2
//
//  Created by Michel Garlandat on 24/08/2020.
//

import SwiftUI

struct GameView: View {
    @AppStorage("nickname") var nickname = ""
    @State private var showingHelp = false
   
    
    @StateObject var gameManager = GameManager()
    @State var tempsDuJeux = 10
    
    // Va lire bestGame de gameManager
    var isOnFire: Bool {
        guard let bestcore = gameManager.bestGame?.score else { return false }
        return gameManager.score > bestcore
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // On saisi le Pseudo
                EntreePseudo(nickname: $nickname)
                
               // Affiche le score
                AfficheScore(isOnFire: isOnFire).environmentObject(gameManager)
                
                // On Clique sur le +
                OnCliqueSurPlus().environmentObject(gameManager)
                    
                Spacer()
                
                if !gameManager.gameInProgress {
                    if gameManager.resultList.count == 0 {
                        Image("HallOfFame")
                            .padding()
                    }
                }
                
                // Affichage le Hall of fames
                ResultListView(resultList: gameManager.resultList).environmentObject(gameManager)
                
                // Affichage temps
                BandeauTempsRestant(tempsDuJeux: $tempsDuJeux).environmentObject(gameManager)
                
                // Boutons Nouvelle partie, clear score
                DebutDePartieView(nickname: nickname).environmentObject(gameManager)
            }
            .navigationBarTitle("Clicker")
            .navigationBarItems(trailing: Button(action: {
                showingHelp.toggle()
            }, label: {
                Image(systemName: "questionmark.circle")
                    .font(.title)
            }))
            .sheet(isPresented: $showingHelp, content: {
                HelpView()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView()
        }
    }
}
