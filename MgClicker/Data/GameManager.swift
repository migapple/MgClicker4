//
//  GameManager.swift
//  MgClicker
//
//  Created by Michel Garlandat on 24/08/2020.
//

import Foundation

class GameManager: ObservableObject {
//    var nickname: String = ""
    
//    init(nickname: String) {
//        self.nickname = nickname
//    }
    
    @Published var resultList: [GameResult] = []
    @Published var timer: Timer? = nil
    @Published var score = 0
    @Published var gameInProgress = false
    @Published var timeRemaining = 10
    
//    @Published var bestScore = 0
//    @Published var bestNickname = ""
    // Pas de Published sur une propriété calculée
    var bestGame: GameResult? { resultList.first }
    
    func gameDidFinish(nickname: String, score: Int) {
//        if score > bestScore {
//            bestScore = score
//            bestNickname = nickname
//        }
        
        let result = GameResult(nickName: nickname, score: score)
        // Prevenir que l'on a changé le tableau
        objectWillChange.send()
        
        resultList.append(result)
        resultList.sort { (result1, result2) -> Bool in
            result1.score > result2.score
        }
    }
    
    func clearScores() {
        resultList = []
    }
    
    func userTouchedStartButton(nickname: String) {
        score = 0
        self.gameInProgress = true
        startTimer(nickname: nickname)
    }
    
    func userTouchedClickButton() {
        if gameInProgress {
            score += 1
        }
    }
    
    func startTimer(nickname:String) {
        timer = Timer.scheduledTimer(withTimeInterval: 1,  repeats: true) { [self]_ in
            self.timeRemaining -= 1
            
            if self.timeRemaining == 0 {
                self.stopTimer()
                self.gameInProgress = false
                self.gameDidFinish(nickname: nickname, score: self.score)
                self.timeRemaining = 10
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}
