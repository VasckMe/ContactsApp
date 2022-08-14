//
//  CustomTableViewCell.swift
//  ContactsApp
//
//  Created by Apple Macbook Pro 13 on 13.08.22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var cellXIB = CustomCell()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static let identifier = "CustomTableViewCell"
    
    //MARK: Init code
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.bounds = cellXIB.frame
        contentView.addSubview(cellXIB)
    }
    
    //MARK: Fatal error func
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func refresh(sender: String) {
        cellXIB.infoLabel.text = sender
    }

}
