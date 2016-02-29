//
//  ShoppingNavBarButtonItem.swift
//  BasicShopping
//
//  Created by castiel on 16/2/26.
//  Copyright © 2016年 castiel. All rights reserved.
//

import UIKit

class ShoppingNavBarButtonItem: UIBarButtonItem {

    var shoppingDelegate : NavigationRegisterProtocol?
    
    var Style : NavigationButtonStyle = NavigationButtonStyle.Normal  {
        didSet{
            if self.Style != NavigationButtonStyle.Normal{
                 shoppingDelegate?.RegisterBarButtonEvent(self)
            }
        }
    }
    
    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
