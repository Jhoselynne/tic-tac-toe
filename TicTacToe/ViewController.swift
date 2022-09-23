//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jhoselynne Illanes Montero on 2022-09-07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var turnLbl: UILabel!
    @IBOutlet weak var playerLbl: UILabel!
    @IBOutlet var UIButtons: [UIButton]!
    @IBOutlet weak var resetBtn: UIButton!
    
    var game: Game = Game(player1: Player(name: "Player 1", marker: "star"), player2: Player(name: "Player 2", marker: "happy-sun"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerLbl.text = game.currentPlayer.name
    }
    
    @IBAction func setMarker(_ sender: UIButton) {
        let tag = sender.tag

        game.addMove(index: tag)
        // print("tag:", tag)
        
        disableBoardBtn(index: tag)
        
        sender.setBackgroundImage(UIImage(named: game.currentPlayer.marker), for: .normal)
        
        // Checks if any player has won
        var ifWon = false
        
        if game.currentPlayer == game.player1 {
            ifWon = game.checkWinConditions(playerArray: game.player1Array)
        } else {
            ifWon = game.checkWinConditions(playerArray: game.player2Array)
        }
        print(ifWon)
        
        
        // If any player wins, game stops
        if ifWon == true {
            for button in UIButtons {
                button.isUserInteractionEnabled = false
            }
            playerLbl.text = "\(game.currentPlayer.name) won!!"
            turnLbl.isHidden = true
            resetBtn.setTitle("Play again", for: .normal)
        } else if ifWon != true && game.player1Array.count == 5 {
            playerLbl.text = "Draw"
            turnLbl.isHidden = true
            resetBtn.setTitle("Play again", for: .normal)
        }else {
            game.togglePlayer(name: game.currentPlayer.name)
            playerLbl.text = game.currentPlayer.name
            print("Player 1 Array = ", game.player1Array)
            print("Player 2 Array = ", game.player2Array)
        }
    }
    
    @IBAction func onReset(_ sender: Any) {
        game.resetGame()
        turnLbl.isHidden = false
        resetBtn.setTitle("Reset", for: .normal)
        
        for button in UIButtons {
            button.setBackgroundImage(.init(), for: .normal)
            button.isUserInteractionEnabled = true
        }
        playerLbl.text = game.currentPlayer.name
    }
    
    func disableBoardBtn(index: Int) {
        UIButtons[index].isUserInteractionEnabled = false
    }
}
