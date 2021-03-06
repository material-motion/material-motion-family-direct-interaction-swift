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

import UIKit
import MaterialMotionRuntime

/**
 Observes changes from a pan, pinch, and rotation gesture recognizer in order to apply respective
 deltas to the target's center (pan) and transform (pinch, rotation).

 The target's anchorPoint will be updated when each of the gesture recognizers are initiated.

 Supported target types: UIView.

 Enables isUserInteractionEnabled on the target view.
 */
@objc(MDMDirectlyManipulable)
public final class DirectlyManipulable: NSObject, Plan {
  /** The pan gesture recognizer whose events will be observed. */
  public var panGestureRecognizer: UIPanGestureRecognizer

  /** The pinch gesture recognizer whose events will be observed. */
  public var pinchGestureRecognizer: UIPinchGestureRecognizer

  /** The rotation gesture recognizer whose events will be observed. */
  public var rotationGestureRecognizer: UIRotationGestureRecognizer

  /** Creates a plan with a new drag, pinch, and rotation gesture recognizer. */
  public convenience override init() {
    self.init(panGestureRecognizer: UIPanGestureRecognizer(),
              pinchGestureRecognizer: UIPinchGestureRecognizer(),
              rotationGestureRecognizer: UIRotationGestureRecognizer())
  }

  /** Events generated by the provided gesture recognizers will be observed. */
  public init(panGestureRecognizer: UIPanGestureRecognizer,
              pinchGestureRecognizer: UIPinchGestureRecognizer,
              rotationGestureRecognizer: UIRotationGestureRecognizer) {
    self.panGestureRecognizer = panGestureRecognizer
    self.pinchGestureRecognizer = pinchGestureRecognizer
    self.rotationGestureRecognizer = rotationGestureRecognizer
    super.init()
  }

  /** The performer that will fulfill this plan. */
  public func performerClass() -> AnyClass {
    return DirectlyManipulablePerformer.self
  }

  /** Returns a copy of this plan. */
  public func copy(with zone: NSZone? = nil) -> Any {
    return DirectlyManipulable(panGestureRecognizer: panGestureRecognizer,
                               pinchGestureRecognizer: pinchGestureRecognizer,
                               rotationGestureRecognizer: rotationGestureRecognizer)
  }
}
