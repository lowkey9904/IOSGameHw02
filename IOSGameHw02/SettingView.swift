//
//  SettingView.swift
//  IOSGameHw02
//
//  Created by Joker on 2021/3/20.
//

import SwiftUI

struct SettingView: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var player = [2,3,4]
    var roundCoin = [10, 20, 50, 70, 100]
    var time = [5, 7, 10, 15]
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @State private var selectedIndex = 0
    @State private var selectedIndex2 = 0
    @State private var selectedIndex3 = 0
    @State private var selectedIndex4 = 0
    @State private var playerName = ""
    var body: some View {
        VStack{
            HStack{
                Text("Your Name")
                    .font(.custom("Didot-Bold", size: 25))
                    .foregroundColor(.white)
                Spacer()
                TextField((userDefault.value(forKey: "playerName") as! String), text: $playerName)
                    .frame(height: 42)
                    .foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 1.5))
                    .padding()
            }
            .padding()
            HStack{
                Text("Com Players")
                    .font(.custom("Didot-Bold", size: 25))
                    .foregroundColor(.white)
                Spacer()
                Picker(selection: $selectedIndex, label: Text("")) {
                    ForEach(player.indices) { (index) in
                        Text(String(player[index] - 1))
                            .foregroundColor(.green)
                    }
                }.frame(width: 250, height: 35)
                //.padding(.leading)
                .background(Color.gray)
                .cornerRadius(10)
                .pickerStyle(SegmentedPickerStyle())
            }.padding()
            HStack{
                Text("Round Stack")
                    .font(.custom("Didot-Bold", size: 25))
                    .foregroundColor(.white)
                Spacer()
                Picker(selection: $selectedIndex2, label: Text("")) {
                    ForEach(roundCoin.indices) { (index) in
                        Text(String(roundCoin[index]))
                    }
                }.frame(width: 250, height: 35)
                .background(Color.gray)
                .cornerRadius(10)
            }.padding()
            HStack{
                Text("Round Time")
                    .font(.custom("Didot-Bold", size: 25))
                    .foregroundColor(.white)
                Spacer()
                Picker(selection: $selectedIndex3, label: Text("")) {
                    ForEach(time.indices) { (index) in
                        Text(String(time[index]))
                    }
                }.frame(width: 250, height: 35)
                .background(Color.gray)
                .cornerRadius(10)
            }.padding()
            HStack{
                Text("Card Theme")
                    .font(.custom("Didot-Bold", size: 25))
                    .foregroundColor(.white)
                Spacer()
                Picker(selection: $selectedIndex4, label: Text("")) {
                    ForEach(allPokerBack.indices) { (index) in
                        Text(String(index + 1))
                    }
                }.frame(width:100, height:35)
                .background(Color.gray)
                .cornerRadius(10)
                Image(allPokerBack[selectedIndex4])
                    .resizable()
                    .frame(width:120, height:173)
                Spacer()
            }.padding()
            Spacer()
            Button(action:{
                if self.playerName != "" {
                    hPlayer.setPlayerName(PlayerName: self.playerName)
                    userDefault.setValue(playerName, forKey: "playerName")
                }
                playerNum = player[self.selectedIndex]
                userRoundCoin = roundCoin[self.selectedIndex2]
                playerTime = time[self.selectedIndex3]
                playerCardBG = allPokerBack[self.selectedIndex4]
                hPlayer.setPlayerCoin(PlayerCoin: userPlayerCoin)
                userDefault.setValue(playerNum, forKey: "playerNum")
                userDefault.setValue(playerTime, forKey: "playerTime")
                userDefault.setValue(userRoundCoin, forKey: "roundCoin")
                userDefault.setValue(userPlayerCoin, forKey: "userPlayerCoin")
                userDefault.setValue(playerCardBG, forKey: "playerCardBG")
                allPlayer = [hPlayer, cPlayer[0], cPlayer[1], cPlayer[2]]
                allPoker1 = [allPoker[0], allPoker[1], allPoker[2], allPoker[3], allPoker[4]]
                allPoker2 = [allPoker[5], allPoker[6], allPoker[7], allPoker[8], allPoker[9]]
                allPoker3 = [allPoker[10], allPoker[11], allPoker[12], allPoker[13], allPoker[14]]
                allPoker4 = [allPoker[15], allPoker[16], allPoker[17], allPoker[18], allPoker[19]]
                if playerNum == 2 {
                    whichPlayer = [allPoker1, allPoker2]
                    //self.nextCardIndex = 10
                } else if playerNum == 3 {
                    whichPlayer = [allPoker1, allPoker2, allPoker3]
                    //self.nextCardIndex = 15
                } else {
                    whichPlayer = [allPoker1, allPoker2, allPoker3, allPoker4]
                    //self.nextCardIndex = 20
                }
                //whichPlayer.shuffle()
                whichPlayer[0].sort {
                    $0.num < $1.num
                }
                presentation.wrappedValue.dismiss()
            }){
                Text("Saved")
                    .font(.custom("Didot-Bold", size: 35))
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .padding(10)
                    .border(Color.white, width: 1)
            }

        }.navigationTitle("Setting")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentation.wrappedValue.dismiss()}) {
            HStack {
            Image(systemName: "chevron.left")
                .imageScale(.large)
            Text("Back")
                .font(.custom("Didot-Bold", size: 25))
            }.foregroundColor(.red)
        })
        .background(Image("mainbg")
        .resizable()
        .frame(width: 800, height: 1200, alignment: .center)
        .blur(radius: 10))
        .onAppear{
            self.selectedIndex = playerNum - 2
            self.selectedIndex2 = roundCoin.firstIndex(of: userRoundCoin)!
            self.selectedIndex3 = time.firstIndex(of: playerTime)!
            self.selectedIndex4 = allPokerBack.firstIndex(of: playerCardBG)!
        }
    }

}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

var isPlayMusic = true
