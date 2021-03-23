//
//  Poker.swift
//  IOSGameHw02
//
//  Created by Joker on 2021/3/20.
//

import Foundation

struct poker {
    var imagestr: String
    var num:Int
    var suit:String
}

var allPokerBack = ["cardBG1", "cardBG2", "cardBG3", "cardBG4"]

var allPoker = [
    poker(imagestr: "ace_of_clubs", num: 1, suit: "c"),
    poker(imagestr: "ace_of_diamonds", num: 1, suit: "d"),
    poker(imagestr: "ace_of_hearts", num: 1, suit: "h"),
    poker(imagestr: "ace_of_spades", num: 1, suit: "s"),
    poker(imagestr: "2_of_clubs", num: 2, suit: "c"),
    poker(imagestr: "2_of_diamonds", num: 2, suit: "d"),
    poker(imagestr: "2_of_hearts", num: 2, suit: "h"),
    poker(imagestr: "2_of_spades", num: 2, suit: "s"),
    poker(imagestr: "3_of_clubs", num: 3, suit: "c"),
    poker(imagestr: "3_of_diamonds", num: 3, suit: "d"),
    poker(imagestr: "3_of_hearts", num: 3, suit: "h"),
    poker(imagestr: "3_of_spades", num: 3, suit: "s"),
    poker(imagestr: "4_of_clubs", num: 4, suit: "c"),
    poker(imagestr: "4_of_diamonds", num: 4, suit: "d"),
    poker(imagestr: "4_of_hearts", num: 4, suit: "h"),
    poker(imagestr: "4_of_spades", num: 4, suit: "s"),
    poker(imagestr: "5_of_clubs", num: 5, suit: "c"),
    poker(imagestr: "5_of_diamonds", num: 5, suit: "d"),
    poker(imagestr: "5_of_hearts", num: 5, suit: "h"),
    poker(imagestr: "5_of_spades", num: 5, suit: "s"),
    poker(imagestr: "6_of_clubs", num: 6, suit: "c"),
    poker(imagestr: "6_of_diamonds", num: 6, suit: "d"),
    poker(imagestr: "6_of_hearts", num: 6, suit: "h"),
    poker(imagestr: "6_of_spades", num: 6, suit: "s"),
    poker(imagestr: "7_of_clubs", num: 7, suit: "c"),
    poker(imagestr: "7_of_diamonds", num: 7, suit: "d"),
    poker(imagestr: "7_of_hearts", num: 7, suit: "h"),
    poker(imagestr: "7_of_spades", num: 7, suit: "s"),
    poker(imagestr: "8_of_clubs", num: 8, suit: "c"),
    poker(imagestr: "8_of_diamonds", num: 8, suit: "d"),
    poker(imagestr: "8_of_hearts", num: 8, suit: "h"),
    poker(imagestr: "8_of_spades", num: 8, suit: "s"),
    poker(imagestr: "9_of_clubs", num: 9, suit: "c"),
    poker(imagestr: "9_of_diamonds", num: 9, suit: "d"),
    poker(imagestr: "9_of_hearts", num: 9, suit: "h"),
    poker(imagestr: "9_of_spades", num: 9, suit: "s"),
    poker(imagestr: "10_of_clubs", num: 10, suit: "c"),
    poker(imagestr: "10_of_diamonds", num: 10, suit: "d"),
    poker(imagestr: "10_of_hearts", num: 10, suit: "h"),
    poker(imagestr: "10_of_spades", num: 10, suit: "s"),
    poker(imagestr: "jack_of_clubs2", num: 11, suit: "c"),
    poker(imagestr: "jack_of_diamonds2", num: 11, suit: "d"),
    poker(imagestr: "jack_of_hearts2", num: 11, suit: "h"),
    poker(imagestr: "jack_of_spades2", num: 11, suit: "s"),
    poker(imagestr: "queen_of_clubs2", num: 12, suit: "c"),
    poker(imagestr: "queen_of_diamonds2", num: 12, suit: "d"),
    poker(imagestr: "queen_of_hearts2", num: 12, suit: "h"),
    poker(imagestr: "queen_of_spades2", num: 12, suit: "s"),
    poker(imagestr: "king_of_clubs2", num: 13, suit: "c"),
    poker(imagestr: "king_of_diamonds2", num: 13, suit: "d"),
    poker(imagestr: "king_of_hearts2", num: 13, suit: "h"),
    poker(imagestr: "king_of_spades2", num: 13, suit: "s"),
    //poker(imagestr: "red_joker", num: 0, suit: "j"),
]
var allPoker1 = [allPoker[0], allPoker[1], allPoker[2], allPoker[3], allPoker[4]]
var allPoker2 = [allPoker[5], allPoker[6], allPoker[7], allPoker[8], allPoker[9]]
var allPoker3 = [allPoker[10], allPoker[11], allPoker[12], allPoker[13], allPoker[14]]
var allPoker4 = [allPoker[15], allPoker[16], allPoker[17], allPoker[18], allPoker[19]]
var whichPlayer = [allPoker1, allPoker2, allPoker3, allPoker4]
