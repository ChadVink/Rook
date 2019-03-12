//
//  LiveGameModel.swift
//  Rook
//
//  Created by Vink, Chad on 3/9/19.
//  Copyright © 2019 Vink, Chad. All rights reserved.
//

import Foundation

class LiveGameData {
    var Team1Name: String?
    var Team2Name: String?
    
    var Player1Name: String?
    var Player2Name: String?
    var Player3Name: String?
    var Player4Name: String?
    
    var Team1Score: Int = 0
    var Team2Score: Int = 0
    
    let EndGameScore: Int
    
    var Dealer: Int = 3
    var PlayerWithBid: Int?

    var CardColorPicker = CardColors()
    
    var CurrentTrump: String?
    var CurrentBid: Int = 70
    
    init(_ endGameScore: Int) {
            EndGameScore = endGameScore
    }
}
