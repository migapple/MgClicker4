//
//  ProgressTrackView.swift
//  MgClicker
//
//  Created by Michel Garlandat on 31/08/2020.
//

import SwiftUI

struct ProgressTrackView: View {
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle().stroke(Color.black.opacity(0.3), lineWidth: 15)
            )
    }
}

struct ProgressTrackView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTrackView()
    }
}
