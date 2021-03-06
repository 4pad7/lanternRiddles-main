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
                    Text("πιζ²η΅ζπ")
                        .bold()
                        .font(.system(size: 40))
                    Text("ζ¬ζ¬‘ιζ²εΎεηΊοΌ" + "\(Score.score)" + "ε")
                        .font(.system(size: 25))
                    Button(action: {
                        judge = false
                    }, label: {
                        Text("ιζ°ιε§ζ°ιζ²")
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
