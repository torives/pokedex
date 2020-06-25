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
            
            VStack(alignment: .leading, spacing: defaultVerticalSpacing) {
                
                ViewHeader(title: Strings.filterViewTitle, subtitle: Strings.filterViewSubtitle)
                    .padding(.horizontal, defaultHorizontalSpacing)
                
                VStack(alignment: .leading, spacing: horizontalListVerticalSpacing) {
                    Text(Strings.filterViewTypes)
                        .filterTitleTextStyle()
                        .padding(.leading, defaultHorizontalSpacing)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: horizontalListItemSpacing) {
                            ForEach(PokemonType.allCases, id: \.rawValue) { type in
                                PokemonTypeToggle(type: type, isOn: self.$isOn)
                            }
                        }
                        .padding(.horizontal, defaultHorizontalSpacing)
                        .padding(.bottom, shadowVisibilityOffset)
                    }
                }
                
                VStack(alignment: .leading, spacing: horizontalListVerticalSpacing) {
                    Text(Strings.filterViewWeaknesses)
                        .filterTitleTextStyle()
                        .padding(.leading, defaultHorizontalSpacing)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: horizontalListItemSpacing) {
                            ForEach(PokemonType.allCases, id: \.rawValue) { type in
                                PokemonTypeToggle(type: type, isOn: self.$isOn)
                            }
                        }
                        .padding(.horizontal, defaultHorizontalSpacing)
                        .padding(.bottom, shadowVisibilityOffset)
                    }
                }
                .offset(x: 0, y: -shadowVisibilityOffset)
                
                Group {
                    VStack(alignment: .leading, spacing: horizontalListVerticalSpacing) {
                        Text(Strings.filterViewHeights)
                            .filterTitleTextStyle()
                        HStack(spacing: horizontalListItemSpacing) {
                            ForEach(PokemonHeight.allCases, id: \.rawValue) { height in
                                PokemonHeightToggle(height: height, isOn: self.$isOn)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: horizontalListVerticalSpacing) {
                        Text(Strings.filterViewWeights)
                            .filterTitleTextStyle()
                        HStack(spacing: horizontalListItemSpacing) {
                            ForEach(PokemonWeight.allCases, id: \.rawValue) { weight in
                                PokemonWeightToggle(weight: weight, isOn: self.$isOn)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: sliderVerticalSpacing) {
                        Text(Strings.filterViewNumberRange)
                            .filterTitleTextStyle()
                        Slider(value: $number)
                    }
                    
                    HStack(alignment: .center, spacing: buttonHorizontalSpacing) {
                        Button(Strings.filterViewReset) {}
                            .buttonStyle(SecondaryButtonStyle())
                            .frame(width: buttonWidth, height: buttonHeight)
                        Button(Strings.filterViewApply) {}
                            .buttonStyle(PrimaryButtonStyle())
                            .frame(width: buttonWidth, height: buttonHeight)
                    }
                    .padding(.vertical, buttonVerticalSpacing)
                }
                .padding(.horizontal, defaultHorizontalSpacing)
                .offset(x: 0, y: -shadowVisibilityOffset * 2)
            }
            .padding(.top, 30)
        }
    }
}

private let defaultHorizontalSpacing: CGFloat = 40
private let defaultVerticalSpacing: CGFloat = 35
private let horizontalListVerticalSpacing: CGFloat = 10
private let horizontalListItemSpacing: CGFloat = 10
private let shadowVisibilityOffset: CGFloat = 25
private let buttonVerticalSpacing: CGFloat = 25
private let buttonHorizontalSpacing: CGFloat = 14
private let buttonHeight: CGFloat = 60
private let buttonWidth: CGFloat = 160
private let sliderVerticalSpacing: CGFloat = 20

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
