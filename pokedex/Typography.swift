//
//  Typography.swift
//  pokedex
//
//  Created by yves on 01/05/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct TitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(
            Font.custom("SFProDisplay-Bold", size: 100)
        )
    }
}

struct AppTitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(
            Font.custom("SFProDisplay-Bold", size: 32)
        )
    }
}

struct PokemonNameTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(
            Font.custom("SFProDisplay-Bold", size: 26)
        )
    }
}

struct FilterTitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(
            Font.custom("SFProDisplay-Bold", size: 16)
        )
    }
}

struct DescriptionTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(
            Font.custom("SFProDisplay-Regular", size: 16)
        )
    }
}

struct PokemonNumberTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(
            Font.custom("SFProDisplay-Bold", size: 12)
        )
    }
}

struct PokemonTypeTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(
            Font.custom("SFProDisplay-Medium", size: 12)
        )
    }
}

extension View {
    func titleTextStyle() -> some View {
        self.modifier(TitleTextStyle())
    }
    func appTitleTextStyle() -> some View {
        self.modifier(AppTitleTextStyle())
    }
    func pokemonNameTextStyle() -> some View {
        self.modifier(PokemonNameTextStyle())
    }
    func filterTitleTextStyle() -> some View {
        self.modifier(FilterTitleTextStyle())
    }
    func descriptionTextStyle() -> some View {
        self.modifier(DescriptionTextStyle())
    }
    func pokemonNumberTextStyle() -> some View {
        self.modifier(PokemonNumberTextStyle())
    }
    func pokemonTypeTextStyle() -> some View {
        self.modifier(PokemonTypeTextStyle())
    }
}

#if DEBUG
struct Typography_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Title").titleTextStyle()
            Text("Application Title").appTitleTextStyle()
            Text("Pokemon Name").pokemonNameTextStyle()
            Text("Filter Title").filterTitleTextStyle()
            Text("Description").descriptionTextStyle()
            Text("Pokemon Number").pokemonNumberTextStyle()
            Text("Pokemon Type").pokemonTypeTextStyle()
        }
    }
}
#endif
