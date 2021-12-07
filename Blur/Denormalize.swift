//
//  Denormalize.swift
//  Pix2Pix
//
//  Created by 間嶋大輔 on 2020/02/26.
//  Copyright © 2020 daisuke. All rights reserved.
//

import Foundation
import CoreML
import Accelerate

@objc(Denormalize) class Denormalize: NSObject, MLCustomLayer {
  required init(parameters: [String : Any]) throws {
    print(#function, parameters)
    super.init()
  }

  func setWeightData(_ weights: [Data]) throws {
    print(#function, weights)
  }

  func outputShapes(forInputShapes inputShapes: [[NSNumber]]) throws
       -> [[NSNumber]] {
    print(#function, inputShapes)
    return inputShapes
  }

  func evaluate(inputs: [MLMultiArray], outputs: [MLMultiArray]) throws {
    print(#function, inputs.count, outputs.count)
    print(inputs.count)
    print(inputs[0].count)
    for i in 0..<inputs.count {
      let input = inputs[i]
      let output = outputs[i]


      assert(input.shape == output.shape)

      for j in 0..<input.count {
        let x = input[j].int32Value
        if x == 15 {
            let y = 255
        // look familiar?
        output[j] = NSNumber(value: y)
        } else {
            let y = 0
                   // look familiar?
                   output[j] = NSNumber(value: y)
        }
      }
    }
  }
}
