//
//  ResultListView.swift
//  MgClicker
//
//  Created by Michel Garlandat on 24/08/2020.
//

import SwiftUI

struct ResultListView: View {
    let resultList:[GameResult]
    
    var body: some View {
        List(resultList) { result in
            HStack {
                Text("\(result.nickName) - \(result.score)")
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
    }
}
