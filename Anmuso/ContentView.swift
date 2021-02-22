//
//  ContentView.swift
//  Anmuso
//
//  Created by KAMIKU on 7/12/20.
//  Copyright © 2020 Anmuso. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView : View {
    @State var showDetail = false
    
    var body : some View {
        VStack(spacing: 50){
            HStack {
                Text("更新")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 12.0)
                
                Spacer()
            }
            .frame(width: .infinity, height: 30)
            VStack {
                SheetCard(
                    data: [
                        "sid": 0,
                        "title": "测试",
                        "release": NSDate.now,
                        "like" : 10
                    ]
                )
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SheetCard : View {
    var data : Dictionary<String, Any>
    
    init(data: Dictionary<String, Any>) {
        self.data = data
    }
    
    var body: some View {
        HStack{
            Image("bg")
                .resizable()
                .frame(width: 120, height: 100)
                .aspectRatio(contentMode: .fit)
            VStack {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(data["title"] as! String)
                                .font(.title)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                            Text(timeFormater(time: data["release"] as! Date))
                                .fontWeight(.light)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                        }
                        Spacer()
                        ZStack {
                            Capsule()
                                .frame(width: 65.0, height: 25.0)
                            Text(String(data["like"] as! Int) + " 点赞")
                                .foregroundColor(Color.white)
                                
                        }
                        .offset(y: -15)
                    }
                }
                .padding(.trailing, 10.0)
                HStack {
                    HStack {
                        Text("Original Work")
                    }
                    Text("ED")
                }
            }
        }
        .frame(width: 400.0, height: 100.0)
        .background(Color(hue: 0.269, saturation: 0.0, brightness: 0.427))
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

func timeFormater(time: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "Y/M/d"
    return formatter.string(from: time)
}
