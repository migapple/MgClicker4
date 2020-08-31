//
//  CountdownView.swift
//  MgClicker
//
//  Created by Michel Garlandat on 31/08/2020.
//

import SwiftUI

struct CountdownView: View {
    var timeRemaining: Int
    var countTo: Int = 10
    
    var body: some View {
        VStack {
            ZStack {
                ProgressTrackView()
                ProgressBarView(counter: timeRemaining, countTo: countTo)
                ClockView(counter: timeRemaining, countTo: 10)
            }
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(timeRemaining: 4)
    }
}
