//
//  CountrySelectionView.swift
//  FlagPhoneNumberUI
//
//  Created by Oscar Rodriguez Garrucho on 1/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import SwiftUI

struct CountrySelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedCountry: Country
    @State private var countries: [Country] = []
    @State private var searchText: String = ""  // Propiedad para el buscador
    
    var body: some View {
        VStack {
            // Buscador en la parte superior
            TextField("Buscar país", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()
            
            List(filteredCountries, id: \.self) { country in
                Button(action: {
                    selectedCountry = country
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(country.countryCode)
                        Text(country.localizedName)
                            .foregroundStyle(.black)
                        Spacer()
                        Text(country.phonePrefix)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
        .navigationTitle("Selecciona un país")
        .onAppear {
            countries = loadCountries()
        }
    }
    
    // Lista filtrada basada en el texto del buscador
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { $0.localizedName.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    
    
    func loadCountries() -> [Country] {
        guard let url = Bundle.main.url(forResource: "countryCodes", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decodedCountries = try? JSONDecoder().decode([Country].self, from: data) else {
            return []
        }
        return decodedCountries
    }
}
