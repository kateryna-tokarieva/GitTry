//
//  ViewController.swift
//  RPS
//
//  Created by Екатерина Токарева on 21/09/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appsSign: UILabel!
    
    
    
    @IBOutlet weak var rock: UIButton!
    
    @IBOutlet weak var paper: UIButton!
    
    
    @IBOutlet weak var sciccors: UIButton!
    
    
    @IBOutlet weak var state: UILabel!
    
    @IBOutlet weak var play: UIButton!
    
    var win = 0
    var lose = 0
    var draw = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
        play.isHidden = true
        self.view.backgroundColor = UIColor(red: 1, green: 0.71372, blue: 0.756862, alpha: 1)
    }
    func play (_ sign: Sign) {
       let computerSign = randomSigh()
        appsSign.text = computerSign.description
        switch sign {
        case .rock:
            rock.isHidden = false
            paper.isHidden = true
            sciccors.isHidden = true
        case .paper:
            rock.isHidden = true
            paper.isHidden = false
            sciccors.isHidden = true
        case .scissors:
            rock.isHidden = true
            paper.isHidden = true
            sciccors.isHidden = false
        }
        play.isHidden = false
        let result = sign.gameResult(computerSign)
        switch result {
        case .win:
            state.text = "You won! 🥳"
            self.view.backgroundColor = UIColor(red: 0.61568, green: 0.756862, blue: 0.51372549, alpha: 1)
            win += 1
            winCount.text = String(win)

        case .lose:
            state.text = "You lose 😛"
            self.view.backgroundColor = UIColor(red: 0.8274, green: 0.8274, blue: 0.8274, alpha: 1)
            lose += 1
            loseCount.text = String(lose)

        case .draw:
            state.text = "Try one more time"
            draw += 1
            drawCount.text = String(draw)

        case .start:
            play.isHidden = false

        }
        
    }
    func reset() {
        rock.isHidden = false
        paper.isHidden = false
        sciccors.isHidden = false
        play.isHidden = false
        self.view.backgroundColor = UIColor(red: 1, green: 0.71372, blue: 0.756862, alpha: 1)
        state.text = "Paper, Rock, Scissors?"
        appsSign.text = "🤖"
    }
    
    
    @IBAction func rock(_ sender: Any) {
        play(.rock)
    }
    
    
    @IBAction func paper(_ sender: Any) {
        play(.paper)
    }
    
    
    @IBAction func scissors(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction func play(_ sender: Any) {
        reset()
    }
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var loseLabel: UILabel!
    
    @IBOutlet weak var drawLabel: UILabel!
    
    @IBOutlet weak var drawCount: UILabel!
    
    @IBOutlet weak var winCount: UILabel!
    @IBOutlet weak var loseCount: UILabel!
    
    
    @IBAction func resetCountButton(_ sender: Any) {
        resetCount()
    }
    
    func resetCount () {
        win = 0
        lose = 0
        draw = 0
        drawCount.text = String(draw)
        winCount.text = String(win)
        loseCount.text = String(lose)

    }
}

