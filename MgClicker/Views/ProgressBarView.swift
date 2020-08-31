//
//  ProgressBar.swift
//  MgClicker
//
//  Created by Michel Garlandat on 31/08/2020.
//

import SwiftUI

struct ProgressBarView: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .overlay(
                Circle().trim(from: 0, to: progress())
                .stroke(
                    style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round)
                )
                .foregroundColor(completed() ? Color.green: Color.blue).animation(.easeInOut(duration: 0.2))
                    .rotationEffect(.degrees(-90))
                
            )
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(counter: 2, countTo: 10)
    }
}
