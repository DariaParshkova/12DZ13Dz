//
//  SettingsViewController.swift
//  12Dz13Dz
//
//  Created by Parshkova Daria on 27.02.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let colorPicker = UIPickerView()
    let labelColorTextField = UITextField()
   
    let lineBreakModePicker = UIPickerView()
    let lineBreakModePickerTextField = UITextField()
   
    let linesCountPicker = UIPickerView()
    let linesCountTextField = UITextField()

    let textField = UITextField()
    let toolBarTextField = UIToolbar()
    
    let switchForShadow = UISwitch()
    
    override func viewDidLoad() {
        
        createLabelColorTextField(view: self)
        createPickerColor(view: self)
        
        createPickerForBreakModesLine(view: self)
        createLineBreakModePickerTextField(view: self)
        
        createCountLinesPicker(view: self)
        createCountLinesTextField(view: self)
        
        createToolBarForTextField(view: self)
        createItemsForToolBar(view: self)
        createTextField(view: self)
        
        createTagsForPicker(view:self)
        
        createTextFieldSettings(view: self)
        
        createSwitch(view: self)
        
        let viewsArray = [ textField,  labelColorTextField, lineBreakModePickerTextField, linesCountTextField, switchForShadow]
        for view in viewsArray {
            self.view.addSubview(view)
        }
 
    }
    func createTextFieldSettings(view:UIViewController) {
        labelColorTextField.inputView = colorPicker
        labelColorTextField.inputAccessoryView = toolBarTextField
        
        lineBreakModePickerTextField.inputView = lineBreakModePicker
        lineBreakModePickerTextField.inputAccessoryView = toolBarTextField
        
        linesCountTextField.inputView = linesCountPicker
        linesCountTextField.inputAccessoryView = toolBarTextField
    }
    
    
    func createTagsForPicker(view:UIViewController) {
        colorPicker.tag = 1
        colorPicker.dataSource = self
        colorPicker.delegate = self
        
        lineBreakModePicker.tag = 2
        lineBreakModePicker.dataSource = self
        lineBreakModePicker.delegate = self
        
        linesCountPicker.tag = 3
        linesCountPicker.dataSource = self
        linesCountPicker.delegate = self
    }
    //MARK: create ToolBar
    func createToolBarForTextField(view:UIViewController) {
        toolBarTextField.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 30)
            toolBarTextField.barStyle = .default
    }
    
    func createItemsForToolBar(view:UIViewController) {
        toolBarTextField.items =  [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButton))]
        toolBarTextField.tintColor = .purple
        toolBarTextField.barStyle = .default
        
    }
    
    func createTextField(view:UIViewController) {
        textField.frame = (CGRect(x: 120, y: 300, width: 70, height: 40))
        
    }
    
    //MARK: create for COLOR
    func createLabelColorTextField(view:UIViewController) {
        labelColorTextField.frame = CGRect(x: 170, y: 150, width: 70, height: 40)
        labelColorTextField.text = "COLOR"
        labelColorTextField.textColor = .purple
    }
 
    func createPickerColor(view:UIViewController) {
        colorPicker.contentMode = .center
        colorPicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.height - 300, width: UIScreen.main.bounds.size.width, height: 250)
        colorPicker.setValue(UIColor.purple, forKey: "textColor")
    }
    
    //MARK: create for BREAKMODE
    func createLineBreakModePickerTextField(view:UIViewController ) {
        lineBreakModePickerTextField.frame = CGRect(x: 170, y: 250, width: 100, height: 40)
        lineBreakModePickerTextField.text = "DEFAULT"
        lineBreakModePickerTextField.textColor = .purple
    }
    func createPickerForBreakModesLine(view:UIViewController) {
        lineBreakModePicker.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 250)
        lineBreakModePicker.setValue(UIColor.purple, forKey: "textColor")
        lineBreakModePicker.contentMode = .center
    }
    
    //MARK: create for LINES
    func createCountLinesTextField(view:UIViewController) {
        linesCountTextField.frame = CGRect(x: 170, y: 350, width: 70, height: 40)
        linesCountTextField.text = "1"
        linesCountTextField.textColor = .purple
        linesCountTextField.textAlignment = .center
    }
   
    func createCountLinesPicker(view:UIViewController) {
        linesCountPicker.contentMode = .center
        linesCountPicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.height - 300, width: UIScreen.main.bounds.size.width, height: 250)
        linesCountPicker.contentMode = .bottom
        linesCountPicker.setValue(UIColor.purple, forKey: "textColor")
        
        
    }
    //MARK shadow SWITCH
    func createSwitch(view:UIViewController) {
        switchForShadow.frame = CGRect(x: 170, y: 450, width: 30, height: 0)
        switchForShadow.addTarget(self, action: #selector(changeShadow), for: .valueChanged)
    }
  
    //MARK: @OBJC FUNCS
    @objc func onDoneButton() {
        labelColorTextField.endEditing(true)
        lineBreakModePickerTextField.endEditing(true)
        linesCountTextField.endEditing(true)
    }
    @objc func changeShadow () {
        if switchForShadow.isOn {
            labelShadowOffset = CGSize(width: 1, height: 2)
        } else {
            labelShadowOffset = CGSize(width: 0, height: 0)
        }
    }
 
}
extension SettingsViewController : UIPickerViewDataSource , UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1: return colorsArr.count
        case 2 : return lineBreakModeArr.count
        case 3 : return lineNumberArr.count
        default : return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1 : return colorForText(color: colorsArr[row])
        case 2 : return (lineBreakModeForText(mode: lineBreakModeArr[row]))
        case 3: return String(lineNumberArr[row])
            
        default : return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1 : labelColorTextField.text = colorForText(color: colorsArr[row])
            color = colorsArr[row]
            colorForShadow = colorsArr[row]
        case 2 : lineBreakModePickerTextField.text = lineBreakModeForText(mode: lineBreakModeArr[row])
            lineBreakMode = lineBreakModeArr[row]
        case 3 : linesCountTextField.text = String(lineNumberArr[row])
            numberOfLines = lineNumberArr[row]
        default : break
            
        }
    }
    
    func colorForText (color:UIColor) -> String {
        switch color {
        case .black : return "purple"
        case .blue : return "blue"
        case .purple : return "black"
        case .magenta : return "magenta"
        case .green : return "green"
        default : return " "
        }
    }
    func lineBreakModeForText (mode: NSLineBreakMode) -> String {
        switch mode {
        case .byWordWrapping : return "byWordWrapping"
        case .byClipping : return "byClipping"
        case .byCharWrapping : return "byCharWrapping"
        default : return ""
        }
    }
    
    
}
var colorsArr : [UIColor] = [.black, .blue, .purple, .magenta, .green ]
var lineNumberArr : [Int] = [1,2,3,4,5,8,12]
var lineBreakModeArr : [NSLineBreakMode] = [.byWordWrapping, .byClipping, .byCharWrapping]
