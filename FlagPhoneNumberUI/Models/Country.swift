//
//  Country.swift
//  FlagPhoneNumberUI
//
//  Created by Oscar Rodriguez Garrucho on 1/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

struct Country: Hashable, Decodable {
    var countryCode: String
    var phonePrefix: String
    
    // Propiedad computada para obtener el nombre del país en el idioma del teléfono
    var localizedName: String {
        let locale = Locale.current
        return locale.localizedString(forRegionCode: countryCode) ?? countryCode
    }
    
    enum CodingKeys: String, CodingKey {
        case countryCode = "code"
        case phonePrefix = "dial_code"
    }
    
    static let defaultCountry = Country(countryCode: "ES", phonePrefix: "+34")
}
