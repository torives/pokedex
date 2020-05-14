//
//  Font+Ext.swift
//  pokedex
//
//  Created by yves on 01/05/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

extension Font {
    static let largeTitle =  Font.custom("SFProDisplay", size: 100).weight(.bold)
    static let appTitle =  Font.custom("SFProDisplay", size: 32).weight(.bold)
    static let pokemonName = Font.custom("SFProDisplay", size: 26).weight(.bold)
    static let filterTitle = Font.custom("SFProDisplay", size: 16).weight(.bold)
    static let description = Font.custom("SFProDisplay", size: 16).weight(.regular)
    static let pokemonNumber = Font.custom("SFProDisplay", size: 12).weight(.bold)
    static let pokemonType = Font.custom("SFProDisplay", size: 12).weight(.medium)
}

#if DEBUG
struct Typography_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Title").font(.title)
            Text("App Title").font(.appTitle)
            Text("Pokemon Name").font(.pokemonName)
            Text("Filter Title").font(.filterTitle)
            Text("Description").font(.description)
            Text("Pokemon Number").font(.pokemonNumber)
            Text("Pokemon Type").font(.pokemonType)
        }
    }
}
#endif
