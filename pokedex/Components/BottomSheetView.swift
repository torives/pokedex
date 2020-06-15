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
    
    private var offset: CGFloat {
        isExpanded ? 0 : maxHeight - minHeight
    }
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.secondary)
            .frame(width: 80, height: 6)
    }
    
    init(isExpanded: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self._isExpanded = isExpanded
        self.maxHeight = maxHeight
        self.minHeight = maxHeight * 0.5
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                self.indicator
                    .padding(.bottom, 6)
                    .padding(.top, self.maxHeight * 0.05)
                self.content
                    .cornerRadius(25)
            }
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: self.offset)
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isExpanded: .constant(false), maxHeight: 600) {
            Rectangle().fill(Color.red)
        }
    }
}
