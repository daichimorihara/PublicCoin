//
//  Check.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/08/31.
//

import SwiftUI

struct Check: View {
    var body: some View {
        Image("biden")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3).foregroundColor(.theme.secondary))
            
            
        
    }
}

struct Check_Previews: PreviewProvider {
    static var previews: some View {
        Check()
    }
}
