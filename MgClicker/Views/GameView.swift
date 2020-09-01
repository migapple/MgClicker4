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
    @State private var entreeNom = false
    
    @StateObject var gameManager = GameManager()
    var tempsDuJeux = 10
    
    // Va lire bestGame de gameManager
    var isOnFire: Bool {
        guard let bestcore = gameManager.bestGame?.score else { return false }
        return gameManager.score > bestcore
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                // On saisi le Pseudo
                HStack {
                    if entreeNom {
                        EditableTextView(title: "Entrez votre pseudo", editedText: $nickname)
                    }
                    
                    Spacer()
                    Image(systemName: "pencil.circle")
                        .padding()
                        .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                            entreeNom.toggle()
                        })
                }
                
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
                
                // On Clique sur le +
                if gameManager.gameInProgress {
                    Image(systemName: "plus.square")
                        .font(.title)
                        .onTapGesture {
                            gameManager.userTouchedClickButton()
                        }
                }
                
                Spacer()
                
                if gameManager.resultList.count > 0 {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("All of fame")
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    .padding()
                }
                
                // Affichage de la liste de résultats
                    ResultListView(resultList: gameManager.resultList)
                
                // Affichage temps
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
                // Boutons Nouvelle partie, clear score
                
                if !gameManager.gameInProgress {
                    DebutDePartieView(nickname: nickname).environmentObject(gameManager)
                }
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
