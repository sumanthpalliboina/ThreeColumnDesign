//
//  PrimaryCollectionViewController.swift
//  ThreeColumnDesign
//
//  Created by Palliboina on 29/04/24.
//

import UIKit

//assign to primary scene
class PrimaryCollectionViewController: UICollectionViewController,UIAdaptivePresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = UICollectionLayoutListConfiguration(appearance: .sidebar)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        collectionView.collectionViewLayout = layout
        
        prepareDataSource()
        prepareSnapshot()
        
    }
    
    func prepareDataSource(){
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell,Category.ID>{cell,indexPath,itemId in
            if let item = appData.categories.first(where: {$0.id == itemId}) {
                var config = cell.defaultContentConfiguration()
                config.text = item.name
                cell.contentConfiguration = config
            }
        }
        
        appData.dataSourceCategories = UICollectionViewDiffableDataSource<Sections,Category.ID>(collectionView: collectionView, cellProvider: {collectionView,indexPath,itemId in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemId)
        })
    }
    
    func prepareSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<Sections,Category.ID>()
        snapshot.appendSections([.main])
        snapshot.appendItems(appData.categories.map({$0.id}))
        appData.dataSourceCategories.apply(snapshot)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let categoryid = appData.dataSourceCategories.itemIdentifier(for: indexPath), let category = appData.categories.first(where: {$0.id == categoryid}) {
            if let controller = splitViewController?.viewController(for: .supplementary) as? SupplementaryCollectionViewController {
                appData.selectedCategory = category
                
                controller.prepareSnapshot()  //it will update the items with selected category items
                
                if splitViewController?.isCollapsed == true {
                    splitViewController?.show(.supplementary)
                }
            }
        }
    }
    
    //initialize and present storyboard scene from code
    @IBAction func showHelp(_ sender: UIBarButtonItem) {
        if let story = storyboard {
            if let controller = story.instantiateViewController(identifier: "HelpView") as? HelpViewController {
                controller.modalPresentationStyle = .formSheet
                
                //adpative presentation controller
                let presentation = controller.presentationController
                presentation?.delegate = self
                
                
                present(controller, animated: true, completion: nil)
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .fullScreen
    }
    
    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        
        var controller:IPhoneViewController!
        if style == .fullScreen {
            if let story = storyboard {
                controller = story.instantiateViewController(identifier: "showIphone") as? IPhoneViewController
            }
        }
        
        return controller
    }
    
}
