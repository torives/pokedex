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
    @State var leftValue = 1
    @State var rightValue = 890
    
    var body: some View {
          RangeSlider(selectedLowerBound: $leftValue, selectedUpperBound: $rightValue, in: 1...890)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
