//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Nogah Melamed Cohen on 03/10/2019.
//  Copyright © 2019 Nogah Melamed Cohen. All rights reserved.
//

import UIKit

class ConcentrationGameViewController: UIViewController {
    
    lazy var game=ConcentrationModel(numberOfCardsPairs: (cards.count+1)/2)

    var cardsEmoji = Dictionary<Int,String>()
    var theme = Theme(cardColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cardEmojis: ["🎃","🙀","🦇","😈","🏴‍☠️","☠️","👻","🧟‍♂️"])
    {
        didSet {
            self.emojis = self.theme.cardEmojis
            self.cardsEmoji = Dictionary<Int, String>()
            self.updateViewFromModel()
        }
    }
    lazy var emojis = theme.cardEmojis
    
    @IBOutlet var cards: [UIButton]!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var movesCount: UILabel!
    @IBOutlet var background: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateViewFromModel()
    }
        
    @IBAction func CardClicked(_ sender: UIButton) {
        if let cardNumber=cards.firstIndex(of: sender)
        {
            game.cardFlip(cardIndex: cardNumber)
            updateViewFromModel()
        }
        else
        {
            print("error: card was not in cards")
        }
    }
        
    @IBAction func NewGame(_ sender: UIButton) {
        self.game = ConcentrationModel(numberOfCardsPairs: (cards.count+1)/2)
        //self.theme = self.themes.randomElement() ?? Theme(cardColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cardEmojis: ["🎃","🙀","🦇","😈","🏴‍☠️","☠️","👻","🧟‍♂️"])
        self.cardsEmoji = Dictionary<Int,String>()
        self.emojis=theme.cardEmojis
        self.updateViewFromModel()
    }
    
    func updateViewFromModel()
    {
        //check function is called only if buttons already set
        if cards != nil {
            for cardIndex in cards.indices
            {
                let card=game.cards[cardIndex]
                let button=cards[cardIndex]
                if card.isFaceUp
                {
                    button.backgroundColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    button.setTitle(getEmoji(for: card), for:UIControl.State.normal)
                }
                else
                {
                    if card.isMatch
                    {
                        button.backgroundColor=#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0)
                        button.setTitle("", for: UIControl.State.normal)
                    }
                    else
                    {
                        button.backgroundColor=theme.cardColor
                        button.setTitle("", for: UIControl.State.normal)
                    }
                }
            }
            background.backgroundColor=theme.backgroundColor
            score.text="score: \(game.score)"
            movesCount.text="moves: \(game.moves)"
        }
        
    }
    
    func getEmoji(for card:Card)->String
    {
        if cardsEmoji[card.ID] == nil
        {
            let randIndex=Int(arc4random_uniform(UInt32(emojis.count)))
            cardsEmoji[card.ID]=emojis.remove(at: randIndex)
        }
        
        return cardsEmoji[card.ID] ?? "?"
    }
}

