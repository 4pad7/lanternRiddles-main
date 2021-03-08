//
//  GameView.swift
//  lanternRiddles
//
//  Created by User11 on 2021/3/3.
//

import SwiftUI

var riddles = [
    Riddle(question: "世界上最厲害最蝦趴的星座是什麼座？", ans: "水瓶座", choice: ["摩羯座", "水瓶座", "處女座"]),
    Riddle(question: "海大資工最漂漂的女森是誰😍？", ans: "思沛淇", choice: ["思沛淇", "林惠婷", "謝宛蓉"]),
    Riddle(question: "海大資工系男排近期長胖最多的人是？", ans: "周柏維", choice: ["蔡慶辰", "黃祖麟", "周柏維"]),
    Riddle(question: "最受歡迎的男性英文名字是？", ans: "Peter", choice: ["Andy", "Peter", "ICF_Chase"]),
    Riddle(question: "iOS遊戲APP下午班，身高為161.9的男同學是？", ans: "黃祖麟", choice: ["黃祖麟", "周柏維", "任威竹"]),
    Riddle(question: "思沛淇的遊戲id為何？", ans: "薯條姐姐", choice: ["紅燒獅子丸", "蛤蜊雞湯", "薯條姐姐"]),
    Riddle(question: "哪種水果最好吃？", ans: "蘋果", choice: ["西瓜", "蘋果", "大香蕉"]),
    Riddle(question: "才華洋溢人美心善歌聲動人的女歌手是？", ans: "戴佩妮", choice: ["鄭沛彤", "戴佩妮", "薛容恩"]),
    Riddle(question: "林惠婷是哪個學姐最愛的學妹？", ans: "只有學長沒有學姐", choice: ["思沛淇", "巫怡萱", "只有學長沒有學姐"]),
    Riddle(question: "思沛淇小時候玩楓之谷所在的伺服器為？", ans: "藍寶", choice: ["藍寶", "菇菇寶貝", "雪吉拉"]),
    Riddle(question: "思沛淇第一支玩的楓之谷角色為何？", ans: "主教", choice: ["箭神", "主教", "夜使者"]),
    Riddle(question: "幫我接歌詞：『如果我是一朵花，❓❓❓❓❓❓❓』", ans: "安祺打我兩巴掌", choice: ["安祺打我兩巴掌", "傑米酷拉到脫肛", "放屁就要偷偷放"]),
    Riddle(question: "古語鈞的口頭禪？", ans: "以上皆是", choice: ["你很色", "小ＤＤ", "以上皆是"]),
    Riddle(question: "黃祖麟最擅長什麼？", ans: "被當", choice: ["排球打女網前排", "被當", "裝可愛"])
]

struct GameView: View {
    @State private var num : Int = 0
    @State private var selectedIndex = 0
    @State private var tmpSelected : Int = 0
    @State private var judge : Bool = false
    //let riddle = riddles.shuffled()
    @State private var riddle = riddles
    @EnvironmentObject var Score: Score
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            Image("backk")
                .resizable()
            VStack {
                Text("第" + String(num+1) + "題：")
                    .font(.system(size: 25))
                    .bold()
                Text(riddle[num].question)
                    .font(.system(size: 20))
                
                Picker(selection: $selectedIndex, label: Text("選擇答案"), content: {
                    Text(riddle[num].choice[0]).tag(0)
                    Text(riddle[num].choice[1]).tag(1)
                    Text(riddle[num].choice[2]).tag(2)
                })
                
                
                Text("你的答案：\(riddle[num].choice[selectedIndex])")
                HStack {
                    Button(action: {
                        tmpSelected = selectedIndex
                        num = num + 1
                        if riddle[num-1].choice[tmpSelected] == riddle[num-1].ans {
                            Score.score += 10
                        }
                        if num == 10 {
                            judge = true
                            return
                        }
                    }, label: {
                        Text(" 下一題 ")
                    })
                }
                
                if num == 0 {
                    Text("\n")
                    Text("目前得分：" + "\(Score.score)")
                }
                else {
                    if riddle[num-1].choice[tmpSelected] == riddle[num-1].ans {
                        Text("\n恭喜你答對了～～😄")
                        Text("目前得分：" + "\(Score.score)")
                    }
                    else {
                        Text("\n真可惜答錯囉～～🤢")
                        Text("目前得分：" + "\(Score.score)")
                    }
                }
            }
            if judge == true {
                ResultView().environmentObject(Score)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            riddle = riddles.shuffled()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
