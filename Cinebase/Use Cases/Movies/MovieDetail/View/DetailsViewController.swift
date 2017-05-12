//
//  DetailsViewController.swift
//  Cinebase
//
//  Created by Charles Moncada on 10/05/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var overviewTextView: UITextView!
    
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overviewTextView.text = text
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
