//
//  CustomCollection.swift
//  BasicShopping
//
//  Created by castiel on 16/2/26.
//  Copyright © 2016年 castiel. All rights reserved.
//

import UIKit

class CustomCollection: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
   var collectionImage : UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.collectionImage = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        self.collectionImage!.image = UIImage(named: "collection")
        self.addSubview(collectionImage!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
