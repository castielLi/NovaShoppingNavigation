//
//  CustomShoppingCar.swift
//  BasicShopping
//
//  Created by castiel on 16/2/24.
//  Copyright © 2016年 castiel. All rights reserved.
//

import UIKit

class CustomShoppingCart: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    lazy var shoppingCartImage : UIImageView = {
        
        let shoppingCartImage = UIImageView()
        shoppingCartImage.image = UIImage(named: "button_cart")
        return shoppingCartImage
    }()
    
    lazy var shoppingCount : UILabel = {
       
        let shoppingCount = UILabel()
        shoppingCount.layer.cornerRadius = 8
        shoppingCount.layer.borderColor = UIColor.redColor().CGColor
        shoppingCount.layer.borderWidth = 1.5
        shoppingCount.textColor = UIColor.redColor()
        shoppingCount.textAlignment = NSTextAlignment.Center
        shoppingCount.font = UIFont.systemFontOfSize(10)
        shoppingCount.hidden = true
        return shoppingCount
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(shoppingCartImage)
        self.shoppingCartImage.mas_makeConstraints{ make in
          make.width.equalTo()(30)
          make.height.equalTo()(30)
          make.centerX.equalTo()(self.mas_centerX)
          make.centerY.equalTo()(self.mas_centerY)
        }
        self.addSubview(shoppingCount)
        self.shoppingCount.mas_makeConstraints{ make in
            make.width.equalTo()(16)
            make.height.equalTo()(16)
            make.top.equalTo()(self.shoppingCartImage.mas_top).with().offset()(-5)
            make.left.equalTo()(self.shoppingCartImage.mas_right).offset()(-8)
                    }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
