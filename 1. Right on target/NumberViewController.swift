//
//  ViewController.swift
//  1. Right on target
//
//  Created by Dima Savitskiy on 12.10.21.
//

import UIKit

class NumberViewController: UIViewController {

    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let generator = Generator(startValue: 1, endValue: 50)!
        game = Game(valueGenerator: generator, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }

    
    @IBAction func chekNumber() {
        game.currentRound.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    private func updateLabelWithSecretNumber(newText:String) {
        label.text = newText
    }

    private func showAlertWith (score: Int) {
        let alert = UIAlertController (title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
}
