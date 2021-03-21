//
//  TransactionTableViewCell.swift
//  tcsAppJosePablo
//
//  Created by Jose Perez on 20/03/21.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var descCell: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var idLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // TransactionCell

}
