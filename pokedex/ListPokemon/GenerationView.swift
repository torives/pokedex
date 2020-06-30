//
//  GenerationView.swift
//  pokedex
//
//  Created by yves on 19/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct GenerationView: View {
    @State private var isOn = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: bottomSheetItensVerticalSpacing) {
                ViewHeader(
                    title: Strings.generationViewTitle,
                    subtitle: Strings.generationViewSubtitle
                )
                
                //FIXME: Extract column width constant)
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 160), spacing: 14)],
                    spacing: 14
                ) {
                    ForEach(PokemonGeneration.allCases, id: \.self) { generation in
                        PokemonGenerationToggle(generation: generation, isOn: self.$isOn)
                    }
                }
            }
            .padding(.top, bottomSheetTopPadding)
            .padding(.bottom, bottomSheetBottomPadding)
            .padding(.horizontal, bottomSheetHorizontalPadding)
        }
    }
}

// MARK: -

struct GenerationFilterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GenerationView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            GenerationView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (2nd generation)"))
        }
    }
}
