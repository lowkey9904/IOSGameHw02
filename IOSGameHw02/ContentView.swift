//
//  ContentView.swift
//  IOSGameHw02
//
//  Created by Joker on 2021/3/20.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var showWebPage = false
    @State private var firstView = true
    @State private var wcmoveDistance: CGFloat = 200
    @State private var wcOpacity: Double = 0
    @State private var wcPlayerName = hPlayer.name
    @State private var playMusic = true
    @State var looper: AVPlayerLooper?
    let musicPlayer = AVQueuePlayer()
    let userDefault = UserDefaults()
    var body: some View {
        NavigationView{
        VStack{
            HStack{
                Text("Ninety")
                    .font(.custom("Didot-Bold", size: 55))
                    .foregroundColor(.white)
                    .padding()
                Text("-nine")
                    .font(.custom("Didot-Bold", size: 55))
                    .foregroundColor(.white)
                    .offset(y:50)
                    .padding()
            }.padding()
            Text("Welcome Back, " + self.wcPlayerName + " !")
                .font(.custom("Didot-Bold", size: 30))
                .foregroundColor(.white)
                .offset(y:self.wcmoveDistance)
                .opacity(self.wcOpacity)
                .animation(.easeOut)
            Spacer()
            NavigationLink(destination: GameView()){
                Text("Start!")
                    .font(.custom("Didot-Bold", size: 35))
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .padding(10)
                    .border(Color.white, width: 1)
            }
            .padding()
            Button(action: {self.showWebPage = true}){
                Text("Rules")
                    .font(.custom("Didot-Bold", size: 35))
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .padding(10)
                    .border(Color.white, width: 1)
            }
            .sheet(isPresented: $showWebPage){
                SafariView(url: URL( string: "https://zh.wikipedia.org/wiki/%E4%B9%9D%E4%B9%9D_(%E6%92%B2%E5%85%8B%E7%89%8C)")!)
            }
            NavigationLink(destination: SettingView()){
                Text("Setting")
                    .font(.custom("Didot-Bold", size: 35))
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .padding(10)
                    .border(Color.white, width: 1)
            }
            .padding()
            
        }.onAppear{
//            Test UserDefault
//            let domain = Bundle.main.bundleIdentifier!
//            UserDefaults.standard.removePersistentDomain(forName: domain)
            if userDefault.value(forKey: "isNotFirstOpenApp") == nil {
                print("FirstOpenApp")
                userDefault.setValue(true, forKey: "isNotFirstOpenApp")
                userDefault.setValue(4, forKey: "playerNum")
                userDefault.setValue("Player", forKey: "playerName")
                userDefault.setValue(7, forKey: "playerTime")
                userDefault.setValue(20, forKey: "roundCoin")
                userDefault.setValue(1000, forKey: "userPlayerCoin")
                userDefault.setValue("cardBG1", forKey: "playerCardBG")
            }
            playerNum = userDefault.value(forKey: "playerNum") as! Int
            playerTime = userDefault.value(forKey: "playerTime") as! Int
            userRoundCoin = userDefault.value(forKey: "roundCoin") as! Int
            userPlayerCoin = userDefault.value(forKey: "userPlayerCoin") as! Int
            playerCardBG = userDefault.value(forKey: "playerCardBG") as! String
            self.wcPlayerName = userDefault.value(forKey: "playerName") as! String
            hPlayer.name = userDefault.value(forKey: "playerName") as! String
            if self.firstView == true {
                self.firstView = false
                self.wcOpacity += 1
                self.wcmoveDistance -= 100
            }
            let fileUrl = Bundle.main.url(forResource: "music", withExtension: "mp4")!
            let item = AVPlayerItem(url: fileUrl)
            if  playMusic && musicPlayer.timeControlStatus != .playing {
                //Play Background Music
                self.looper = AVPlayerLooper(player: musicPlayer, templateItem: item)
                musicPlayer.play()
                musicPlayer.volume = 0.8
            }
        }
        .background(Image("mainbg").resizable()
        .frame(width: 800, height: 1200, alignment: .center))
        //.navigationBa
        .navigationBarItems(
            trailing: Button(action:{
            if self.playMusic {
                self.musicPlayer.pause()
                self.playMusic = false
            } else if musicPlayer.timeControlStatus != .playing {
                self.musicPlayer.play()
                self.playMusic = true
            }
        }){
            Text("Music")
                .font(.custom("Didot-Bold", size: 20))
                .foregroundColor(.white)
            if self.playMusic {
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
            } else {
                Image(systemName: "play.slash.fill")
                    .foregroundColor(.white)
            }
        })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


