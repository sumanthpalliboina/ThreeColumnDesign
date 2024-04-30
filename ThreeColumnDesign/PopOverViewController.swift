//
//  PopOverViewController.swift
//  ThreeColumnDesign
//
//  Created by Palliboina on 30/04/24.
//

import UIKit

class PopOverViewController: UIViewController {

    var selected:ItemData.ID!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selected != nil {
            if let item = appData.selectedCategory?.items.first(where: {$0.id == selected}) {
                label1.text = "10 \(item.name) items provided"
                label2.text = "\(item.calories * 10) Calories"
            }
        }
        
        popoverPresentationController?.popoverLayoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
