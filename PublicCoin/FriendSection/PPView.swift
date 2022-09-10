//
//  PPView.swift
//  PublicCoin
//
//  Created by Daichi Morihara on 2022/09/10.
//

import SwiftUI

struct PPView: View {
    @ObservedObject var vm: FriendViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
//                ForEach(vm.slices) { slice in
//                    PieChart(pieData: slice)
//                }
//
//                Circle()
//                    .fill(Color.theme.background)
//                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
//
//                VStack {
//                    Text("Total")
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.theme.secondary)
//                    Text(vm.totalValue.asValue())
//                        .fontWeight(.semibold)
//                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        }
    }
}

//struct PPView_Previews: PreviewProvider {
//    static var previews: some View {
//        PPView()
//    }
//}
