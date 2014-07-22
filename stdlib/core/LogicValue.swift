//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2015 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//
// BooleanType
//===----------------------------------------------------------------------===//

public prefix func !<T : BooleanType>(a: T) -> Bool {
  return !a.boolValue
}

// Short circuiting logical operators.

// FIXME: these operators should be fully generic
// BLOCKED ON: <rdar://problem/13251236> [remapping bound function type not
// implemented yet (deduced closure types)].
//
// FIXME: the generic versions of these operators probably shouldn't
// be @transparent; ideally they will be overloaded with transparent
// bool-specific operators.  BLOCKED ON: <rdar://problem/11510876>
// [Implement overload resolution].

@transparent public
func &&(lhs: BooleanType, rhs: @autoclosure () -> BooleanType) -> Bool {
  return lhs.boolValue ? rhs().boolValue : false
}

@transparent public
func ||(lhs: BooleanType, rhs: @autoclosure () -> BooleanType) -> Bool {
  return lhs.boolValue ? true : rhs().boolValue
}
