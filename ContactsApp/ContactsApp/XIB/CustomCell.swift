//
//  CustomCell.swift
//  ContactsApp
//
//  Created by Apple Macbook Pro 13 on 13.08.22.
//

import UIKit

final class CustomCell: UIView {

    @IBOutlet weak var infoLabel: UILabel!

    override init(frame: CGRect){
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
}

private extension CustomCell {
    func xibSetup() {
        guard let view = CustomCell.fromNib(withOwner: self) else {
            return
        }
        
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.backgroundColor = .clear
    }
    
}

extension CustomCell {
    static func fromNib<T: UIView>(withOwner: Any?) -> T? {
        let nib = UINib(nibName: String(describing: self), bundle: Bundle.main)
        
        if let v = nib.instantiate(withOwner: withOwner, options: nil)[0] as? T {
            return v
        } else {
            return nil
        }
    }
}
