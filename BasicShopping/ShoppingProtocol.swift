//
//  ShoppingProtocol.swift
//  BasicShopping
//
//  Created by castiel on 16/2/24.
//  Copyright © 2016年 castiel. All rights reserved.
//

import Foundation

protocol ShoppingProtocol {
    func AddProductToShopping(code : Int , origin : CGRect)
    
    func AddProductToCollection()
}