//
//  SortView.swift
//  pokedex
//
//  Created by yves on 21/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct SortView: View {
    @State var strategy: OrderingStrategy = .smallestNumber
    @State var isSmallestFirst = true
    @State var isHigherFirst = false
    @State var isAlphabetical = false
    @State var isReversedAlphabetical = false
    
    var body: some View {
        VStack(spacing: 35) {
            ViewHeader(
                title: Strings.sortViewTitle,
                subtitle: Strings.sortViewSubtitle
            )
            
            VStack(spacing: buttonSpacing) {
                Toggle(isOn: $isSmallestFirst) {
                    Text(Strings.sortViewOrderSmallestFirst)
                }
                
                Toggle(isOn: $isHigherFirst) {
                    Text(Strings.sortViewOrderHighestFirst)
                }
                
                Toggle(isOn: $isAlphabetical) {
                    Text(Strings.sortViewOrderAlphabetical)
                }
                
                Toggle(isOn: $isReversedAlphabetical) {
                    Text(Strings.sortViewOrderReverseAlphabetical)
                }
            }
            .toggleStyle(ColoredButtonToggleStyle())
            .frame(maxHeight: 3 * buttonSpacing + 4 * buttonHeight)
        }
        .padding(.top, 30)
        .padding(.horizontal, 40)
    }
}

enum OrderingStrategy {
    case smallestNumber, highestNumber, alphabetical, reversedAlphabetical
}

private let buttonSpacing: CGFloat = 20
private let buttonHeight: CGFloat = 60

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
    }
}
