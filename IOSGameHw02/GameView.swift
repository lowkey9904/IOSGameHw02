//
//  GameView.swift
//  IOSGameHw02
//
//  Created by Joker on 2021/3/20.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @StateObject var nnGame = game()
    @State private var cardY = [0, 0, 0, 0, 0, 0]
    @State private var showExitAlert = false
    @State private var showResult = false
    @State private var showChooseWho = false
    @State private var fourIndex = 0
    var body: some View {
        VStack{
            if playerNum == 2 {
                Text(allPlayer[1].name)
                    .font(.custom("Didot-Bold", size: 20))
                    .foregroundColor(.white)
                let columns = [
                    GridItem(),
                    GridItem(),
                    GridItem(),
                    GridItem(),
                    GridItem(),
                ]
                LazyVGrid(columns: columns) {
                    ForEach(whichPlayer[1].indices) { (index) in
                        VStack {
                            Image(playerCardBG)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 80)
                        }
                    }
                }.padding()
                Spacer()
                VStack{
                    Text(String(nnGame.point))
                        .font(.custom("Didot-Bold", size: 100))
                        .foregroundColor(.white)
                    HStack{
                        Text("Turn to : " + allPlayer[nnGame.nowPlayer].name)
                            .font(.custom("Didot-Bold", size: 25))
                            .foregroundColor(.white)
                        if nnGame.reverseOrder {
                            Image(systemName: "arrow.counterclockwise.circle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                        } else {
                            Image(systemName: "arrow.clockwise.circle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                        }
                    }
                    Image(nnGame.nowCardImgStr)
                        .resizable()
                        .frame(width:100, height: 144)
                        .scaledToFill()
                }
                Spacer()
                let columns2 = [
                    GridItem(),
                    GridItem(),
                    GridItem(),
                    GridItem(),
                    GridItem(),
                ]
                LazyVGrid(columns: columns2) {
                    ForEach(whichPlayer[0].indices) { (index) in
                        VStack {
                            if whichPlayer[0][index].num == 10 || whichPlayer[0][index].num == 12 {
                                Button(action:{
                                    if nnGame.nowPlayer == 0 {
                                    if self.cardY[index] != 0 {
                                        self.cardY[index] = 0
                                    } else {
                                        self.cardY[index] -= 20
                                    }
                                }}){
                                Image(whichPlayer[0][index].imagestr)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 80)
                                    .offset(y:CGFloat(self.cardY[index]))
                                    .animation(.easeIn)
                                }
                                HStack{
                                    Button(action:{
                                        if nnGame.nowPlayer == 0 {
                                        if self.cardY[index] != 0 {
                                            nnGame.playerChoosePoker(cardIndex: index)
                                            self.cardY[index] = 0
                                        }
                                    }}){
                                        Image(systemName: "plus.circle")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                    }.padding([.top, .bottom])
                                    Button(action:{
                                        if self.cardY[index] != 0 {
                                            nnGame.playerChoosePoker(cardIndex: index)
                                            self.cardY[index] = 0
                                        }
                                    }){
                                        Image(systemName: "minus.circle")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                    }.padding([.top, .bottom])
                                }
                            } else {
                                Button(action:{
                                    if nnGame.nowPlayer == 0 {
                                    if self.cardY[index] != 0 {
                                        nnGame.playerChoosePoker(cardIndex: index)
                                        self.cardY[index] = 0
                                    }else{
                                        self.cardY[index] -= 20
                                    }
                                }}){
                                Image(whichPlayer[0][index].imagestr)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 80)
                                    .offset(y:CGFloat(self.cardY[index]))
                                    .animation(.easeIn)
                                }
                                Button(action:{self.cardY[index] = 0}) {
                                    Image(systemName: "chevron.down.circle.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.white)
                                }.padding()
                            }
                        }
                    }
                }.padding(.bottom)
                .offset(y: 50)
            }
            else if playerNum == 3 {
                Text(allPlayer[2].name)
                    .font(.custom("Didot-Bold", size: 20))
                    .foregroundColor(.white)
                let columns = [
                    GridItem(),
                    GridItem(),
                    GridItem(),
                    GridItem(),
                    GridItem(),
                ]
                LazyVGrid(columns: columns) {
                    ForEach(whichPlayer[2].indices) { (index) in
                        VStack {
                            Image(playerCardBG)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 80)
                        }
                    }
                }.padding()
                Spacer()
                HStack{
                    VStack{
                        Text(allPlayer[1].name)
                            .font(.custom("Didot-Bold", size: 20))
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        ForEach(whichPlayer[1].indices) { (index) in
                            HStack {
                                Image(playerCardBG)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 50)
                                    .rotationEffect(.degrees(90))
                                //Spacer()
                            }
                        }
                    }.padding()
                    .offset(x:-55)
                    //Spacer()
                    VStack{
                        Text(String(nnGame.point))
                            .font(.custom("Didot-Bold", size: 100))
                            .foregroundColor(.white)
                        HStack{
                            Text("Turn to : " + allPlayer[nnGame.nowPlayer].name)
                                .font(.custom("Didot-Bold", size: 25))
                                .foregroundColor(.white)
                            if nnGame.reverseOrder {
                                Image(systemName: "arrow.counterclockwise.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                            } else {
                                Image(systemName: "arrow.clockwise.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                            }
                        }
                        Image(nnGame.nowCardImgStr)
                            .resizable()
                            .frame(width:100, height: 144)
                            .scaledToFill()
                    }
                    Spacer()
                }.padding()
                Spacer()
                let columns2 = [
                    GridItem(),
                    GridItem(),
                    GridItem(),
                    GridItem(),
                    GridItem(),
                ]
                Text(hPlayer.name)
                    .font(.custom("Didot-Bold", size: 30))
                    .foregroundColor(.white)
                    .padding()
                LazyVGrid(columns: columns2) {
                    ForEach(whichPlayer[0].indices) { (index) in
                        VStack {
                            if whichPlayer[0][index].num == 10 || whichPlayer[0][index].num == 12 {
                                Button(action:{
                                    if nnGame.nowPlayer == 0 {
                                    if self.cardY[index] != 0 {
                                        self.cardY[index] = 0
                                    } else {
                                        self.cardY[index] -= 20
                                    }
                                }}){
                                Image(whichPlayer[0][index].imagestr)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 80)
                                    .offset(y:CGFloat(self.cardY[index]))
                                    .animation(.easeIn)
                                }
                                HStack{
                                    Button(action:{
                                        if nnGame.nowPlayer == 0 {
                                        if self.cardY[index] != 0 {
                                            nnGame.playerChoosePoker(cardIndex: index)
                                            self.cardY[index] = 0
                                        }
                                    }}){
                                        Image(systemName: "plus.circle")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                    }.padding([.top, .bottom])
                                    Button(action:{
                                        if nnGame.nowPlayer == 0 {
                                        if self.cardY[index] != 0 {
                                            nnGame.playerChoosePoker(cardIndex: index)
                                            self.cardY[index] = 0
                                        }
                                    }}){
                                        Image(systemName: "minus.circle")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                    }.padding([.top, .bottom])
                                }
                            } else {
                                Button(action:{
                                    if nnGame.nowPlayer == 0 {
                                    if self.cardY[index] != 0 {
                                        if whichPlayer[0][index].num == 4 {
                                            self.showChooseWho = true
                                            self.fourIndex = index
                                        } else {
                                            nnGame.playerChoosePoker(cardIndex: index)
                                            self.cardY[index] = 0
                                        }
                                    }else{
                                        self.cardY[index] -= 20
                                    }
                                }}){
                                Image(whichPlayer[0][index].imagestr)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 80)
                                    .offset(y:CGFloat(self.cardY[index]))
                                    .animation(.easeIn)
                                }
                                Button(action:{self.cardY[index] = 0}) {
                                    Image(systemName: "chevron.down.circle.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.white)
                                }.padding()
                            }
                        }.actionSheet(isPresented: $showChooseWho) {
                            ActionSheet(title: Text("Who you what to choose?"), buttons: [
                                .default(Text(allPlayer[1].name + " (Left)")) {
                                    nnGame.playerChoosePoker(cardIndex: fourIndex, isFour: true, setNextPlayer: 1)
                                    self.cardY[fourIndex] = 0
                                },
                                .default(Text(allPlayer[2].name + " (Up)")) {
                                    nnGame.playerChoosePoker(cardIndex: fourIndex, isFour: true, setNextPlayer: 2)
                                    self.cardY[fourIndex] = 0
                                },
                                .cancel()
                            ])
                        }
                    }
                }.padding(.bottom)
                //Spacer()
            }
            else {  //4Players
                Text(allPlayer[2].name)
                    .font(.custom("Didot-Bold", size: 20))
                    .foregroundColor(.white)
                let columns = [
                    GridItem(),
                    GridItem(),
                    GridItem(),
                    GridItem(),
                    GridItem(),
                ]
                LazyVGrid(columns: columns) {
                    ForEach(whichPlayer[2].indices) { (index) in
                        VStack {
                            Image(playerCardBG)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 80)
                        }
                    }
                }.padding()
                Spacer()
                HStack{
                    VStack{
                        Text(allPlayer[1].name)
                            .font(.custom("Didot-Bold", size: 20))
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        ForEach(whichPlayer[1].indices) { (index) in
                            HStack {
                                Image(playerCardBG)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 50)
                                    .rotationEffect(.degrees(90))
                                Spacer()
                            }
                        }
                    }.padding()
                    .offset(x:-55)
                    Spacer()
                    VStack{
                        Text(String(nnGame.point))
                            .font(.custom("Didot-Bold", size: 100))
                            .foregroundColor(.white)
                        Text("Turn to : ")
                            .font(.custom("Didot-Bold", size: 25))
                            .foregroundColor(.white)
                        HStack{
                            Text(allPlayer[nnGame.nowPlayer].name)
                                .font(.custom("Didot-Bold", size: 25))
                                .foregroundColor(.white)
                            if nnGame.reverseOrder {
                                Image(systemName: "arrow.counterclockwise.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                            } else {
                                Image(systemName: "arrow.clockwise.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                            }
                        }
                        Image(nnGame.nowCardImgStr)
                            .resizable()
                            .frame(width:100, height: 144)
                            .scaledToFill()
                    }
                    Spacer()
                    VStack{
                        Text(allPlayer[3].name)
                            .font(.custom("Didot-Bold", size: 20))
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        ForEach(whichPlayer[3].indices) { (index) in
                            HStack {
                                Image(playerCardBG)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 50)
                                    .rotationEffect(.degrees(270))
                                Spacer()
                            }
                        }
                    }.padding()
                    .offset(x:63)
                }.padding()
                Spacer()
                let columns2 = [
                    GridItem(),
                    GridItem(),
                    GridItem(),
                    GridItem(),
                    GridItem(),
                ]
                Text(hPlayer.name)
                    .font(.custom("Didot-Bold", size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .offset(y: -15)
                LazyVGrid(columns: columns2) {
                    ForEach(whichPlayer[0].indices) { (index) in
                        VStack {
                            if whichPlayer[0][index].num == 10 || whichPlayer[0][index].num == 12 {
                                Button(action:{
                                    if nnGame.nowPlayer == 0 {
                                        if self.cardY[index] != 0 {
                                            self.cardY[index] = 0
                                        } else {
                                            self.cardY[index] -= 20
                                        }
                                    }
                                }){
                                Image(whichPlayer[0][index].imagestr)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 80)
                                    .offset(y:CGFloat(self.cardY[index]))
                                    .animation(.easeIn)
                                }
                                HStack{
                                    Button(action:{
                                        if nnGame.nowPlayer == 0 {
                                        if self.cardY[index] != 0 {
                                            nnGame.playerChoosePoker(cardIndex: index)
                                            self.cardY[index] = 0
                                        }}
                                    }){
                                        Image(systemName: "plus.circle")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                    }.padding([.top, .bottom])
                                    Button(action:{
                                        if nnGame.nowPlayer == 0 {
                                        if self.cardY[index] != 0 {
                                            nnGame.playerChoosePoker(cardIndex: index)
                                            self.cardY[index] = 0                                         }
                                    }}){
                                        Image(systemName: "minus.circle")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                    }.padding([.top, .bottom])
                                }
                            } else {
                                Button(action:{
                                    if nnGame.nowPlayer == 0 {
                                    if self.cardY[index] != 0 {
                                        if whichPlayer[0][index].num == 4 {
                                            self.showChooseWho = true
                                            self.fourIndex = index
                                        } else {
                                            nnGame.playerChoosePoker(cardIndex: index)
                                            self.cardY[index] = 0
                                            //self.showGameOver = nnGame.gameOver
                                        }
                                    }else{
                                        self.cardY[index] -= 20
                                    }
                                }}){
                                Image(whichPlayer[0][index].imagestr)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 80)
                                    .offset(y:CGFloat(self.cardY[index]))
                                    .animation(.easeIn)
                                }
                                Button(action:{self.cardY[index] = 0}) {
                                    Image(systemName: "chevron.down.circle.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.white)
                                }.padding()
                            }
                        }.actionSheet(isPresented: $showChooseWho) {
                            ActionSheet(title: Text("Who you what to choose?"), buttons: [
                                .default(Text(allPlayer[1].name + " (Left)")) {
                                    nnGame.playerChoosePoker(cardIndex: fourIndex, isFour: true, setNextPlayer: 1)
                                    self.cardY[fourIndex] = 0
                                },
                                .default(Text(allPlayer[2].name + " (Up)")) {
                                    nnGame.playerChoosePoker(cardIndex: fourIndex, isFour: true, setNextPlayer: 2)
                                    self.cardY[fourIndex] = 0
                                    //self.showGameOver = nnGame.gameOver
                                },
                                .default(Text(allPlayer[3].name + " (Right)")) {
                                    nnGame.playerChoosePoker(cardIndex: fourIndex, isFour: true, setNextPlayer: 3)
                                    self.cardY[fourIndex] = 0
                                    //self.showGameOver = nnGame.gameOver
                                },
                                .cancel()
                            ])
                        }
                    }
                }.padding(.bottom)
                //Spacer()
            }
        }.onAppear{
            nnGame.initGame()
            intoGameView = true
            if nnGame.nowPlayer != 0 {
                let timeRandom = Int.random(in: 2..<playerTime)
                nnGame.timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(timeRandom), repeats: false, block: { [self] (timer) in
                    nnGame.comPlayerChoosePoker()
                })
            }
        }
        .padding()
        .background(Image("mainbg").resizable()
        .frame(width: 800, height: 1200, alignment: .center)
        .blur(radius: 10))
        .alert(isPresented: $nnGame.gameOver) { () -> Alert in
            return Alert(title: Text(allPlayer[nnGame.nowPlayer].name + " Lose !"), primaryButton: .default(Text("Restart!"), action: {
                if nnGame.nowPlayer != 0 {
                    userPlayerCoin += userRoundCoin
                } else {
                    userPlayerCoin -= userRoundCoin
                }
            userDefault.setValue(userPlayerCoin, forKey: "userPlayerCoin")
            nnGame.initGame()
            self.cardY = [0, 0, 0, 0, 0, 0]
            intoGameView = true
                if nnGame.nowPlayer != 0 {
                    let timeRandom = Int.random(in: 2..<playerTime)
                    nnGame.timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(timeRandom), repeats: false, block: { [self] (timer) in
                        nnGame.comPlayerChoosePoker()
                    })
            }
         }), secondaryButton: .default(Text("Exit"), action: {
            if nnGame.nowPlayer != 0 {
                userPlayerCoin += userRoundCoin
            } else {
                userPlayerCoin -= userRoundCoin
            }
            userDefault.setValue(userPlayerCoin, forKey: "userPlayerCoin")
            presentation.wrappedValue.dismiss()
         }))}
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.showExitAlert = true
            }) {
            Text("Exit")
                .font(.custom("Didot-Bold", size: 25))
                .padding(5)
                .border(Color.red, width: 1)
                .foregroundColor(.red)
            }.alert(isPresented: $showExitAlert) { () -> Alert in
                return Alert(title: Text("Are you sure want to exit now?"), primaryButton: .default(Text("Yes"), action: {
                    presentation.wrappedValue.dismiss()
                }), secondaryButton: .default(Text("No")))}, trailing:
            Text(hPlayer.name + "'s coin: " + String(userDefault.value(forKey: "userPlayerCoin") as! Int))
                    .font(.custom("Didot-Bold", size: 20))
                    .foregroundColor(.white)
        )
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

