//
//  Game.swift
//  TicTacToe
//
//  Created by Jhoselynne Illanes Montero on 2022-09-16.
//

import Foundation

class Game {
    
    var player1Array: Array<Int> = []
    var player2Array: Array<Int> = []
    
    var winConditions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var player1: Player
    var player2: Player
    
    var currentPlayer: Player
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        currentPlayer = player1
    }
    
    func addMove(index: Int) {
        if currentPlayer == player1 {
            player1Array.append(index)
        } else {
            player2Array.append(index)
        }
    }
    
    // Change players every other time
    func togglePlayer(name: String) {
        if currentPlayer == player1 {
            currentPlayer = player2
        } else {
            currentPlayer = player1
        }
    }
    // Checks if player's array match one of the win conditions
    func checkWinConditions(playerArray: Array<Int>) -> Bool {
        for winCondition in winConditions {
            if winCondition.allSatisfy(playerArray.contains) {
                return true
            }
        }
        return false
    }
    
    func resetGame() {
        player1Array = []
        player2Array = []
        currentPlayer = player1
        
        print("Reset was pressed: \(player1Array), \(player2Array)")
    }
}
