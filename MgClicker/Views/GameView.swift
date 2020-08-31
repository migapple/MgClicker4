//
//  ContentView.swift
//  MgClicker2
//
//  Created by Michel Garlandat on 24/08/2020.
//

import SwiftUI

struct GameView: View {
    @AppStorage("nickname") var nickname = ""
    @State private var score = 0
    @State private var gameInProgress = false
    @State private var showingAlert = false
    @State private var showingHelp = false
    
    @StateObject var gameManager = GameManager()
    
    @State private var timeRemaining = 10
    @State var timer: Timer? = nil
    
    // Va lire bestGame de gameManager
    var isOnFire: Bool {
        guard let bestcore = gameManager.bestGame?.score else { return false }
        return score > bestcore
    }
    
    var body: some View {
        NavigationView {
            VStack {
                EditableTextView(title: "Entrez votre pseudo", editedText: $nickname)
                
                HStack {
                    if isOnFire {
                        Image(systemName: "flame")
                    }
                    
                    Text("Score: \(score)")
                        .padding()
                }
                .font(.system(.largeTitle))
                
                // Debut du jeu
                if gameInProgress {
                    Image(systemName: "plus.square")
                        .font(.title)
                        .onTapGesture {
                            userTouchedClickButton()
                        }
                }
                
                Spacer()
                
                if gameManager.resultList.count > 0 {
                    HStack {
                        Image(systemName: "star")
                        Text("All of fame")
                        Image(systemName: "star")
                    }
                    .padding()
                }
                
                if !gameInProgress {
                    ResultListView(resultList: gameManager.resultList)
                }
                
                // Affichage temps
                if gameInProgress {
                    
                    CountdownView(timeRemaining: 10 - timeRemaining)
                        .padding()
                    
                    Text("Temps restant: \(timeRemaining) secondes")
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
                
                // Fin du jeu
                
                if !gameInProgress {
                    HStack {
                        Button("Nouvelle partie") {
                            if nickname == "" {
                                showingAlert = true
                            } else {
                                userTouchedStartButton()
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
    
    func clearScores() {
        
    }
    
    func userTouchedStartButton() {
        score = 0
        gameInProgress = true
        startTimer()
    }
    
    func userTouchedClickButton() {
        if gameInProgress {
            score += 1
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1,  repeats: true) {_ in
            timeRemaining -= 1
            
            if timeRemaining == 0 {
                stopTimer()
                gameInProgress = false
                gameDidFinish()
                timeRemaining = 10
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func gameDidFinish() {
        gameInProgress = false
        gameManager.gameDidFinish(nickname: nickname, score: score)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView()
            GameView()
                .preferredColorScheme(.dark)
        }
    }
}
