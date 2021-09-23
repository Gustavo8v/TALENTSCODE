//
//  StaffDetailTableViewCell.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit

class StaffDetailTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameStaff: UILabel!
    @IBOutlet private weak var numberStaff: UILabel!
    
    static let identifier = "StaffDetailTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(data: StaffData){
        nameStaff.text = data.name
        numberStaff.text = data.numberStaff
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
