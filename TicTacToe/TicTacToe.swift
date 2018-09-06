//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by Jacob Tiritilli on 6/23/18.
//  Copyright © 2018 Jacob Tiritilli. All rights reserved.
//

import Foundation

class TicTacToe {
    
    var isGameOver = false
    
    var isCatsGame = false
    
    var currentPlayer = "X" // Player X will always go first
    
    var gameBoard: [String?] = Array(repeating: nil, count: 9)
    
    func makeMove(at cellNum: Int) -> Bool {
        if !isGameOver && gameBoard[cellNum] == nil {
            gameBoard[cellNum] = currentPlayer
            currentPlayer = (currentPlayer == "X") ? "O" : "X"
            checkGameOver()
            return true
        }
        return false
    }
    
    func checkGameOver() {
        if checkHorizontals() || checkVerticals() || checkDiagonals() {
            isGameOver = true
        } else if boardIsFull() {
            isCatsGame = true
        }
    }
    
    func checkHorizontals() -> Bool {
        return (gameBoard[0] != nil && gameBoard[0] == gameBoard[1] && gameBoard[1] == gameBoard[2]) ||
               (gameBoard[3] != nil && gameBoard[3] == gameBoard[4] && gameBoard[4] == gameBoard[5]) ||
               (gameBoard[6] != nil && gameBoard[6] == gameBoard[7] && gameBoard[7] == gameBoard[8])
    }
    
    func checkVerticals() -> Bool {
        return (gameBoard[0] != nil && gameBoard[0] == gameBoard[3] && gameBoard[3] == gameBoard[6]) ||
               (gameBoard[1] != nil && gameBoard[1] == gameBoard[4] && gameBoard[4] == gameBoard[7]) ||
               (gameBoard[2] != nil && gameBoard[2] == gameBoard[5] && gameBoard[5] == gameBoard[8])
    }
    
    func checkDiagonals() -> Bool {
        return (gameBoard[0] != nil && gameBoard[0] == gameBoard[4] && gameBoard[4] == gameBoard[8]) ||
               (gameBoard[2] != nil && gameBoard[2] == gameBoard[4] && gameBoard[4] == gameBoard[6])
    }
    
    func boardIsFull() -> Bool {
        for slot in gameBoard {
            if slot == nil {
                return false
            }
        }
        return true
    }
    
    func reset() {
        isGameOver = false
        isCatsGame = false
        currentPlayer = "X"
        for i in gameBoard.indices {
            gameBoard[i] = nil
        }
    }
}
