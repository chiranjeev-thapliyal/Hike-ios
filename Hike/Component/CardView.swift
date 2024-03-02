//
//  CardView.swift
//  Hike
//
//  Created by Chiranjeev Thapliyal on 01/03/24.
//

import SwiftUI

struct CardView: View {
    
    @State private var imageNumber: Int = 1;
    @State private var randomNumber: Int = 1;
    
    func changeImageRandomly(){
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView().padding()
            VStack {
                // MARK: Header
                VStack(alignment: .leading) {
                    HStack {
                        Text(
                            "Hiking"
                        ).font(
                            .system(
                                size: 52
                            )
                        ).fontWeight(
                            .black
                        ).foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color.customGrayLight,
                                    Color.customGrayMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        
                        Spacer()
                        
                        Button {
                            // MARK: Action for button
                            print("button pressed")
                        } label: {
                            CustomButtonView()
                        }
                    }
                    
                    Text(
                        "Fun and enjoyable outdoor activities for friends and families."
                    ).multilineTextAlignment(
                        .leading
                    ).italic().foregroundColor(
                        Color.customGrayMedium
                    )
                }.padding(.horizontal, 30)
                
                // MARK: Main Content
                
                ZStack {
                    CustomCircleView()
                    Image(
                        "image-\(imageNumber)"
                    ).resizable().scaledToFit()
                        .animation(.easeOut(duration: 0.5), value: imageNumber)
                }
                
                // MARK: Footer
                
                Button {
                    changeImageRandomly()
                } label: {
                    Text("Explore").font(.system(size: 40)).fontWeight(.black).foregroundStyle(LinearGradient(colors: [.colorGreenLight, .colorGreenMedium], startPoint: .top, endPoint: .bottom)).shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }.buttonStyle(GradientButton())
            }
        }// :Card
        .frame(
            width: 320,
            height: 570
        )
    }
}

#Preview {
    CardView()
}
