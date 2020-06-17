//
//  Home.swift
//  pokedex
//
//  Created by yves on 21/05/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State private var isPresentingSheet = false
    @State private var sheetText = ""
    
    var body: some View {
        NavigationView {
            HStack {
                Button(action: {
                    self.isPresentingSheet.toggle()
                    self.sheetText = "Generation"
                }, label: {
                    Text("Generation")
                })
                Button(action: {
                    self.isPresentingSheet.toggle()
                    self.sheetText = "Sort"
                }, label: {
                    Text("Sort")
                })
                Button(action: {
                    self.isPresentingSheet.toggle()
                    self.sheetText = "Filter"
                }, label: {
                    Text("Filter")
                })
                NavigationLink(destination: PokemonDetail()) {
                    Text("Pokemon Detail")
                }
            }
            .sheet(isPresented: $isPresentingSheet) {
                Text(self.sheetText)
            }
        }
    }
}

struct PokemonDetail: View {
       
    var body: some View {
        Text("Pokemon Detail")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
