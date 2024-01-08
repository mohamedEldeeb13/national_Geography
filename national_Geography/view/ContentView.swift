//
//  ContentView.swift
//  national_Geography
//
//  Created by Mohamed Abd Elhakam on 27/12/2023.
//

import SwiftUI

struct ContentView: View {
    //: proparties
    @State private var imageScaled : CGFloat = 1
    @State private var imageOffset : CGSize = CGSize(width: 0.0, height: 0.0)
    var covers : [coverModel] = cover
    @State var coverIndex : Int = 0
    
    //: functions
    
    private func restImage(){
        imageOffset = .zero
        imageScaled = 1
    }
    
    
    var body: some View {
        
        Image(covers[coverIndex].coverName)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .padding()
            .shadow(color: Color(red: 0, green: 0, blue: 0 , opacity : 0.8), radius: 8, x: 3, y: 3)
            .scaleEffect(imageScaled)
            .offset(x: imageOffset.width, y: imageOffset.height)
        
        //: Double tap Gesture
            .onTapGesture(count: 2){
                withAnimation(.spring()){
                    if imageScaled == 1 {
                        imageScaled = 5
                    }else{
                        restImage()
                    }
                }
            }
        
        //: Drag Gesture
        
            .gesture(DragGesture()
                .onChanged({ gesture in
                    imageOffset = gesture.translation
                })
                    .onEnded({ gesture in
                        withAnimation(.spring()){
                            if imageScaled <= 1 {
                            imageOffset = .zero
                            }
                        }
                    })
            )
        
        //: Magnification Gesture
            .gesture(MagnificationGesture()
                .onChanged({ value in
                    withAnimation(.spring()){
                        if imageScaled >= 1 && imageScaled <= 5 {
                            imageScaled = value
                        }else if imageScaled > 5 {
                            imageScaled = 5
                        }else if imageScaled < 1 {
                            imageScaled = 1
                        }
                    }
                })
                    .onEnded({ value in
                        withAnimation(.spring()){
                            if imageScaled > 5 {
                                imageScaled = 5
                            }else if imageScaled < 1 {
                                imageScaled = 1
                            }
                        }
                    })
            )
        //: drawer
            .overlay( alignment: .topTrailing) {
                drawer( index: $coverIndex)
                    .padding(.top, 15)
            }
        //: control view
            .overlay(alignment: .bottom) {
                controlView(scale: $imageScaled, offset: $imageOffset)
            }
        //: pannel view
            .overlay(alignment: .top) {
                panalView(scale: imageScaled, offset: imageOffset)
                    .padding()
                    .offset( y: -50)
            }
        
        
        
        
    }
}

#Preview {
    ContentView()
}
