//
//  ToggleButton.swift
//  pokedex
//
//  Created by Victor Yves Crispim on 26/04/20.
//  Copyright © 2020 yves. All rights reserved.
//

import SwiftUI

struct ToggleButton: View {
    var body: some View {
        Button(action: {}) {
            Text("Toggle")
        }
    }
    
}


#if DEBUG
struct ToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        ToggleButton()
    }
}
#endif

