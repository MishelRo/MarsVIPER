//
//  AlertManager.swift
//  TestMarsSwinJectProject
//
//  Created by User on 06.03.2021.
//

import UIKit
class AlertManager{
    
    func getAlert(title: String, message: String, complession: @escaping()->() ) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {  _ in
            complession()}
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        return alert
    }
    
}
