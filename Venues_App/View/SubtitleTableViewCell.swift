//
//  SubtitleTableViewCell.swift
//  Venues_App
//
//  Created by Jian Ting Li on 2/20/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        // super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        fatalError("init(coder:) has not been implemented")
    }
}
