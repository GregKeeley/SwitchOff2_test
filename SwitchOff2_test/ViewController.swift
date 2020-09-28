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
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var buttonPressesLabel: UILabel!
    
    var timerIsPaused = true
    var timerIsActive = false
    var timer = Timer()
        
    var buttonPresses = 0 {
        didSet {
            buttonPressesLabel.text = ("Button Presses: \(buttonPresses)")
        }
    }
    
    var seconds: Int = 0 {
        didSet {
            if seconds < 10 && minutes < 10 {
            timerLabel.text = ("0\(minutes):0\(seconds)")
            } else if seconds < 10 && minutes >= 10 {
                timerLabel.text = ("\(minutes):0\(seconds)")
            } else {
                timerLabel.text = ("0\(minutes):\(seconds)")
            }
        }
    }
    
    var minutes: Int = 0 {
        didSet {
            if minutes < 10 {
                timerLabel.text = ("0\(minutes):0\(seconds)")
            } else {
                timerLabel.text = ("\(minutes):0\(seconds)")
            }
        }
    }
    
    var hours: Int = 0
    
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
        let currentBkgdColor = button.backgroundColor
        if button.active {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [.allowUserInteraction]) {
                //                button.backgroundColor = currentBkgdColor
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
                self.animationScaleEffect(view: button, animationTime: 0.01)
            }
        } else {
            UIView.animate(withDuration: 1.0, animations: {
                button.backgroundColor = currentBkgdColor
                button.backgroundColor = UIColor.defaultColor
            })
        }
        
        //        self.animationScaleEffect(view: button, animationTime: 0.3)
    }
    func animationScaleEffect(view:UIView,animationTime:Float) {
//        let pulse = PulseAnimation(numberOfPulses: Float.infinity, radius: 200, position: view.center)
//        pulse.animationDuration = 1.0
//        pulse.backgroundColor = view.backgroundColor?.cgColor
//        view.layer.insertSublayer(pulse, below: view.layer)
//
//        UIView.animate(withDuration: TimeInterval(animationTime), animations: {
//            view.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//        },completion:{ (completion) in
//            UIView.animate(withDuration: TimeInterval(animationTime), animations: { () -> Void in
//                view.transform = CGAffineTransform(scaleX: 1, y: 1)
//                view.layer.removeAllAnimations()
//            })
//        })
    }
    private func animateButton(button: GameButton) {
//                UIView.animate(withDuration: 1.5, delay: 0.0, options: [.allowUserInteraction, .repeat]) {
//                    // any transform value of 1.0 represents the identity (original state)
//                    button.transform = CGAffineTransform(scaleX: 10.0, y: 10.0)
//                    button.alpha = 0.0
//                }
//                UIView.animate(withDuration: 0.3) {
//                    button.transform = CGAffineTransform.identity
//                    button.alpha = 1.0
//                }
    }
    private func winCheck() -> Bool {
        for button in gameButtons {
            if button.active == true {
                return false
            }
        }
        return true
    }
    private func startTimer() {
//        timerIsPaused.toggle()
        if timerIsPaused == false {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { tempTimer in
                if self.seconds == 59 {
                    self.seconds = 00
                    if self.minutes == 59 {
                        self.minutes = 00
                        self.hours = self.hours + 1
                    } else {
                        self.minutes = self.minutes + 1
                    }
                } else {
                    self.seconds = self.seconds + 1
                }
            }
        } else {
            timer.invalidate()
        }
    }
    
    @IBAction func gameButtonPressed(_ sender: GameButton) {
        buttonPresses += 1
        timerIsPaused = false
        if timerIsActive == false {
            startTimer()
            timerIsActive = true
        }
        if winCheck() {
            print("You win!")
        }
        guard let middleIndex = gameButtons.firstIndex(of: sender) else {
            return
        }
        gameButtons[middleIndex].active.toggle()
        if Range(0...24).contains(middleIndex) {
            cycleButtonColors(button: gameButtons[middleIndex])
        }
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
        buttonPresses = 0
        seconds = 0
        minutes = 0
        hours = 0
        timerIsActive = false
        timerIsPaused = true
        timer.invalidate()
        startTimer()
        for button in gameButtons {
            button.currentCycle = 0
            button.active = false
            setGameButtonColor(button: button)
        }
    }
}

