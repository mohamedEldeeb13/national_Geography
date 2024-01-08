//
//  panalView.swift
//  national_Geography
//
//  Created by Mohamed Abd Elhakam on 30/12/2023.
//

import SwiftUI

struct panalView: View {
    //: proparites
    @State var isPannelDisplay : Bool = false
    var scale : CGFloat
    var offset : CGSize
    //:body
    var body: some View {
        
        HStack
        {
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .onLongPressGesture(minimumDuration: 1) {
                    isPannelDisplay.toggle()
                }
            Spacer()
               
            
            HStack
            {
                
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                    .padding(.vertical, 4)
                Spacer()
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                    .padding(.vertical, 4)
                Spacer()
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                    .padding(.vertical, 4)
                Spacer()
                
            }//: Hstack
            .background(.ultraThinMaterial)
            .font(.footnote)
            .frame(maxWidth: 420, minHeight: 30, alignment: .center)
            .opacity(isPannelDisplay ? 1 : 0)
        }//: Hstack
    }
}

#Preview {
    panalView(scale: 1, offset: .zero)
}
