//
//  VideoCell.swift
//  VideoApp
//
//  Created by Nidhi.sharma3 on 07/11/21.
//

import UIKit

class VideoCell: UICollectionViewCell {
    @IBOutlet weak var imgTruck: LazyImageView?
    @IBOutlet weak var lblDate: UILabel?
    @IBOutlet weak var lblTime: UILabel?
    @IBOutlet weak var lblMemory: UILabel?
    
    @IBOutlet weak var ImgUpload: UIImageView?
    override func awakeFromNib() {

//       self.layoutIfNeeded()
//       layer.cornerRadius = 6.0
//       layer.masksToBounds = true

      }
}
