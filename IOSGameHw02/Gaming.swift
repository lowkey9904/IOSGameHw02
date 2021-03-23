//
//  Gaming.swift
//  IOSGameHw02
//
//  Created by Joker on 2021/3/20.
//

import Foundation

class game: ObservableObject {
    @Published var point: Int = 0
    @Published var nowCardImgStr: String = ""
    @Published var nextCardIndex: Int = 0
    @Published var nowPlayer: Int = 0
    @Published var gameOver = false
    @Published var reverseOrder = false
    var timer: Timer?
    //var gameTimer = GameTimer()
    func setPointZero() -> Void {
        self.point = 0
    }
    func setPoint(nowCard: poker, minus: Bool) -> Void {
        if nowCard.imagestr == "ace_of_spades" {
            self.setPointZero()
        } else if nowCard.num == 10 {
            if minus {
                self.point -= 10
            } else {
                self.point += 10
            }
        } else if nowCard.num == 12 {
            if minus {
                self.point -= 20
            } else {
                self.point += 20
            }
        } else if nowCard.num == 13 {
            self.point = 99
        } else if nowCard.num == 5 {
            if playerNum > 2 {
                self.reverseOrder = !self.reverseOrder
            }
        } else if nowCard.num == 4 && nowPlayer != 0 {
            let randomPlayer = (self.nowPlayer + Int.random(in: 1..<playerNum)) % playerNum
            print(allPlayer[nowPlayer].name + "指定：" + allPlayer[randomPlayer].name)
            self.setnextPlayer(nextPlayer: randomPlayer)
        } else if nowCard.num != 11 {
            if nowCard.num != 4 {
                self.point += nowCard.num
            }
        }
        
        if self.point < 0 {
            self.setPointZero()
        }
        if self.point > 99 {
            self.gameOver = true
            self.point -= nowCard.num
        }
    }
    func setNowCard(nextCard: String) -> Void {
        print(allPlayer[nowPlayer].name + "出了 " + nextCard)
        self.nowCardImgStr = nextCard
    }
    func udnextCardIndex() -> Void {
        self.nextCardIndex = (self.nextCardIndex + 1) % 52
    }
    func udnextPlayer() -> Void {
        if reverseOrder && !gameOver {
            self.nowPlayer = (self.nowPlayer + playerNum - 1 ) % playerNum
        } else if !gameOver{
            self.nowPlayer = (self.nowPlayer + 1 ) % playerNum
        }
        let timeRandom = Int.random(in: 2..<playerTime)
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(timeRandom), repeats: false, block: { [self] (timer) in
            self.comPlayerChoosePoker()
        })
    }
    func setnextPlayer(nextPlayer: Int) -> Void {
        if !gameOver {
            self.nowPlayer = nextPlayer
        }
        let timeRandom = Int.random(in: 2..<playerTime)
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(timeRandom), repeats: false, block: { (timer) in
            self.comPlayerChoosePoker()
        })
        
    }
    func playerChoosePoker(cardIndex: Int, isFour: Bool = false, setNextPlayer: Int = -1) -> Void {
        if !isFour || setNextPlayer == -1 {
            self.setPoint(nowCard: whichPlayer[0][cardIndex], minus: false)
        }
        self.setNowCard(nextCard: whichPlayer[0][cardIndex].imagestr)
        whichPlayer[0][cardIndex] = allPoker[self.nextCardIndex]
        self.udnextCardIndex()
        if !isFour || setNextPlayer == -1 {
            self.udnextPlayer()
        } else {
            self.setnextPlayer(nextPlayer: setNextPlayer)
        }
    }
    
    func comPlayerChoosePoker() -> Void {
        if self.nowPlayer <= whichPlayer.count - 1 && self.nowPlayer != 0 && intoGameView && !gameOver{
            let whichCard = Int.random(in: whichPlayer[nowPlayer].indices)
            let tempPlayer = nowPlayer
            let tempCard = whichPlayer[tempPlayer][whichCard]
            self.setNowCard(nextCard: whichPlayer[tempPlayer][whichCard].imagestr)
            self.setPoint(nowCard: whichPlayer[tempPlayer][whichCard], minus: true)
            whichPlayer[tempPlayer][whichCard] = allPoker[self.nextCardIndex]
            self.udnextCardIndex()
            if tempCard.num != 4 {
                self.udnextPlayer()
            }
        }
    }
    
    func initGame() -> Void {
        allPoker.shuffle()
        cPlayer.shuffle()
        intoGameView = false
        self.nowCardImgStr = playerCardBG
        self.gameOver = false
        allPlayer = [hPlayer, cPlayer[0], cPlayer[1], cPlayer[2]]
        self.setnextPlayer(nextPlayer: Int.random(in: 0..<playerNum))
        allPoker1 = [allPoker[0], allPoker[1], allPoker[2], allPoker[3], allPoker[4]]
        allPoker2 = [allPoker[5], allPoker[6], allPoker[7], allPoker[8], allPoker[9]]
        allPoker3 = [allPoker[10], allPoker[11], allPoker[12], allPoker[13], allPoker[14]]
        allPoker4 = [allPoker[15], allPoker[16], allPoker[17], allPoker[18], allPoker[19]]
        if playerNum == 2 {
            whichPlayer = [allPoker1, allPoker2]
            self.nextCardIndex = 10
        } else if playerNum == 3 {
            whichPlayer = [allPoker1, allPoker2, allPoker3]
            self.nextCardIndex = 15
        } else {
            whichPlayer = [allPoker1, allPoker2, allPoker3, allPoker4]
            self.nextCardIndex = 20
        }
        //whichPlayer.shuffle()
        whichPlayer[0].sort {
            $0.num < $1.num
        }
        //print((whichPlayer[0].indices))
        self.setPointZero()
        print(allPlayer[self.nowPlayer].name)
        print("shuffle\n")
    }
}

var intoGameView = false


