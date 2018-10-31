//
//  ToDoTableViewCell.swift
//  ToDoApp
//
//  Created by Tosin Omotoyinbo on 10/31/18.
//  Copyright © 2018 Tosin Omotoyinbo. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func completeTodo(_ sender: Any) {
    }
    @IBAction func deleteTodo(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
