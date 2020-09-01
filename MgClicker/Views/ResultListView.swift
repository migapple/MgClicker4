//
//  ResultListView.swift
//  MgClicker
//
//  Created by Michel Garlandat on 24/08/2020.
//

import SwiftUI

struct ResultListView: View {
    let resultList:[GameResult]
    @StateObject var gameManager = GameManager()
    
    var body: some View {
        VStack {
            if !gameManager.gameInProgress {
                // On Affiche le Hall of fames
                if gameManager.resultList.count > 0 {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("Hall of fame")
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    .padding()
                }
                
                List(resultList) { result in
                    HStack {
                        Text("\(result.nickName) - \(result.score)")
                    }
                }
            }
        }
    }
}

struct ResultListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView(resultList: [
            GameResult(nickName: "Fifi", score: 20),
            GameResult(nickName: "Loulou", score: 30),
            GameResult(nickName: "Riri", score: 10),
            GameResult(nickName: "Michel", score: 100)
        ])
        .previewLayout(.sizeThatFits)
        .environmentObject(GameManager())
    }
}
