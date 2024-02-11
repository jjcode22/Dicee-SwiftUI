//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by JJ on 11/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDice = 1
    @State var rightDice = 1
    @State var message = ""
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                Text(message).font(.system(size: 40)).fontWeight(.bold).foregroundStyle(.white
                )
                Spacer()
                HStack {
                    Dice(diceNum: leftDice)
                    Dice(diceNum: rightDice)
                }.padding()
                Spacer()
                Button("Roll") {
                    self.leftDice = Int.random(in: 1...6)
                    self.rightDice = Int.random(in: 1...6)
                    if(leftDice > rightDice){
                        message = "Player 1 wins"
                    }else if (rightDice > leftDice){
                        message = "Player 2 wins"
                    }else{
                        message = "Draw"
                    }
                }.font(.system(size: 40)).fontWeight(.bold).foregroundStyle(.white
                ).padding(.horizontal).background(.red).clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
            }
        }
    }
}

struct Dice: View {
    let diceNum: Int
    var body: some View {
        Image("dice\(diceNum)").resizable().aspectRatio(1,contentMode: .fit)
            .padding()
    }
}

#Preview {
    ContentView()
}
