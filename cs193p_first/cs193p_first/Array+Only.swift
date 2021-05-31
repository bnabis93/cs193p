//
//  Array+Only.swift
//  cs193p_first
//
//  Created by Hyeon Woo Jeong on 2021/06/01.
//

import Foundation

extension Array{
    var only :Element?{
        count == 1 ? first : nil
    }
}
