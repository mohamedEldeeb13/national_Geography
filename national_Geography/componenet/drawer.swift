//
//  drawer.swift
//  national_Geography
//
//  Created by Mohamed Abd Elhakam on 30/12/2023.
//

import SwiftUI

struct drawer: View {
    //: proparities
    var covers : [coverModel] = cover
    @State var isDrawerOpen : Bool = false
    @Binding var index : Int
    
    var body: some View {
        HStack
        {
            Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.secondary)
                .frame( height: 40, alignment: .center)
                .padding(8)
                .onTapGesture {
                    isDrawerOpen.toggle()
                }
            Spacer()
            
            ForEach(covers) { item in
                Image(item.Thumbnails)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120, alignment: .center)
                    .padding(.horizontal, 2)
                    .onTapGesture {
                        index = item.id - 1
                    }
            }
            
        }//: Hstack
        .frame(width: 260)
        .background(.thinMaterial)
        .cornerRadius(8)
        .offset(x: isDrawerOpen ? 0 : 225)
    }
}

#Preview {
    drawer(index: .constant(0))
        .previewLayout(.sizeThatFits)
        
}
