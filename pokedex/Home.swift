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
    @State private var activeSheet: ActiveSheet = .none
    
    var body: some View {
        NavigationView {
            HStack {
                Button(action: {
                    self.isPresentingSheet.toggle()
                    self.activeSheet = .generation
                }, label: {
                    Text("Generation")
                })
                Button(action: {
                    self.isPresentingSheet.toggle()
                    self.activeSheet = .sort
                }, label: {
                    Text("Sort")
                })
                Button(action: {
                    self.isPresentingSheet.toggle()
                    self.activeSheet = .filter
                }, label: {
                    Text("Filter")
                })
                
                NavigationLink(destination: PokemonDetail()) {
                    Text("Pokemon Detail")
                }
            }
            .sheet(isPresented: $isPresentingSheet) {
                if(self.activeSheet == .generation) {
                    GenerationView()
                } else if(self.activeSheet == .sort) {
                    SortView()
                } else if(self.activeSheet == .filter) {
                    FilterView()
                } else {
                    EmptyView()
                }
            }
        }
    }
}

enum ActiveSheet {
    case none, filter, sort, generation
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
