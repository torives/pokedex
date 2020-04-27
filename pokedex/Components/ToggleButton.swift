//
//  ToggleButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 26/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct ToggleStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        Circle()
    }
}


struct ToggleButton: View {
    var body: some View {
        Button(action: {}) {
            Text("Toggle")
        }
        .buttonStyle(ToggleStyle())
    }
}


#if DEBUG
struct ToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        ToggleButton().previewLayout(.fixed(width: 100, height: 100))
    }
}
#endif

