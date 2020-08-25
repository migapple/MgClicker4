//
//  GameManager.swift
//  MgClicker
//
//  Created by Michel Garlandat on 24/08/2020.
//

import Foundation

class GameManager: ObservableObject {
    @Published var resultList: [GameResult] = []
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
}
