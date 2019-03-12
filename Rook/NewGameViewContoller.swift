//
//  NewGameViewContoller.swift
//  Rook
//
//  Created by Vink, Chad on 3/9/19.
//  Copyright © 2019 Vink, Chad. All rights reserved.
//

import Foundation
import UIKit

class NewGameViewContoller: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var PlayToPicker: UIPickerView!
    @IBOutlet weak var Team1TextBox: UITextField!
    @IBOutlet weak var Team2TextBox: UITextField!
    @IBOutlet weak var Player1TextBox: UITextField!
    @IBOutlet weak var Player2TextBox: UITextField!
    @IBOutlet weak var Player3TextBox: UITextField!
    @IBOutlet weak var Player4TextBox: UITextField!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        // Connect data:
        self.PlayToPicker.delegate = self
        self.PlayToPicker.dataSource = self
        pickerData = ["200", "300", "500", "700"]
        
        // Set the borders for each team selection box
        let redColor = UIColor.red.cgColor
        let blueColor = UIColor.blue.cgColor
        
        setTextBoxBorders(Team1TextBox, blueColor)
        setTextBoxBorders(Player1TextBox, blueColor)
        setTextBoxBorders(Player3TextBox, blueColor)

        setTextBoxBorders(Team2TextBox, redColor)
        setTextBoxBorders(Player2TextBox, redColor)
        setTextBoxBorders(Player4TextBox, redColor)
        

        // Random selection for team names
        Team1TextBox.text = setTextBoxTeamName()
        Team2TextBox.text = setTextBoxTeamName()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func DonePressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    

    // PICKER SETTINGS
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // SET TEXT BOXES
    func setTextBoxBorders(_ textBox: UITextField, _ textBoxColor: CGColor) {
        textBox.layer.borderColor = textBoxColor
        textBox.layer.borderWidth = 1
    }
    
    func setTextBoxTeamName() -> String{
        if let animalFilepath = Bundle.main.path(forResource: "Animals", ofType: "txt"),
            let adjFilepath = Bundle.main.path(forResource: "Adj", ofType: "txt"){
            do {
                let AnimalFile = try String(contentsOfFile: animalFilepath)
                let AdjFile = try String(contentsOfFile: adjFilepath)

                let AnimalList : [String] = AnimalFile.components(separatedBy: "\n")
                let AdjList : [String] = AdjFile.components(separatedBy: "\n")
                
                let AnimalIdx = Int(arc4random_uniform(UInt32(AnimalList.count)))
                let AdjIdx = Int(arc4random_uniform(UInt32(AdjList.count)))
                
                return "The " + AdjList[AdjIdx] + " " + AnimalList[AnimalIdx]
            } catch {
                // contents could not be loaded
                print("Animals.txt and Adj.txt could not be loaded.")
            }
        } else {
            // example.txt not found!
            print("Animals.txt and Adj.txt was not found.")
        }
        
        return ""
    }
}
