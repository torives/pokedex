//
//  FilterView.swift
//  pokedex
//
//  Created by yves on 17/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct FilterView: View {
    @State private var isOn = true
    @State private var number = 0.0
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 50) {
                VStack(alignment: .leading, spacing: 35) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Filters")
                            .pokemonNameTextStyle()
                        
                        Text("Use advanced search to explore Pokémon by type, weakness, height and more")
                            .lineLimit(2)
                            .descriptionTextStyle()
                            .foregroundColor(Color.Text.grey)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Types")
                            .filterTitleTextStyle()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20.0) {
                                ForEach(PokemonType.allCases, id: \.rawValue) { type in
                                    PokemonTypeToggle(type: type, isOn: self.$isOn)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Weaknesses")
                            .filterTitleTextStyle()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20.0) {
                                ForEach(PokemonType.allCases, id: \.rawValue) { type in
                                    PokemonTypeToggle(type: type, isOn: self.$isOn)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Heights")
                            .filterTitleTextStyle()
                        HStack(spacing: 20.0) {
                            ForEach(PokemonHeight.allCases, id: \.rawValue) { height in
                                PokemonHeightToggle(height: height, isOn: self.$isOn)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Weights")
                            .filterTitleTextStyle()
                        HStack(spacing: 20.0) {
                            ForEach(PokemonWeight.allCases, id: \.rawValue) { weight in
                                PokemonWeightToggle(weight: weight, isOn: self.$isOn)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Number Range")
                            .filterTitleTextStyle()
                        Slider(value: $number)
                    }
                }
                
                HStack(alignment: .center, spacing: 14) {
                    Button("Reset") {}
                        .buttonStyle(SecondaryButtonStyle())
                        .frame(width: 160, height: 60)
                    Button("Apply") {}
                        .buttonStyle(PrimaryButtonStyle())
                        .frame(width: 160, height: 60)
                }
            }
            .padding(.horizontal, 40.0)
            .padding(.top, 30)
            .padding(.bottom, 50)
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
