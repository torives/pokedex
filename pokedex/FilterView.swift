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
        VStack(alignment: .leading) {
            Group {
                Text("Filters")
                    .pokemonNameTextStyle()
                    .padding(.bottom, 5)
                
                Text("Use advanced search to explore Pokémon by type, weakness, height and more")
                    .descriptionTextStyle()
                    .padding(.bottom, 34)
            }
            
            Group {
                Text("Types")
                    .filterTitleTextStyle()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20.0) {
                        ForEach(PokemonType.allCases, id: \.rawValue) { type in
                            PokemonTypeToggle(type: type, isOn: self.$isOn)
                        }
                    }
                }
                
                Text("Weaknesses")
                    .filterTitleTextStyle()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20.0) {
                        ForEach(PokemonType.allCases, id: \.rawValue) { type in
                            PokemonTypeToggle(type: type, isOn: self.$isOn)
                        }
                    }
                }
                
                Text("Heights")
                    .filterTitleTextStyle()
                HStack(spacing: 20.0) {
                    ForEach(PokemonHeight.allCases, id: \.rawValue) { height in
                        PokemonHeightToggle(height: height, isOn: self.$isOn)
                    }
                }
                
                Text("Weights")
                    .filterTitleTextStyle()
                HStack(spacing: 20.0) {
                    ForEach(PokemonWeight.allCases, id: \.rawValue) { weight in
                        PokemonWeightToggle(weight: weight, isOn: self.$isOn)
                    }
                }
            }
            
            Text("Number Range")
                .filterTitleTextStyle()
            Slider(value: $number)
            
            HStack(alignment: .center) {
                Button("Reset") {
                    
                }
                Button("Apply") {
                    
                }
            }
            
        }.padding()
    }
}


struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
