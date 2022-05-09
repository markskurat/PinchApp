//
//  InfoPannelView.swift
//  Pinch
//
//  Created by Mark Skurat on 1/19/22.
//

import SwiftUI

struct InfoPannelView: View {
    var scale: CGFloat
    var offset: CGSize
    
    @State private var isInfoPannelVisable: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) {
                        isInfoPannelVisable.toggle()
                    }
                }
            
                Spacer()
            
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .frame(maxWidth: 420)
            .opacity(isInfoPannelVisable ? 1 : 0)
            
            Spacer()
        }
        
    }
}

struct InfoPannelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPannelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout((.sizeThatFits))
            .padding()
    }
}
