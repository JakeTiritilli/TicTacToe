//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jacob Tiritilli on 6/23/18.
//  Copyright © 2018 Jacob Tiritilli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = TicTacToe()

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet var cellButtons: [UIButton]!
    
    @IBAction func touchCell(_ sender: UIButton) {
        let cellNumber = cellButtons.index(of: sender)!
        updateGameState(at: cellNumber, for: sender)
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        game.reset()
        for button in cellButtons {
            button.setTitle("", for: UIControlState.normal)
        }
        statusLabel.text = "Turn: \(game.currentPlayer)"
        statusLabel.textColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
    }
    
    func updateGameState(at cell: Int, for button: UIButton) {
        let player = game.currentPlayer
        if game.makeMove(at: cell) {
            button.setTitle(player, for: UIControlState.normal)
            if game.isGameOver {
                statusLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                statusLabel.text = "Game Over: \(player) Wins!"
            } else if game.isCatsGame {
                statusLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                statusLabel.text = "Cat's Game!"
            } else {
                statusLabel.text = "Turn: \(game.currentPlayer)"
            }
        }
    }
}
