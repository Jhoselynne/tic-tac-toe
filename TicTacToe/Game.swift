//
//  Game.swift
//  TicTacToe
//
//  Created by Jhoselynne Illanes Montero on 2022-09-16.
//

import Foundation

class Game {
    
    // States
    let GAME_CONTINUE = 0
    let FINISHED_PLAYER1 = 1
    let FINISHED_PLAYER2 = 2
    let FINISHED_DRAW = 3
    let BUSY_CELL = 4
    
    var gameStatus: Int
    
    var board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
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
        gameStatus = GAME_CONTINUE
    }
    
    func addMove(index: Int) -> Int {
        
        if gameStatus != GAME_CONTINUE {
            return gameStatus
        }
        
        if currentPlayer.name == player1.name {
            board[index] = 1
            player1Array.append(index)
        } else {
            board[index] = 2
            player2Array.append(index)
        }
        
        return GAME_CONTINUE
    }
    
    // Change players every other time
    func togglePlayer(name: String) {
        if currentPlayer.name == player1.name {
            currentPlayer = player2
        } else {
            currentPlayer = player1
        }
    }
    
    func checkWinConditions(playerArray: Array<Int>) -> Bool {
        
        for winCondition in winConditions {
            if winCondition.allSatisfy(playerArray.contains) {
                return true
            }
        }
        return false
    }
    
    func resetGame() {
        board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        player1Array = []
        player2Array = []
        currentPlayer = player1
        
        print("RESET WAS PRESSED!!")
        print(board)
        print(player1Array, player2Array)
    }
    
}
