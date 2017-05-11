//
//  ShowtimesViewController.swift
//  Cinebase
//
//  Created by Charles Moncada on 10/05/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

protocol ShowtimesViewControllerDelegate {
    func buytickets()
}

class ShowtimesViewController: UIViewController {

    var delegate: ShowtimesViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func handleBuyTicketsButton(_ sender: UIButton) {
        
        delegate.buytickets()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
