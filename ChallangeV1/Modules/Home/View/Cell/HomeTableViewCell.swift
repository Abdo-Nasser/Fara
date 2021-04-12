//
//  HomeTableViewCell.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    //OutLests
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(user: User){
        nameLabel.text = user.name
        cityLabel.text = user.address?.city ?? ""
        streetLabel.text = user.address?.street ?? ""
    }
}
