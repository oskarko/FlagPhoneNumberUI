//
//  InternationalPhoneTextField.swift
//  FlagPhoneNumberUI
//
//  Created by Oscar Rodriguez Garrucho on 1/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI

public struct InternationalPhoneTextField<ButtonModifier: ViewModifier, TextFieldModifier: ViewModifier>: View {
    
    @Binding private var phonePrefix: String
    @Binding private var phoneNumber: String
    
    @State private var selectedCountry: Country = Country.defaultCountry
    @State private var isValid: Bool? = nil
    @State private var showingCountrySelection = false
    
    var buttonModifier: ButtonModifier
    var textFieldModifier: TextFieldModifier

    public init(
        phonePrefix: Binding<String>,
        phoneNumber: Binding<String>,
        buttonModifier: ButtonModifier = EmptyModifier(),
        textFieldModifier: TextFieldModifier = EmptyModifier()
    ) {
        self._phonePrefix = phonePrefix
        self._phoneNumber = phoneNumber
        self.buttonModifier = buttonModifier
        self.textFieldModifier = textFieldModifier
    }
    
    public var body: some View {
        HStack {
            // Image + Prefix Button
            Button(action: {
                showingCountrySelection = true
            }) {
                HStack {
                    Image(selectedCountry.countryCode)
                    Text(selectedCountry.phonePrefix)
                        .foregroundStyle(.black)
                }
            }
            .modifier(buttonModifier)
            
            // Phone number TextField
            TextField("Phone number", text: $phoneNumber)
                .keyboardType(.phonePad)
                .modifier(textFieldModifier)
            
            if let valid = isValid {
                Image(systemName: valid ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(valid ? .green : .red)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
        )
        .onAppear {
            phonePrefix = selectedCountry.phonePrefix
        }
        .onChange(of: phoneNumber) { _ in
            validatePhoneNumber()
        }
        .onChange(of: selectedCountry) { newSelectedCountry in
            phonePrefix = newSelectedCountry.phonePrefix
        }
        .sheet(isPresented: $showingCountrySelection) {
            CountrySelectionView(selectedCountry: $selectedCountry)
        }
    }
    
    private func validatePhoneNumber() {
        // whatever...
        isValid = phoneNumber.count >= 10
    }
}
