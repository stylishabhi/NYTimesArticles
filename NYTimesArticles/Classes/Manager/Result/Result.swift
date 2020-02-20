//
//  Result.swift
//  NYTimesArticles
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    //For success case
    case success(T)
    
    //For failure case
    case failure(E)
}

