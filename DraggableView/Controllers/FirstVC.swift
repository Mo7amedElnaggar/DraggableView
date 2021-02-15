//
//  FirstVC.swift
//  DraggableView
//
//  Created by Mohamed El-Naggar on 2/15/21.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func openDraggableView(_ sender: Any) {
        if let second = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC {
            second.modalPresentationStyle = .overCurrentContext
            
            self.present(second, animated: true, completion: nil)
        }
    }
    
}

