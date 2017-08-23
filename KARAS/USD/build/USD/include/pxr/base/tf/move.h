#line 1 "/Users/sumioka_air/USD/pxr/base/lib/tf/move.h"
//
// Copyright 2016 Pixar
//
// Licensed under the Apache License, Version 2.0 (the "Apache License")
// with the following modification; you may not use this file except in
// compliance with the Apache License and the following modification to it:
// Section 6. Trademarks. is deleted and replaced with:
//
// 6. Trademarks. This License does not grant permission to use the trade
//    names, trademarks, service marks, or product names of the Licensor
//    and its affiliates, except as required to comply with Section 4(c) of
//    the License and to reproduce the content of the NOTICE file.
//
// You may obtain a copy of the Apache License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the Apache License with the above modification is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the Apache License for the specific
// language governing permissions and limitations under the Apache License.
//
#ifndef TF_MOVE_H
#define TF_MOVE_H

/// \file tf/move.h

#include "pxr/pxr.h"

#include <algorithm>

PXR_NAMESPACE_OPEN_SCOPE

/// A tag type used to indicate move semantics
enum TfMoveTagType {
    TfMoveTag
};

/// This function may be overloaded to optimize moving \a value to \a
/// location, allowing the arbitrary modification of \a value.  \a location is
/// a pointer to space correctly sized and aligned to store a \p T instance.
/// When this function is called no actual object of type \a T exists there.
/// Implementations should placement-new or otherwise create an object of type
/// \a T at that location.  This function is allowed to modify \a value in
/// order to move its contents to the new object created in \a location.  The
/// default implementation placement-news a value-initialized \p T instance in
/// \p location, then does an unqualified call to swap(*location, value).
template <class T>
void TfMoveTo(T *location, T &value) {
    using std::swap;
    new (location) T;
    swap(*location, value);
}

PXR_NAMESPACE_CLOSE_SCOPE

#endif // TF_MOVE_H
