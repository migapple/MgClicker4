//
//  Player.swift
//  MgClicker
//
//  Created by Michel Garlandat on 24/08/2020.
//

import Foundation

struct GameResult: Identifiable {
    let id = UUID()
    let nickName: String
    let score: Int
}
