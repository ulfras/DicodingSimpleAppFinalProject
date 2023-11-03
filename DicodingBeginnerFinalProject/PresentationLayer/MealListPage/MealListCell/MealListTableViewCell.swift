//
//  MealListTableViewCell.swift
//  DicodingBeginnerFinalProject
//
//  Created by Maulana Frasha on 03/11/23.
//

import UIKit

class MealListTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageOutlet: UIImageView!
    @IBOutlet weak var cellLabelOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageOutlet.layer.cornerRadius = 16
        cellImageOutlet.backgroundColor = .systemGray6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
