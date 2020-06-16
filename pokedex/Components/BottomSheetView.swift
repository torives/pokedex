//
//  BottomSheetView.swift
//  pokedex
//
//  Created by yves on 15/06/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct BottomSheetView<Content: View>: View {
    @Binding private var isPresented: Bool
    @GestureState private var translation: CGFloat = 0
    
    private let maxHeight: CGFloat
    private let minHeight: CGFloat
    private let content: Content
    
    private var offset: CGFloat {
        isPresented ? 0 : maxHeight - minHeight
    }
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.secondary)
            .frame(width: 80, height: 6)
    }
    
    init(isPresented: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.maxHeight = maxHeight
        self.minHeight = maxHeight * 0.5
        self.content = content()
    }
    
    var body: some View {
        let dragGesture =  DragGesture().updating(self.$translation) { value, state, _ in
            state = value.translation.height
        }.onEnded { value in
            let snapDistance = self.maxHeight * 0.25
            guard abs(value.translation.height) > snapDistance else {
                return
            }
            self.isPresented = value.translation.height > 0
        }
        
        return GeometryReader { geometry in
            VStack(spacing: 0) {
                self.indicator
                    .padding(.bottom, 6)
                    .padding(.top, self.maxHeight * 0.05)
                self.content
                    .cornerRadius(25, corners: [.topLeft, .topRight])
            }
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.translation, 0))
            .animation(.interactiveSpring())
            .gesture(dragGesture)
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isPresented: .constant(false), maxHeight: 600) {
            Rectangle().fill(Color.red)
        }
    }
}
