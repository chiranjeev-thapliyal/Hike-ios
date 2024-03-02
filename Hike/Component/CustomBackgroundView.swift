//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Chiranjeev Thapliyal on 01/03/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // Adding Depth (shadow) to card
            Color.customGreenDark.cornerRadius(40).offset(y: 12)
            
            // Adding Light
            Color.customGreenLight.cornerRadius(40).offset(y: 4)
            
            LinearGradient(colors: [Color.customGreenLight, Color.customGreenMedium], startPoint: .top, endPoint: .bottom).cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView().padding()
}
