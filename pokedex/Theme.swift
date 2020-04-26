//
//  Theme.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 25/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct Theme {
    struct Background {
        static let default_input = Color("background-default-input")
        static let modal = Color("background-modal")
        static let pressed_input = Color("background-pressed-input")
        static let selected_input = Color("background-selected-input")
        static let white = Color("background-white")
    }
    
    struct Heights {
        static let medium = Color("height-medium")
        static let short = Color("height-short")
        static let tall = Color("height-tall")
    }
    
    struct Text {
        static let black = Color("text-black")
        static let grey = Color("text-grey")
        static let number = Color("text-number")
        static let white = Color("text-white")
    }
    
    struct PokemonType {
        static let bug = Color("type-bug")
        static let dark = Color("type-dark")
        static let dragon = Color("type-dragon")
        static let electric = Color("type-electric")
        static let fairy = Color("type-fairy")
        static let fighting = Color("type-fighting")
        static let fire = Color("type-fire")
        static let flying = Color("type-flying")
        static let ghost = Color("type-ghost")
        static let grass = Color("type-grass")
        static let ground = Color("type-ground")
        static let ice = Color("type-ice")
        static let normal = Color("type-normal")
        static let poison = Color("type-poison")
        static let psychic = Color("type-psychic")
        static let rock = Color("type-rock")
        static let steel = Color("type-steel")
        static let water = Color("type-water")
        static let bug_background = Color("background-type-bug")
        static let dark_background = Color("background-type-dark")
        static let dragon_background = Color("background-type-dragon")
        static let electric_background = Color("background-type-electric")
        static let fairy_background = Color("background-type-fairy")
        static let fighting_background = Color("background-type-fighting")
        static let fire_background = Color("background-type-fire")
        static let flying_background = Color("background-type-flying")
        static let ghost_background = Color("background-type-ghost")
        static let grass_background = Color("background-type-grass")
        static let ground_background = Color("background-type-ground")
        static let ice_type_background = Color("background-type-ice")
        static let normal_background = Color("background-type-normal")
        static let poison_background = Color("background-type-poison")
        static let psychic_background = Color("background-type-psychic")
        static let rock_background = Color("background-type-rock")
        static let steel_background = Color("background-type-steel")
        static let water_background = Color("background-type-water")
    }
    
    struct Weights {
        static let heavy = Color("weight-heavy")
        static let light = Color("weight-light")
        static let normal = Color("weight-normal")
    }
    
    struct Gradients {
        static let vector_gray = [
            Color(red: 0.899, green: 0.899, blue: 0.899, opacity: 1),
            Color(red: 0.961, green: 0.961, blue: 0.961, opacity: 0)]
        static let vector_white = [
            Color(red: 1, green: 1, blue: 1, opacity: 1),
            Color(red: 1, green: 1, blue: 1, opacity: 0)]
    }
}
