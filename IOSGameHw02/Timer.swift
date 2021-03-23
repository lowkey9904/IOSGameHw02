//
//  Timer.swift
//  IOSGameHw02
//
//  Created by Joker on 2021/3/22.
//

import Foundation

class GameTimer: ObservableObject {
    private var frequency = 1.0
    private var timer: Timer?
    private var startDate: Date?
    @Published var secondsElapsed = 0
    
    func start() {
        secondsElapsed = 0
        startDate = Date()
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true)
        { timer in
            if let startDate = self.startDate {
                self.secondsElapsed = Int(timer.fireDate.timeIntervalSince1970 -
                                            startDate.timeIntervalSince1970)
            }
        }
    }
    func stop() {
        timer?.invalidate()
        timer = nil
    }
}
