//
//  ShoppingService.swift
//  BasicShopping
//
//  Created by castiel on 16/3/2.
//  Copyright © 2016年 castiel. All rights reserved.
//

import Foundation
import NovaNetworkingLib


class ShoppingService{
    
    var _restService:RESTService?
    
    init()
    {
        _restService = RESTService.sharedInstance();
    }
    
    
    func uploadLocation(longitude : Double , latitude : Double){
        
        let parameters = ["username":"18580168250","password":"111111"]
        
        _restService!.AFNetworkingPost("/api/account/login",parameters: parameters,completionHandler:{(result:ApiResult,data:AnyObject?) in
            print(result)
            if(result.success!)
            {
                print("service success")
                
            }else{
               
                print("service failed")
                
            }
        })
    }
    
    func getAll(handler:((result:ApiResult , data : AnyObject?) -> Void)?)
    {
        
        let parameters = ["version":"1.0.0"]
        
        _restService!.AFNetworkingPost("/api/position/getAll",parameters: parameters,completionHandler:{(result:ApiResult,data:AnyObject?) in
            if(result.success!)
            {
                
                handler!(result: result,data: nil)
            }else{
                handler!(result: result , data : nil)
            }
        })
    }
    
}