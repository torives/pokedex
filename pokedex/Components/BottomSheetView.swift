//
//  BottomSheetView.swift
//  pokedex
//
//  Created by yves on 15/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct BottomSheetView<Content: View>: View {
    @Binding private var isExpanded: Bool
    
    private let maxHeight: CGFloat
    private let minHeight: CGFloat
    private let content: Content
    
    init(isExpanded: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self._isExpanded = isExpanded
        self.maxHeight = maxHeight
        self.minHeight = maxHeight * 0.5
        self.content = content()
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isExpanded: .constant(false), maxHeight: 600) {
            Rectangle().fill(Color.red)
        }.edgesIgnoringSafeArea(.all)
    }
}
