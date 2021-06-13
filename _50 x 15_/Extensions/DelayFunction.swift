//
//  DelayFunction.swift
//  _50 x 15_
//
//  Created by Miguel Alarcon on 11/6/21.
//

import Foundation

func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}
