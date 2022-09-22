//
//  Player.swift
//  TicTacToe
//
//  Created by Jhoselynne Illanes Montero on 2022-09-15.
//

import Foundation

struct Player {
    
    var name: String = ""
    var marker: String = ""
    //  var playerTurn: Bool
    
    init(name: String, marker: String) {
        self.name = name
        self.marker = marker
    }
    
}


