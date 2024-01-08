//
//  controlView.swift
//  national_Geography
//
//  Created by Mohamed Abd Elhakam on 30/12/2023.
//

import SwiftUI

struct controlView: View {
    //: proparties
    @Binding var scale : CGFloat
    @Binding var offset : CGSize
    
    
    //:body
    var body: some View {
       HStack
        {
            Button(action: {
                if scale > 1 {
                    scale = scale - 1
                }
                
            }
            , label: {
              Image(systemName: "minus.magnifyingglass")
            })
            
            Button(action: {
                
                scale = 1
                offset = .zero
                
            }
            , label: {
                Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
            })
            
            Button(action: {
                
                if scale < 5 {
                    scale = scale + 1
                }
                
            }
            , label: {
                Image(systemName: "plus.magnifyingglass")
            })
            
        }//" Hstack
        .padding(.vertical, 15)
        .padding(.horizontal, 10)
        .foregroundStyle(.white)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .font(.largeTitle)
    }
}

#Preview {
    controlView(scale: .constant(1), offset: .constant(.zero))
}
