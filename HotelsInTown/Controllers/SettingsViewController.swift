//
//  SettingsViewController.swift
//  HotelsInTown
//
//  Created by Arif Kunnath on 12/22/20.
//

import Foundation
import UIKit
class SettingsViewController: UIViewController {
    
    //MARK: Variables
    @IBOutlet weak var txtfielHostName: UITextField!
    @IBOutlet weak var txtfieldAPIkey: UITextField!
    
    //MARK: Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set textfield values
        txtfielHostName.text = UserDefaults.standard.value(forKey: baseURL) as? String
        txtfieldAPIkey.text = UserDefaults.standard.value(forKey: APIKey) as? String

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    //MARK: Tap Gesture Action
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        
        
        if let hostname = txtfielHostName.text, let apikey = txtfieldAPIkey.text {
            UserDefaults.standard.setValue(hostname, forKey:baseURL )
            UserDefaults.standard.setValue(apikey, forKey:apikey )
        }
        
        view.endEditing(true);
    }
}

//MARK: Textfield delegate Methods

extension SettingsViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        if textField.text != nil{
            switch textField {
            case txtfielHostName:
                UserDefaults.standard.setValue(textField.text, forKey:baseURL )
                break
            case txtfieldAPIkey:
                UserDefaults.standard.setValue(textField.text, forKey:APIKey )
                
                break
            default:
                break
            }
        }
        textField.resignFirstResponder()
        return true
    }
}
