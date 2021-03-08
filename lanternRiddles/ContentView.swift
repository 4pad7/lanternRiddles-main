//
//  ContentView.swift
//  lanternRiddles
//
//  Created by User11 on 2021/3/3.
//

import SwiftUI

class Score: ObservableObject {
    @Published var score = 0
}

struct ContentView: View {
    @StateObject var score = Score()
    @State private var judgeFirst : Bool = true
    var body: some View {
        if(judgeFirst){
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                Image("backk")
                    .resizable()
                VStack {
                    Text("元宵節猜燈謎🏮")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Button(action: {
                        judgeFirst = false
                    }, label: {
                        Text("開始遊戲")
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white))
                    })
                }
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        else{
            GameView().environmentObject(score)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
