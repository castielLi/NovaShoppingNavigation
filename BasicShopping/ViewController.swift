//
//  ViewController.swift
//  BasicShopping
//
//  Created by castiel on 16/2/24.
//  Copyright © 2016年 castiel. All rights reserved.
//

import UIKit

class ViewController: ShoppingCartController {
    
    lazy var productOne : UIButton = {
       let productOne = UIButton(frame: CGRect(x: 20, y: 100, width: 100, height: 50))
       productOne.setTitle("添加购物车", forState: UIControlState.Normal)
       productOne.backgroundColor = UIColor.purpleColor()
       productOne.tag = 1
       return productOne
    }()
    
    lazy var productTwo : UIButton = {
        let productTwo = UIButton(frame: CGRect(x: 20, y: 200, width: 100, height: 50))
        productTwo.setTitle("添加收藏", forState: UIControlState.Normal)
        productTwo.backgroundColor = UIColor.purpleColor()
        productTwo.tag = 2
        return productTwo
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.title = "ShoppingCart"
        
        
        let shoppingCartView = CustomShoppingCart(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let barButton = ShoppingNavBarButtonItem(customView: shoppingCartView)
        barButton.Style = NavigationButtonStyle.ShoppingCart
    
        
        let collectionButton = CustomCollection(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let collectionBarButton = ShoppingNavBarButtonItem(customView: collectionButton)
        collectionBarButton.Style = NavigationButtonStyle.Collection
        self.navigationItem.rightBarButtonItems = [collectionBarButton,barButton]
        
        
        print(self.navigationItem)
      
        self.registerShoppingCartEvent(productOne)
        self.registerCollectionOpreateEvent(productTwo)
        
        self.view.addSubview(productOne)
        self.view.addSubview(productTwo)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


