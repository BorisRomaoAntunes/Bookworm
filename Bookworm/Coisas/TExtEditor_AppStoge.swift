//
//  TExtEditor_AppStoge.swift
//  Bookworm
//
//  Created by Boris R on 29/05/23.
//

import SwiftUI


struct TExtEditor_AppStoge: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView{
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct TExtEditor_AppStoge_Previews: PreviewProvider {
    static var previews: some View {
        TExtEditor_AppStoge()
    }
}
