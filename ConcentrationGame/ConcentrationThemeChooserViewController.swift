//
//  ConcentrationThemeChooserViewController.swift
//  ConcentrationGame
//
//  Created by Nogah Melamed Cohen on 23/10/2019.
//  Copyright © 2019 Nogah Melamed Cohen. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    
    var themes=["Halloween" : Theme(cardColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cardEmojis: ["🎃","🙀","🦇","😈","🏴‍☠️","☠️","👻","🧟‍♂️"]),
                "Sport" : Theme(cardColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), backgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cardEmojis: ["⚽️","🏀","🏓","🏋🏻‍♀️","🥇","⛹🏼‍♂️","🏄🏻‍♂️","🏐"]),
                "Love" : Theme(cardColor: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), backgroundColor: #colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1), cardEmojis: ["🥰","💋","💞","❤️","😻","💑","😘","😍"]),
                "Nature" : Theme(cardColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), backgroundColor: #colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1), cardEmojis: ["🌲","☘️","🌴","🌸","🍄","🍁","🌵","🌱"]),
                "Sea" : Theme(cardColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), backgroundColor: #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1), cardEmojis: ["🧜🏻‍♀️","🐠","🐳","🐋","🌊","🐚","🏄🏻‍♂️","🐙"]),
                "Flags" : Theme(cardColor: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), backgroundColor: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), cardEmojis: ["🇦🇽","🇺🇸","🇧🇷","🇨🇷","🇨🇦","🇮🇱","🇯🇵","🇬🇧"]),
    ]
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            //get theme name from button
            if let themeName = (sender as? UIButton)?.currentTitle ,let theme = self.themes[themeName] {
                if let cvc = segue.destination as? ConcentrationGameViewController {
                    cvc.theme = theme
                }
            }
            //if themeName is not in stored themes - print error
            else {
                print("Theme not found")
            }
        }
        
    }
    

}
