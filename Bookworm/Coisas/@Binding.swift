//
//  @Binding.swift
//  Bookworm
//
//  Created by Boris R on 29/05/23.
//

import SwiftUI
struct PushButton: View {
    let title : String
    @Binding var isOn: Bool
    
    var onColor = [Color.red, Color.yellow]
    var offColor = [Color(white: 0.6), Color(white: 0.4)]
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ?  onColor : offColor), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}
struct _Binding: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Lembreme", isOn: $rememberMe)
            Text(rememberMe ? "On" : "off")
        }

    }
}

struct _Binding_Previews: PreviewProvider {
    static var previews: some View {
        _Binding()
    }
}
