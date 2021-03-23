//
//  Player.swift
//  IOSGameHw02
//
//  Created by Joker on 2021/3/20.
//

import Foundation

struct complayer {
    var name: String
    var coin = 100
    mutating func setPlayerName(PlayerName: String) -> Void {
        if PlayerName == "" {
            //print(PlayerName)
            self.name = "Player"
        }
        else {
            //print(PlayerName)
            self.name = PlayerName
        }
    }
    
    mutating func setPlayerCoin(PlayerCoin: Int) -> Void {
        self.coin = PlayerCoin
    }
}

var hPlayer = complayer(name: "Player")

var cPlayer = [
    complayer(name: "Kevin"),
    complayer(name: "Sean"),
    complayer(name: "Law"),
    complayer(name: "Vicky"),
    complayer(name: "Rose"),
    complayer(name: "Amy")
]

var allPlayer = [hPlayer, cPlayer[0], cPlayer[1], cPlayer[2]]

let userDefault = UserDefaults()
var playerNum = 4
var userRoundCoin = 20
var userPlayerCoin = 1000
var playerCardBG = "cardBG1"
var playerTime = 7

