//
//  ViewController.swift
//  spaceXApi
//
//  Created by AbdulKadir Akkaş on 29.09.2021.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var patchImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    //MARK: - Properties
    private let manager = DataManager()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
   
        
        
    }
    
    
    //MARK: - Methods
    
    func fetchData () {
        manager.fetchData {[weak self] result in
            guard let this = self else {return}
            switch result {
            case .success(let dataModel) :
                this.updateView(with: dataModel)
            case .failure(let error) : print("DEBUG: \(error.localizedDescription)")
            }
        }
        
    }
    
    func updateView (with data: DataModel) {
        
        nameLabel.text = data.name
        detailsLabel.text = data.details
        DispatchQueue.main.async {
            let url =
                self.patchImage.sd_setImage(with: URL(string: data.links.patch.small), completed: nil)
        }
        
    }


}

