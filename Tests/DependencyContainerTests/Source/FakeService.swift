//
//  FakeService.swift
//
//
//  Created by 김인섭 on 12/3/23.
//

import Foundation

struct FakeA_Serivce: A_Serviceable {
    func fetch() -> String {
        "Fake A Fetch"
    }
}

struct FakeB_Serivce: B_Serviceable {
    func fetch() -> String {
        "Fake B Fetch"
    }
}
