//
//  OnCliqueSurPlus.swift
//  MgClicker
//
//  Created by Michel Garlandat on 01/09/2020.
//

import SwiftUI

struct OnCliqueSurPlus: View {
    @EnvironmentObject var gameManager: GameManager
    
    var body: some View {
        if gameManager.gameInProgress {
            Image(systemName: "plus.square")
                .font(.title)
                .onTapGesture {
                    gameManager.userTouchedClickButton()
                }
        }
    }
}

struct OnCliqueSurPlus_Previews: PreviewProvider {
    static var previews: some View {
        OnCliqueSurPlus().environmentObject(GameManager())
    }
}
