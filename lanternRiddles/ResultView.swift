//
//  ResultView.swift
//  lanternRiddles
//
//  Created by User11 on 2021/3/5.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var Score: Score
    @State private var judge : Bool = true
    var body: some View {
        if(judge){
            ZStack {
                Image("back")
                    .offset(x: 0, y: -15)
                VStack {
                    Text("🎊遊戲結束🎊")
                        .bold()
                        .font(.system(size: 40))
                    Text("本次遊戲得分為：" + "\(Score.score)" + "分")
                        .font(.system(size: 25))
                    Button(action: {
                        judge = false
                    }, label: {
                        Text("重新開始新遊戲")
                            .foregroundColor(.yellow)
                    })
                }
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        else{
            ContentView()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
