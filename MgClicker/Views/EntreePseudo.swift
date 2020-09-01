//
//  EntreePseudo.swift
//  MgClicker
//
//  Created by Michel Garlandat on 01/09/2020.
//

import SwiftUI

struct EntreePseudo: View {
    
    @State private var entreeNom = false
    @Binding var nickname: String
    
    var body: some View {
        HStack {
            if entreeNom {
                EditableTextView(title: "Entrez votre pseudo", editedText: $nickname)
            }
            
            Spacer()
            Image(systemName: "pencil.circle")
                .padding()
                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    entreeNom.toggle()
                })
        }
    }
}

struct EntreePseudo_Previews: PreviewProvider {
    static var previews: some View {
        EntreePseudo(nickname: .constant("Michel"))
    }
}
