//
//  ListPokemonView.swift
//  pokedex
//
//  Created by yves on 21/05/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

//swiftlint:disable no_space_in_method_call
struct ListPokemonView: View {
    @State private var isPresentingSheet = false
    @State private var activeSheet: ActiveSheet = .none
    
    @State var lowerValue = 1.0
    @State var upperValue = 890.0
    
    var body: some View {
        RangeSlider(selectedLowerBound: $lowerValue, selectedUpperBound: $upperValue, in: lowerValue...upperValue)
//        NavigationView {
//            HStack {
//                Button {
//                    self.isPresentingSheet.toggle()
//                    self.activeSheet = .generation
//                } label: {
//                    Text("Generation")
//                }
//                Button {
//                    self.isPresentingSheet.toggle()
//                    self.activeSheet = .sort
//                } label: {
//                    Text("Sort")
//                }
//
//                Button {
//                    self.isPresentingSheet.toggle()
//                    self.activeSheet = .filter
//                } label: {
//                    Text("Filter")
//                }
//
//                NavigationLink(destination: PokemonDetail()) {
//                    Text("Pokemon Detail")
//                }
//            }
//            .sheet(isPresented: $isPresentingSheet) {
//                switch self.activeSheet {
//                    case .generation: GenerationView()
//                    case .sort: SortView()
//                    case .filter: FilterView()
//                    default: EmptyView()
//                }
//            }
//        }
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

struct ListPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        ListPokemonView()
    }
}
