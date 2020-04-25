//
//  Badge.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 25/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct Badge: View {
    private let type: PokemonType
    
    private var backgroundColor: Color {
        switch type {
            case .bug: return Theme.PokemonType.bug
            case .dark: return Theme.PokemonType.dark
            case .dragon: return Theme.PokemonType.dragon
            case .electric: return Theme.PokemonType.electric
            case .fairy: return Theme.PokemonType.fairy
            case .fighting: return Theme.PokemonType.fighting
            case .fire: return Theme.PokemonType.fire
            case .flying: return Theme.PokemonType.flying
            case .ghost: return Theme.PokemonType.ghost
            case .grass: return Theme.PokemonType.grass
            case .ground: return Theme.PokemonType.ground
            case .ice: return Theme.PokemonType.ice
            case .normal: return Theme.PokemonType.normal
            case .poison: return Theme.PokemonType.poison
            case .psychic: return Theme.PokemonType.psychic
            case .rock: return Theme.PokemonType.rock
            case .steel: return Theme.PokemonType.steel
            case .water: return Theme.PokemonType.water
        }
    }
    
    init(type: PokemonType) {
        self.type = type
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 5.0) {
            Image("\(type.rawValue)-icon")
                .frame(width: 15.0, height: 15.0)
                .foregroundColor(Theme.Text.white)
            Text( type.rawValue.capitalized)
                .font(Font.custom("SFProDisplay-Medium", size: 12))
                .foregroundColor(Theme.Text.white)
        }
        .padding(.all, 5)
        .background(backgroundColor)
        .cornerRadius(3)
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge(type: .rock)
    }
}
