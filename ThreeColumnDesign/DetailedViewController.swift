//
//  DetailedViewController.swift
//  ThreeColumnDesign
//
//  Created by Palliboina on 29/04/24.
//

import UIKit

//assign to secondary scene
class DetailedViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var picture: UIImageView!
    var selected:ItemData.ID!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Details"

        if selected == nil {
            if let item = appData.selectedCategory.items.first {
                selected = item.id
            }
        }
        
        if let item = appData.selectedCategory?.items.first(where: {$0.id == selected!}) {
            picture.image = UIImage(named:item.image)
            name.text = item.name
            calories.text = "Calories : \(item.calories)"
        }
                
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPicture" {
            let controller = segue.destination as! ModalSequeViewController
            controller.selected = selected
            
            if let sheet = controller.sheetPresentationController {
                sheet.detents = [.medium()]
            }
        }else if segue.identifier == "showpopover"{
            let controller = segue.destination as! PopOverViewController
            controller.selected = selected
            controller.popoverPresentationController?.delegate = self
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
//    @IBAction func showPopover(_ sender: UIButton) {
//        if let story = storyboard {
//            let controller = story.instantiateViewController(identifier:"PopOverScene") as! PopOverViewController
//            controller.modalPresentationStyle = .popover
//            controller.popoverPresentationController?.popoverLayoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//            controller.popoverPresentationController?.permittedArrowDirections = .down
//            controller.selected = selected
//            present(controller, animated: true, completion: nil)
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
