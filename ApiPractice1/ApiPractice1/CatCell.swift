//
//  CatCell.swift
//  ApiPractice1
//
//  Created by admin on 09/10/24.
//

import UIKit

class CatCell: UITableViewCell {

    @IBOutlet weak var idlabel: UILabel!
    @IBOutlet weak var urllabel: UILabel!
    @IBOutlet weak var widthlabel: UILabel!
    @IBOutlet weak var heightlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
