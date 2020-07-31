//
//
// LayoutHelper.swift
//
// Created by Ringo Müller-Gromes on 31.07.20.
// Minimal Subset from https://github.com/nthies/NorthLib
// to simplify autolayout
// Copyright © 2020 Ringo Müller-Gromes. All rights reserved.
// 

import UIKit

// Mostly Auto-Layout related extensions
public extension UIView {
  
  /// Bottom anchor
  var bottom: LayoutAnchorY { return LayoutAnchorY(self, bottomAnchor) }
  /// Top anchor
  var top: LayoutAnchorY { return LayoutAnchorY(self, topAnchor) }
  /// Vertical center anchor
  var centerY: LayoutAnchorY { return LayoutAnchorY(self, centerYAnchor) }
  /// Left Anchor
  var left: LayoutAnchorX { return LayoutAnchorX(self, leftAnchor) }
  /// Right Anchor
  var right: LayoutAnchorX { return LayoutAnchorX(self, rightAnchor) }
  /// Horizontal center anchor
  var centerX: LayoutAnchorX { return LayoutAnchorX(self, centerXAnchor) }
  /// Width anchor
  var width: LayoutDimension { return LayoutDimension(self, widthAnchor) }
  /// Height anchor
  var height: LayoutDimension { return LayoutDimension(self, heightAnchor) }
  
  /// Bottom margin anchor
  func bottomGuide(isMargin: Bool = false) -> LayoutAnchorY {
    let guide = isMargin ? layoutMarginsGuide : safeAreaLayoutGuide
    return LayoutAnchorY(self, guide.bottomAnchor)
  }
  /// Top margin anchor
  func topGuide(isMargin: Bool = false) -> LayoutAnchorY {
    let guide = isMargin ? layoutMarginsGuide : safeAreaLayoutGuide
    return LayoutAnchorY(self, guide.topAnchor)
  }
  /// Left margin Anchor
  func leftGuide(isMargin: Bool = false) -> LayoutAnchorX {
    let guide = isMargin ? layoutMarginsGuide : safeAreaLayoutGuide
    return LayoutAnchorX(self, guide.leftAnchor)
  }
  /// Right margin Anchor
  func rightGuide(isMargin: Bool = false) -> LayoutAnchorX {
    let guide = isMargin ? layoutMarginsGuide : safeAreaLayoutGuide
    return LayoutAnchorX(self, guide.rightAnchor)
  }
  
  /// Pin height of view
  @discardableResult
  func pinHeight(_ height: CGFloat) -> NSLayoutConstraint {
    translatesAutoresizingMaskIntoConstraints = false
    let constraint = heightAnchor.constraint(equalToConstant: height)
    constraint.isActive = true
    return constraint
  }
}


// Layout anchors and corresponding views:
public struct LayoutAnchorX {
  public var anchor: NSLayoutXAxisAnchor
  public var view: UIView
  init(_ view: UIView, _ anchor: NSLayoutXAxisAnchor)
    { self.view = view; self.anchor = anchor }
}

public struct LayoutAnchorY {
  public var anchor: NSLayoutYAxisAnchor
  public var view: UIView
  init(_ view: UIView, _ anchor: NSLayoutYAxisAnchor)
    { self.view = view; self.anchor = anchor }
}

public struct LayoutDimension {
  public var anchor: NSLayoutDimension
  public var view: UIView
  init(_ view: UIView, _ anchor: NSLayoutDimension)
    { self.view = view; self.anchor = anchor }
}


/// Pin vertical anchor of one view to vertical anchor of another view
@discardableResult
public func pin(_ la: LayoutAnchorY, to: LayoutAnchorY,
  dist: CGFloat = 0) -> NSLayoutConstraint {
  la.view.translatesAutoresizingMaskIntoConstraints = false
  let constraint = la.anchor.constraint(equalTo: to.anchor, constant: dist)
  constraint.isActive = true
  return constraint
}

/// Pin horizontal anchor of one view to horizontal anchor of another view
@discardableResult
public func pin(_ la: LayoutAnchorX, to: LayoutAnchorX,
  dist: CGFloat = 0) -> NSLayoutConstraint {
  la.view.translatesAutoresizingMaskIntoConstraints = false
  let constraint = la.anchor.constraint(equalTo: to.anchor, constant: dist)
  constraint.isActive = true
  return constraint
}

/// Pin all edges of one view to the edges of another view
@discardableResult
public func pin(_ view: UIView, to: UIView, dist: CGFloat = 0) -> (top: NSLayoutConstraint,
  bottom: NSLayoutConstraint, left: NSLayoutConstraint, right: NSLayoutConstraint) {
  let top = pin(view.top, to: to.top, dist: dist)
  let bottom = pin(view.bottom, to: to.bottom, dist: -dist)
  let left = pin(view.left, to: to.left, dist: dist)
  let right = pin(view.right, to: to.right, dist: -dist)
  return (top, bottom, left, right)
}


// MARK: - pinnAll Helper
///borders Helper
/// Pin all edges, except one of one view to the edges of another view's safe layout guide
@discardableResult
public func pin(_ view: UIView, to: UIView, dist: CGFloat = 0, exclude: UIRectEdge? = nil) -> tblrConstrains {
  var top:NSLayoutConstraint?, left:NSLayoutConstraint?, bottom:NSLayoutConstraint?, right:NSLayoutConstraint?
  exclude != UIRectEdge.top ? top = pin(view.top, to: to.top, dist: dist) : nil
  exclude != UIRectEdge.left ? left = pin(view.left, to: to.left, dist: dist) : nil
  exclude != UIRectEdge.right ? right = pin(view.right, to: to.right, dist: -dist) : nil
  exclude != UIRectEdge.bottom ? bottom = pin(view.bottom, to: to.bottom, dist: -dist) : nil
  return (top, bottom, left, right)
}

@discardableResult
public func pin(_ view: UIView, toSafe: UIView, dist: CGFloat = 0, exclude: UIRectEdge? = nil) -> tblrConstrains {
  var top:NSLayoutConstraint?, left:NSLayoutConstraint?, bottom:NSLayoutConstraint?, right:NSLayoutConstraint?
  exclude != UIRectEdge.top ? top = pin(view.top, to: toSafe.topGuide(), dist: dist) : nil
  exclude != UIRectEdge.left ? left = pin(view.left, to: toSafe.leftGuide(), dist: dist) : nil
  exclude != UIRectEdge.right ? right = pin(view.right, to: toSafe.rightGuide(), dist: -dist) : nil
  exclude != UIRectEdge.bottom ? bottom = pin(view.bottom, to: toSafe.bottomGuide(), dist: -dist) : nil
  return (top, bottom, left, right)
}

public typealias tblrConstrains = (
top: NSLayoutConstraint?,
bottom: NSLayoutConstraint?,
left: NSLayoutConstraint?,
right: NSLayoutConstraint?)
