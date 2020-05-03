//
//  PokemonGeneration.swift
//  pokedex
//
//  Created by yves on 01/05/20.
//  Copyright © 2020 yves. All rights reserved.
//

import Foundation

//swiftlint:disable identifier_name
enum PokemonGeneration: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case I, II, III, IV, V, VI, VII, VIII
}
