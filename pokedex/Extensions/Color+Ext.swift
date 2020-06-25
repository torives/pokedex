//
//  Color+Ext.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 25/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

//swiftlint:disable cyclomatic_complexity
extension Color {
    struct Background {
        static let defaultInput = Color("background-default-input")
        static let modal = Color("background-modal")
        static let pressedInput = Color("background-pressed-input")
        static let selectedInput = Color("background-selected-input")
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
    
    struct Pokemon {
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
        static let bugBackground = Color("background-type-bug")
        static let darkBackground = Color("background-type-dark")
        static let dragonBackground = Color("background-type-dragon")
        static let electricBackground = Color("background-type-electric")
        static let fairyBackground = Color("background-type-fairy")
        static let fightingBackground = Color("background-type-fighting")
        static let fireBackground = Color("background-type-fire")
        static let flyingBackground = Color("background-type-flying")
        static let ghostBackground = Color("background-type-ghost")
        static let grassBackground = Color("background-type-grass")
        static let groundBackground = Color("background-type-ground")
        static let iceBackground = Color("background-type-ice")
        static let normalBackground = Color("background-type-normal")
        static let poisonBackground = Color("background-type-poison")
        static let psychicBackground = Color("background-type-psychic")
        static let rockBackground = Color("background-type-rock")
        static let steelBackground = Color("background-type-steel")
        static let waterBackground = Color("background-type-water")
    }
    
    struct Weights {
        static let heavy = Color("weight-heavy")
        static let light = Color("weight-light")
        static let normal = Color("weight-normal")
    }
    
    struct Gradients {
        static let dotPatternGray = LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.899, green: 0.899, blue: 0.899, opacity: 1),
                Color(red: 0.961, green: 0.961, blue: 0.961, opacity: 0)
            ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        
        static let dotPatternWhite = LinearGradient(gradient:
                                                        Gradient(colors: [
                                                            Color(red: 1, green: 1, blue: 1, opacity: 0.3),
                                                            Color(red: 1, green: 1, blue: 1, opacity: 0)
                                                        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        
        static let pokeballWhite = LinearGradient(gradient:
                                                    Gradient(colors: [
                                                        Color(red: 1, green: 1, blue: 1, opacity: 0.1),
                                                        Color(red: 1, green: 1, blue: 1, opacity: 0)
                                                    ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        
        static let pokeballGray = LinearGradient(gradient:
                                                    Gradient(colors: [
                                                        Color(red: 0.925, green: 0.925, blue: 0.925, opacity: 1),
                                                        Color(red: 0.961, green: 0.961, blue: 0.961, opacity: 1)
                                                    ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        
        static let pokeball = LinearGradient(gradient:
                                                Gradient(colors: [
                                                    Color(red: 0.961, green: 0.961, blue: 0.961, opacity: 1),
                                                    Color(red: 1, green: 1, blue: 1, opacity: 1)
                                                ]),
                                             startPoint: UnitPoint(x: 0.25, y: 0.5),
                                             endPoint: UnitPoint(x: 0.75, y: 0.5)
        )
    }
    
    static func from(type: PokemonType) -> Color {
        switch type {
            case .bug: return Color.Pokemon.bug
            case .dark: return Color.Pokemon.dark
            case .dragon: return Color.Pokemon.dragon
            case .electric: return Color.Pokemon.electric
            case .fairy: return Color.Pokemon.fairy
            case .fighting: return Color.Pokemon.fighting
            case .fire: return Color.Pokemon.fire
            case .flying: return Color.Pokemon.flying
            case .ghost: return Color.Pokemon.ghost
            case .grass: return Color.Pokemon.grass
            case .ground: return Color.Pokemon.ground
            case .ice: return Color.Pokemon.ice
            case .normal: return Color.Pokemon.normal
            case .poison: return Color.Pokemon.poison
            case .psychic: return Color.Pokemon.psychic
            case .rock: return Color.Pokemon.rock
            case .steel: return Color.Pokemon.steel
            case .water: return Color.Pokemon.water
        }
    }
    
    static func from(height: PokemonHeight) -> Color {
        switch height {
            case .short: return Color.Heights.short
            case .medium: return Color.Heights.medium
            case .tall: return Color.Heights.tall
        }
    }
    
    static func from(weight: PokemonWeight) -> Color {
        switch weight {
            case .light: return Color.Weights.light
            case .normal: return Color.Weights.normal
            case .heavy: return Color.Weights.heavy
        }
    }
}
