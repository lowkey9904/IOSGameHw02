//
//  UserSetting.swift
//  IOSGameHw02
//
//  Created by Joker on 2021/3/23.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    @Published var playerName: String {
        didSet {
            UserDefaults.standard.set(playerName, forKey: "playerName")
        }
    }
    @Published var playerNum: Int {
        didSet {
            UserDefaults.standard.set(playerNum, forKey: "playerNum")
        }
    }
    @Published var playerCoin: Int {
        didSet {
            UserDefaults.standard.set(playerCoin, forKey: "playerCoin")
        }
    }
    @Published var playerTime: Int {
        didSet {
            UserDefaults.standard.set(playerTime, forKey: "playerTime")
        }
    }
    @Published var playerCardBG: String {
        didSet {
            UserDefaults.standard.set(playerCardBG, forKey: "playerCardBG")
        }
    }
    
    init() {
        self.playerName = UserDefaults.standard.object(forKey: "playerName") as? String ?? "player"
        self.playerNum = UserDefaults.standard.object(forKey: "playerNum") as? Int ?? 4
        self.playerCoin = UserDefaults.standard.object(forKey: "playerName") as? Int ?? 100
        self.playerTime = UserDefaults.standard.object(forKey: "playerTime") as? Int ?? 7
        self.playerCardBG = UserDefaults.standard.object(forKey: "playerCardBG") as? String ?? "cardBG1"
    }
}
