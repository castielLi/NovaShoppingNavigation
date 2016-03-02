//
//  ShoppingCartController.swift
//  BasicShopping
//
//  Created by castiel on 16/2/25.
//  Copyright © 2016年 castiel. All rights reserved.
//

import UIKit

class ShoppingCartController: UIViewController {
    
    var shoppingCartProtocol : ShoppingProtocol?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let navigation = self.navigationController as? ShoppingNavigation
        if navigation != nil{
           navigation!.shoppingNavigationItem = self.navigationItem
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if self.navigationItem.rightBarButtonItems != nil{
            for barButton in self.navigationItem.rightBarButtonItems!{
                let item = barButton as! ShoppingNavBarButtonItem
                item.shoppingDelegate = self.navigationController! as! ShoppingNavigation
            }
        }
        
        if self.navigationItem.leftBarButtonItems != nil{
            for barButton in self.navigationItem.leftBarButtonItems!{
                let item = barButton as! ShoppingNavBarButtonItem
                item.shoppingDelegate = self.navigationController! as! ShoppingNavigation
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerShoppingProtocol()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
