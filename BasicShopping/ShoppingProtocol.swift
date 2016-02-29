//
//  ShoppingProtocol.swift
//  BasicShopping
//
//  Created by castiel on 16/2/24.
//  Copyright © 2016年 castiel. All rights reserved.
//

import Foundation

protocol ShoppingProtocol {
    func AddProductToShopping(navigationBar : UINavigationItem, code : Int , origin : CGRect)
    
    func AddProductToCollection(navigationBar : UINavigationItem)
}