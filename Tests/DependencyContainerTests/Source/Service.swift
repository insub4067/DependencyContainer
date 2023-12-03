//
//  Service.swift
//
//
//  Created by 김인섭 on 12/3/23.
//

import Foundation

struct A_Service: A_Serviceable {
    func fetch() -> String {
        "A Fetch"
    }
}

struct B_Service: B_Serviceable {
    func fetch() -> String {
        "B Fetch"
    }
}
