/*
 Copyright 2016-present The Material Motion Authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import XCTest
import MaterialMotionRuntime
import MaterialMotionDirectManipulationFamily

class ComposedGestureTests: XCTestCase {
  func testCopyingAComposedPlan() {
    let originalPlan = DirectlyManipulable()
    let copiedPlan = originalPlan.copy()

    guard let castedCopy = copiedPlan as? DirectlyManipulable else {
      XCTFail("Copied plan should be of type DirectlyManipulable")
      return
    }

    XCTAssertNotEqual(originalPlan, castedCopy)
    XCTAssertEqual(originalPlan.panGestureRecognizer, castedCopy.panGestureRecognizer)
    XCTAssertEqual(originalPlan.pinchGestureRecognizer, castedCopy.pinchGestureRecognizer)
    XCTAssertEqual(originalPlan.rotationGestureRecognizer, castedCopy.rotationGestureRecognizer)
  }
}