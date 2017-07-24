//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Max Highsmith on 7/24/17.
//  Copyright © 2017 SatyrLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //X (cross), 2 = O (Nought)
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]]  //all the possible winning combos
    var gameIsActive = true
    
    //connect the label for visibility modifications
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: AnyObject)
    {
        
        if(gameState[sender.tag-1] == 0 && gameIsActive == true){
            
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1){
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activePlayer = 2
            }
            else{
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                gameIsActive = false
                
                if(gameState[combination[0]] == 1)
                {
                    label.text = "X HAS WON"
                }
                else {
                    label.text = "O HAS WON"
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
            }
        }
        
        //set the game to false, and then check if there are any blank spots.  If there are, resume the game
        gameIsActive = false
        
        for i in gameState{
            if i == 0{
                gameIsActive = true
                break
            }
        }
        
        //if everything is full, its a draw
        if gameIsActive == false{
            label.text = "IT WAS A DRAW"
            label.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    //Connect the play again button for action and visibility
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            //remove images
            button.setImage(nil, for: UIControlState())
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

