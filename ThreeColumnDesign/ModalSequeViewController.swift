//
//  ModalSequeViewController.swift
//  ThreeColumnDesign
//
//  Created by Palliboina on 30/04/24.
//

import UIKit

class ModalSequeViewController: UIViewController {
    
    var selected:ItemData.ID!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if selected != nil {
            if let item = appData.selectedCategory?.items.first(where: {$0.id == selected}) {
                imageView.image = UIImage(named: item.image)
                
//                if let sheet = sheetPresentationController {
//                    if sheet.detents == [.medium()] {
//                        imageView.contentMode = .scaleAspectFit
//                    }else{
//                        imageView.contentMode = .scaleAspectFill
//                    }
//                }
            }
        }
        
    }
    
    @IBAction func closeModal(_ sender: UIButton) {
        dismiss(animated: true,completion: nil)
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
