//
//  ButtonStyle.swift
//  MgClicker
//
//  Created by Michel Garlandat on 25/08/2020.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Capsule().fill(Color.blue))
            .foregroundColor(.white)
            .opacity(configuration.isPressed ? 0.4 : 1)
    }
}
