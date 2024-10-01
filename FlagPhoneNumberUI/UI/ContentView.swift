//
//  ContentView.swift
//  FlagPhoneNumberUI
//
//  Created by Oscar Rodriguez Garrucho on 1/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var phonePrefix1: String = ""
    @State private var phoneNumber1: String = ""
    
    @State private var phonePrefix2: String = ""
    @State private var phoneNumber2: String = ""
    
    var body: some View {
        VStack {
            InternationalPhoneTextField(
                phonePrefix: $phonePrefix1,
                phoneNumber: $phoneNumber1,
                buttonModifier: ButtonStyleModifier(),
                textFieldModifier: TextFieldStyleModifier()
            )
            .padding(.vertical)
            
            InternationalPhoneTextField(
                phonePrefix: $phonePrefix2,
                phoneNumber: $phoneNumber2
            )
            .padding(.vertical)
            
            Text("Phone1: \(phonePrefix1) \(phoneNumber1)")
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .clipShape(Capsule())
            
            Text("Phone2: \(phonePrefix2) \(phoneNumber2)")
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .clipShape(Capsule())
                
        }
        .padding()
    }
}

struct ButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.gray.opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct TextFieldStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .foregroundColor(.black)
    }
}

#Preview {
    ContentView()
}
