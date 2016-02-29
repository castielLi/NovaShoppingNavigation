//
//  ShoppingNavigation.swift
//  BasicShopping
//
//  Created by castiel on 16/2/24.
//  Copyright © 2016年 castiel. All rights reserved.
//

import UIKit

class ShoppingNavigation: UINavigationController , ShoppingProtocol , NavigationRegisterProtocol {
    
    
    /// 贝塞尔曲线
    private var path: UIBezierPath?
    
    var shoppingNavigationItem : UINavigationItem?
    
    /// 自定义图层
    var layer: CALayer?
    
    lazy var tap : UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: "ShoppingCarClick:")
        return tap
    }()
    
    lazy var collectionTap : UITapGestureRecognizer = {
        let collectionTap = UITapGestureRecognizer(target: self, action: "CollectionClick:")
        return collectionTap
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ShoppingCarClick(sender : UITapGestureRecognizer){
        print("Click shopping cart")
    }
    
    func CollectionClick(sender : UITapGestureRecognizer){
        print("Click collection")
       
    }
    
    internal func AddProductToShopping(navigationBar : UINavigationItem,code : Int , origin : CGRect){
        //通用 - 添加商品到购物车的
        print("Add product in shopping cart")

        startAnimation(origin,navigationBar: navigationBar)
    }
    
    func AddProductToCollection(navigationBar : UINavigationItem) {
        print("Add product in collection")
        
        startCollectionAnimation(navigationBar)
    }
    
    
    func RegisterBarButtonEvent(barButton : ShoppingNavBarButtonItem) {
        
        switch(barButton.Style){
        
        case NavigationButtonStyle.ShoppingCart :
            tap.numberOfTapsRequired = 1
            barButton.customView!.addGestureRecognizer(self.tap)
            break
        
        case NavigationButtonStyle.Collection:
            collectionTap.numberOfTapsRequired = 1
            barButton.customView!.addGestureRecognizer(self.collectionTap)
            break
        default : break

        }
        
    }
    
    
    
    
    
    
    
    
    
    //Animation
    
    /** 
     
     shopping collection animation
     
     */
    
    private func startCollectionAnimation( navigationBar : UINavigationItem){
        
        
        if self.shoppingNavigationItem!.rightBarButtonItems == nil {
            return
        }
        
        for barButton in self.shoppingNavigationItem!.rightBarButtonItems!{
        let item = barButton as! ShoppingNavBarButtonItem
        
        if item.Style == NavigationButtonStyle.Collection{
        let customView = item.customView as! CustomCollection
                
        
        let bigAnimation = CABasicAnimation(keyPath: "transform.scale")
        bigAnimation.duration = 0.2
        bigAnimation.fromValue = 1
        bigAnimation.toValue = 1.3
        bigAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        // 缩小动画
        let smallAnimation = CABasicAnimation(keyPath: "transform.scale")
        smallAnimation.beginTime = 0.2
        smallAnimation.duration = 0.2
        smallAnimation.fromValue = 1.3
        smallAnimation.toValue = 1
        smallAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        // 组动画
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [bigAnimation, smallAnimation]
        groupAnimation.duration = 0.4
        groupAnimation.removedOnCompletion = false
        groupAnimation.fillMode = kCAFillModeForwards
        groupAnimation.delegate = self
        customView.layer.addAnimation(groupAnimation, forKey: "CollectionAnimation")
            }
        }

    }
    
    /**
      shopping cart animation
    */
    private func startAnimation(rect: CGRect , navigationBar : UINavigationItem) {
        if layer == nil {
            layer = CALayer()
            let iconView = UIImageView(frame: CGRect(origin: rect.origin, size: CGSize(width: 50, height: 50)))
            iconView.image = UIImage(named: "button_cart")
            layer?.contents = iconView.layer.contents
            layer?.contentsGravity = kCAGravityResizeAspectFill
            layer?.frame = CGRect(origin: rect.origin, size: CGSize(width: 50, height: 50))
            layer?.position = CGPoint(x: iconView.center.x, y: iconView.center.y)
            UIApplication.sharedApplication().keyWindow?.layer.addSublayer(layer!)
            
            path = UIBezierPath()
            path!.moveToPoint(layer!.position)
            path!.addQuadCurveToPoint(CGPoint(x: UIScreen.mainScreen().bounds.width - 48, y: 40), controlPoint: CGPoint(x: UIScreen.mainScreen().bounds.width * 0.5, y: rect.origin.y - 80))
        }
        
        // 组动画
        groupAnimation()
    }
    
    /**
     组动画，帧动画抛入购物车，并放大、缩小图层增加点动效。
     */
    private func groupAnimation() {
        
        // 帧动画
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path!.CGPath
        animation.rotationMode = kCAAnimationRotateAuto
        
        // 放大动画
        let bigAnimation = CABasicAnimation(keyPath: "transform.scale")
        bigAnimation.duration = 0.5
        bigAnimation.fromValue = 1
        bigAnimation.toValue = 2
        bigAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        // 缩小动画
        let smallAnimation = CABasicAnimation(keyPath: "transform.scale")
        smallAnimation.beginTime = 0.5
        smallAnimation.duration = 1
        smallAnimation.fromValue = 2
        smallAnimation.toValue = 0.3
        smallAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        // 组动画
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [animation, bigAnimation, smallAnimation]
        groupAnimation.duration = 1.5
        groupAnimation.removedOnCompletion = false
        groupAnimation.fillMode = kCAFillModeForwards
        groupAnimation.delegate = self
        layer?.addAnimation(groupAnimation, forKey: "groupAnimation")
    }


    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        // 如果动画是我们的组动画，才开始一些操作
        if anim == layer?.animationForKey("groupAnimation") {
            
            // 隐藏图层
            layer?.removeAllAnimations()
            layer?.removeFromSuperlayer()
            layer = nil
            
            print(self.navigationItem)
            
            // 添加判断购物车是否为空的代码
            
            if self.shoppingNavigationItem!.rightBarButtonItems == nil {
                return
            }
            
            for barButton in self.shoppingNavigationItem!.rightBarButtonItems!{
                let item = barButton as! ShoppingNavBarButtonItem
                
                if item.Style == NavigationButtonStyle.ShoppingCart{
                    let customView = item.customView as! CustomShoppingCart
                    customView.shoppingCount.hidden = false
                    
                    
                    // 商品数量渐出  这里的动画是不需要的
                    let goodCountAnimation = CATransition()
                    goodCountAnimation.duration = 0.25
                    customView.shoppingCount.text = "1"
                    customView.shoppingCount.layer.addAnimation(goodCountAnimation, forKey: nil)
                    
                    // 购物车抖动
                    let cartAnimation = CABasicAnimation(keyPath: "transform.translation.y")
                    cartAnimation.duration = 0.25
                    cartAnimation.fromValue = -5
                    cartAnimation.toValue = 5
                    cartAnimation.autoreverses = true
                    customView.shoppingCartImage.layer.addAnimation(cartAnimation, forKey: nil)
                    
                }
            }
        }else {
        
            for barButton in self.shoppingNavigationItem!.rightBarButtonItems!{
                let item = barButton as! ShoppingNavBarButtonItem
                
                if item.Style == NavigationButtonStyle.Collection{
                    let customView = item.customView as! CustomCollection
                    customView.layer.removeAllAnimations()
                }
            }
        }
        
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
