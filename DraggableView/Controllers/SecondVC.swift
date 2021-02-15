//
//  SecondVC.swift
//  DraggableView
//
//  Created by Mohamed El-Naggar on 2/15/21.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var draggableView: DraggableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        draggableView.dismissDelegate = { [weak self] in
            self?.dismissViewController()
        }
    
    }

    
    @IBAction func dismissCurrent(_ sender: Any?) {
        dismissViewController()
    }
    
    func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }

}
