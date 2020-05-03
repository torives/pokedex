//
//  ContentView.swift
//  pokedex
//
//  Created by yves on 24/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isOn = true
    
    var body: some View {
        VStack {
            Spacer()
            ScrollView(.horizontal) {
                HStack(spacing: 20.0) {
                    ForEach(PokemonType.allCases, id: \.rawValue) { type in
                        PokemonTypeToggle(type: type, isOn: self.$isOn)
                            .frame(width: 60, height: 120)
                    }
                }
            }
            Spacer()
            HStack(spacing: 20) {
                ForEach(PokemonHeight.allCases, id: \.rawValue) { height in
                    PokemonHeightToggle(height: height, isOn: self.$isOn)
                }
            }
            Spacer()
            HStack(spacing: 20) {
                ForEach(PokemonWeight.allCases, id: \.rawValue) { weight in
                    PokemonWeightToggle(weight: weight, isOn: self.$isOn)
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
