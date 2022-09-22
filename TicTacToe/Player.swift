//
//  Player.swift
//  TicTacToe
//
//  Created by Jhoselynne Illanes Montero on 2022-09-15.
//

import Foundation

//class Player: NSObject {
struct Player {
    
    var name: String = ""
    var marker: String = ""
    
    init(name: String, marker: String) {
        self.name = name
        self.marker = marker
    }
    
    static func == (lp: Player, rp: Player) -> Bool {
        return lp.name == rp.name
    }
}
