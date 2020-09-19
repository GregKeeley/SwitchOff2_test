//
//  ViewController.swift
//  SwitchOff2_test
//
//  Created by Gregory Keeley on 9/19/20.
//

import UIKit

extension UIColor {
    static var defaultColor: UIColor { return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) }
    static var color1: UIColor { return #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1) }
    static var color2: UIColor { return #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1) }
    static var color3: UIColor { return #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1) }
    static var color4: UIColor { return #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1) }
    static var color5: UIColor { return #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1) }
    static var color6: UIColor { return #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1) }
    static var color7: UIColor { return #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1) }
    static var color8: UIColor { return #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1) }
    static var color9: UIColor { return #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1) }
    static var color10: UIColor { return #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1) }
    static var color11: UIColor { return #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1) }
    static var color12: UIColor { return #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1) }
    static var color13: UIColor { return #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1) }
}

class GameButton: UIButton {
    var currentCycle: Int = 0
    var active: Bool = false
}


class ViewController: UIViewController {
    
    @IBOutlet var gameButtons: [GameButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }
    private func configureButtons() {
        for button in gameButtons {
            button.layer.cornerRadius = 4
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.defaultColor
        }
    }
    private func cycleButtonColors(button: GameButton) {
        if button.currentCycle <= 12 {
            button.currentCycle += 1
        } else {
            button.currentCycle = 1
        }
        setGameButtonColor(button: button)
    }
    private func setGameButtonColor(button: GameButton) {
        if button.active {
            switch button.currentCycle {
            case 0:
                button.backgroundColor = UIColor.defaultColor
            case 1:
                button.backgroundColor = UIColor.color1
            case 2:
                button.backgroundColor = UIColor.color2
            case 3:
                button.backgroundColor = UIColor.color3
            case 4:
                button.backgroundColor = UIColor.color4
            case 5:
                button.backgroundColor = UIColor.color5
            case 6:
                button.backgroundColor = UIColor.color6
            case 7:
                button.backgroundColor = UIColor.color7
            case 8:
                button.backgroundColor = UIColor.color8
            case 9:
                button.backgroundColor = UIColor.color9
            case 10:
                button.backgroundColor = UIColor.color10
            case 11:
                button.backgroundColor = UIColor.color11
            case 12:
                button.backgroundColor = UIColor.color12
            case 13:
                button.backgroundColor = UIColor.color13
            default:
                button.backgroundColor = UIColor.defaultColor
            }
            
        } else {
            button.backgroundColor = UIColor.defaultColor
        }
    }
    //    private func checkButtonInRange(button: GameButton, index: Int)  {
    //        print("Testing index: \(index)")
    //        guard index >= 0 && index <= 24 else {
    //            print("Out of range")
    //            return
    //        }
    //        if index % 5 != 0 {
    //            if index % 5 != 1 {
    //                cycleButtonColors(button: button)
    //            }
    //        }
    //    }
    private func animateButton(button: GameButton) {
        UIView.animate(withDuration: 1.5, delay: 0.0, options: [.allowUserInteraction, .repeat]) {
            // any transform value of 1.0 represents the identity (original state)
            button.transform = CGAffineTransform(scaleX: 10.0, y: 10.0)
            button.alpha = 0.0
        }
        UIView.animate(withDuration: 0.3) {
            button.transform = CGAffineTransform.identity
            button.alpha = 1.0
        }
    }
    @IBAction func gameButtonPressed(_ sender: GameButton) {
        guard let middleIndex = gameButtons.firstIndex(of: sender) else {
            return
        }
        gameButtons[middleIndex].active.toggle()
        cycleButtonColors(button: gameButtons[middleIndex])
        animateButton(button: gameButtons[middleIndex])
        let topIndex = middleIndex - 5
        let bottomIndex = middleIndex + 5
        let leftIndex = middleIndex - 1
        let rightIndex = middleIndex + 1
        
        if topIndex >= 0 {
            gameButtons[topIndex].active.toggle()
            cycleButtonColors(button: gameButtons[topIndex])
            animateButton(button: gameButtons[topIndex])
        }
        if bottomIndex <= 24 {
            gameButtons[bottomIndex].active.toggle()
            cycleButtonColors(button: gameButtons[bottomIndex])
            animateButton(button: gameButtons[bottomIndex])
        }
        if leftIndex % 5 != 4 && leftIndex >= 0 {
            gameButtons[leftIndex].active.toggle()
            cycleButtonColors(button: gameButtons[leftIndex])
            animateButton(button: gameButtons[leftIndex])
        }
        if rightIndex % 5 != 0 && rightIndex <= 24 {
            gameButtons[rightIndex].active.toggle()
            cycleButtonColors(button: gameButtons[rightIndex])
            animateButton(button: gameButtons[rightIndex])
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        for button in gameButtons {
            button.currentCycle = 0
            button.active = false
            setGameButtonColor(button: button)
        }
    }
}

