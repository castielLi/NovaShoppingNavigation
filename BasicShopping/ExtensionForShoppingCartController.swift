//
//  ExtensionForShoppingCartController.swift
//  BasicShopping
//
//  Created by castiel on 16/2/25.
//  Copyright © 2016年 castiel. All rights reserved.
//

import Foundation

extension ShoppingCartController{
    
    func registerShoppingProtocol(){
        if (self.navigationController as? ShoppingNavigation) != nil {
            self.shoppingCartProtocol = self.navigationController as! ShoppingNavigation
        }
    }
    
    func registerShoppingCartEvent(sender : UIControl){
        sender.addTarget(self, action: "AddShoppingCartClick:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func registerCollectionOpreateEvent(sender : UIControl){
       sender.addTarget(self, action: "AddShoppingInCollection:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
    func AddShoppingCartClick(sender : UIControl){
       self.shoppingCartProtocol?.AddProductToShopping(sender.tag, origin: sender.frame)
    }
    
    func AddShoppingInCollection(sender : UIControl){
      self.shoppingCartProtocol?.AddProductToCollection()
    }
}