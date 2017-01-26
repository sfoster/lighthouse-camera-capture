//
//  CatalogViewController.swift
//  Image Capture
//
//  Created by Sam Foster on 1/23/17.
//  Copyright © 2017 Foster. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {

    @IBOutlet weak var testButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func testButtonAction(_ sender: UIButton) {
        print("Button tapped");
        let isSame = sender == testButton
        print("Is same as testButton? \(isSame)")
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
