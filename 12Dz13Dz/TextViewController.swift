//
//  TextViewController.swift
//  12Dz13Dz
//
//  Created by Parshkova Daria on 27.02.2023.
//

import UIKit

class TextViewController: UIViewController , UITextFieldDelegate {
    let buttonAdd = UIButton()
    
    var labelText = UITextField()
    let labelForText = UILabel()
    
    let alert = UIAlertController()
   
    
    let labelForSize = UILabel()
    let fontSizeSlider = UISlider()

    var fontToolBar = UIToolbar()
    
    
    let fontPicker = UIPickerView()
    let buttonForPickerFonts = UIButton()
    
    let fontLabel = UILabel()
    //MARK: objects for SettingsVC
    
    override func viewDidLoad() {
       
      
        self.hideKeyBoardWithTapped()
        
        super.viewDidLoad()
        
        labelText.delegate = self
        self.labelText.becomeFirstResponder()
        self.hideKeyBoardWithTapped()
        labelText.inputView = fontPicker
        labelText.inputAccessoryView = fontToolBar
        fontPicker.delegate = self
        fontPicker.dataSource = self
        createSliderForSize(view: self)
        createLabelDefault(view: self)
        createButtonAdd(view: self)
        createLabelForSize(view: self)
        createButtonForPickerFonts(view: self)
        createPicker(view: self)
        createToolBarForPicker(view: self)
        createItemsForToolBar(view: self)
      
        buttonAdd.addTarget(self, action:#selector(changeText) , for: .touchUpInside)
        let viewsArray = [buttonAdd, fontToolBar, labelForText, labelForSize, fontSizeSlider, buttonForPickerFonts, fontPicker]
        
        for view in viewsArray {
            self.view.addSubview(view)
        }
        labelForText.center = view.center
    }
    
    //MARK: sliderForSizeFont
    func createLabelForSize(view: UIViewController) {
        labelForSize.frame = CGRect(x: 160, y: 600, width: 50, height: 30)
        labelForSize.text = "Size"
        labelForSize.textColor = .purple
        labelForSize.textAlignment = .center
        
    }
    func createSliderForSize(view:UIViewController) {
        fontSizeSlider.frame = CGRect(x: 20, y: 630, width: 345, height: 20)
        fontSizeSlider.minimumValue = 15
        fontSizeSlider.maximumValue = 100
        fontSizeSlider.isUserInteractionEnabled = true
        fontSizeSlider.isEnabled = true
        fontSizeSlider.addTarget(self, action: #selector(changeSizeOfLabel), for: .valueChanged)
    }
 
    //MARK: labelDefault and alert
    
    func createLabelDefault(view:UIViewController) {
        labelForText.frame = CGRect(x: 0, y: 0, width: 399, height: 300)
        labelForText.text = "Default text"
        labelForText.textAlignment = .center
        labelForText.layer.borderColor = UIColor.purple.cgColor
        labelForText.layer.borderWidth = 2
    }
 
    //MARK: button add
    func createButtonAdd(view:UIViewController) {
        buttonAdd.frame = CGRect(x: 170, y: 100, width: 50, height: 50)
        buttonAdd.setImage(UIImage(systemName: "plus.circle"), for : .normal)
        buttonAdd.tintColor = .purple
        buttonAdd.addTarget(self, action:#selector(changeText) , for: .touchUpInside)
    }
    //MARK: Toolbar
    /*func createToolBar(view:UIViewController) {
        fontToolBar = .init(frame: CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 40))
        fontToolBar.barStyle = .default
    
    }
    func createToolBarItems(view:UIViewController) {
        fontToolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
    }
    */
    
    //MARK: create ToolBar
    func createToolBarForPicker(view:UIViewController) {
        fontToolBar.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 200, width: UIScreen.main.bounds.size.width, height: 30)
            fontToolBar.barStyle = .default
        fontToolBar.isHidden = true
    }
    
    func createItemsForToolBar(view:UIViewController) {
        fontToolBar.items =  [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButton))]
        fontToolBar.tintColor = .purple
       fontToolBar.barStyle = .default
        fontToolBar.isHidden = true
        
    }
    //MARK: buttonForPickerForFonts
    func createButtonForPickerFonts(view:UIViewController) {
        buttonForPickerFonts.frame = CGRect(x: 165, y: 150, width: 60, height: 50)
        buttonForPickerFonts.setTitle("FONT", for: .normal)
        buttonForPickerFonts.titleColor(for: .normal)
        buttonForPickerFonts.backgroundColor = .purple
        buttonForPickerFonts.layer.cornerRadius = 25
        buttonForPickerFonts.addTarget(self, action: #selector(callPickerForFonts), for: .touchUpInside)
        
    }
    

    //MARK: picker
    func createPicker(view:UIViewController) {
        fontPicker.contentMode = .center
        fontPicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.height - 300, width: UIScreen.main.bounds.size.width, height: 250)
        fontPicker.setValue(UIColor.purple, forKey: "textColor")
        fontPicker.isHidden = true
    }
    
    //MARK: lifeCicle
    func updateLabel () {
        labelForText.textColor = color
        labelForText.shadowOffset = labelShadowOffset
        labelForText.shadowColor = colorForShadow
        labelForText.textAlignment = .center
        labelForText.numberOfLines = numberOfLines
        labelForText.lineBreakMode = lineBreakMode
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel()
    }
    
    //MARK: OBJC FUNCS
    
    @objc func changeText () {
        let alert = UIAlertController(title: "Enter the text", message: "put your text in field", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "Enter text"
            field.returnKeyType = .done
        }
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
            guard let text = alert.textFields?.first?.text else {return}
            self.labelForText.text = text
        }))
        alert.addAction(UIAlertAction(title: "Cansel", style: .cancel))
        present(alert, animated: true)
    }
    @objc func onDoneButton() {
        labelForText.endEditing(true)
    }
    
    
    
    @objc func changeSizeOfLabel() {
        labelForText.font = labelForText.font.withSize(CGFloat(fontSizeSlider.value))
        labelForText.center = view.center
    }
    @objc func callPickerForFonts() {
        if fontPicker.isHidden {
            fontPicker.isHidden = false
            fontToolBar.isHidden = false
        } else {
            fontPicker.isHidden = true
            fontToolBar.isHidden = true
        }
    }
    @objc func onDone() {
        fontPicker.isHidden = false
        fontPicker.isHidden = false
    }
    @objc func onDoneButtonTapped() {
        labelText.endEditing(true)
       
    }
}

extension TextViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontsArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontsArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelForText.font = UIFont(name: fontsArray[row], size: self.labelForText.font.pointSize)
        labelText.text = fontsArray[row]
        changeSizeOfLabel()
    }
    
}

var fontsArray = ["Zapfino","Tahoma", "Palatino Linotype", "Georgia","Courier New"]

