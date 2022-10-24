//
//  ContentView.swift
//  Shared
//
//  Created by ProdMac on 24.10.2022.
//

import SwiftUI

struct GridContainerView: View {
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
    ]
    let randomNumberArray = (0...299).map( {_ in Int.random(in: 1...3)} )
    
    @State private var counterArray = (0...299).map( {_ in 0} )
    
    var body: some View {
        
        VStack {
            Button("Add") {
                makeRaise(raise: 1)
            }
            .frame(width: 100, height: 50, alignment: .center)
            .foregroundColor(.black)
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0...299, id: \.self) { index in
                        let color = selectedColor(number: randomNumberArray[index])
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text(String(describing: String(counterArray[index])))
                                    .font(.caption2)
                                    .padding(.trailing, 4)
                            }
                        }
                        .background(color)
                        .frame(width: (UIScreen.main.bounds.width - 40) * 0.2, height: (UIScreen.main.bounds.width - 40) * 0.2, alignment: .center)
                        .onTapGesture {
                            let raise = getRaise(number: randomNumberArray[index])
                            makeRaise(raise: raise)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxHeight: .infinity)
            
        }
        
        
    }
    
    func selectedColor(number: Int) -> Color {
        switch number {
        case 1: return Color.red
        case 2: return Color.blue
        case 3: return Color.green
        default: return Color.red
        }
    }
    
    func getRaise(number: Int) -> Int {
        switch number {
        case 1: return 3
        case 2: return 2
        case 3: return 1
        default: return 1
        }
    }
    
    func makeRaise(raise: Int) {
        for index in 0...(counterArray.count-1) {
            counterArray[index] = counterArray[index] + raise
        }
    }
}

struct GridContainerView_Previews: PreviewProvider {
    static var previews: some View {
        GridContainerView()
    }
}
