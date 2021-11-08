//
//  ViewController.swift
//  VideoApp
//
//  Created by Nidhi.sharma3 on 08/11/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cellId = "VideoCell"
    let inset: CGFloat = 10
    let minimumLineSpacing: CGFloat = 10
    let minimumInteritemSpacing: CGFloat = 10
    let cellsPerRow = 2
    
    var truck: [Truck]? = nil
    let dataResource: DataResource = DataResource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.contentInsetAdjustmentBehavior = .always
        let nib = UINib(nibName: cellId, bundle: nil)
            collectionView?.register(nib, forCellWithReuseIdentifier: cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Call API
        dataResource.getData { (_dataResponse) in

                    if(_dataResponse?.truck != nil)
                    {
                        self.truck = _dataResponse?.truck

                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }

                }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
   
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    //UICollectionView Delegates and datasource

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCell
        let truck = self.truck?[indexPath.row]
                cell.lblDate.text = truck?.date
                cell.lblTime.text = truck?.time
                cell.lblMemory.text = truck?.memory
                let truckImageUrl = URL(string: (truck?.image)!)!
                cell.imgTruck.loadImage(fromURL: truckImageUrl, placeHolderImage: "DummyImage.png")
            return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.truck?.count ?? 0
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return minimumLineSpacing
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return minimumInteritemSpacing
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let marginsAndInsets = inset * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
           let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
           return CGSize(width: itemWidth, height: itemWidth)
       }

       override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
           collectionView?.collectionViewLayout.invalidateLayout()
           super.viewWillTransition(to: size, with: coordinator)
       }
}
