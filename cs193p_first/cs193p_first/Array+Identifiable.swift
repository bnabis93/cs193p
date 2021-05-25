//
//  Array+Identifiable.swift
//  cs193p_first
//
//  Created by Hyeon Woo Jeong on 2021/05/26.
//

import Foundation

//MARK:-Extension of Array
extension Array where Element : Identifiable{
    func firstIndex (matching : Element) -> Int{
        for index in 0..<self.count{
            if self[index].id == matching.id{
                return index
            }
        }
        return 0 //TODO: bogus
    }
}
