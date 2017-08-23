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
#ifndef ARCH_DEMANGLE_H
#define ARCH_DEMANGLE_H

#if !defined(__cplusplus)
#error This include file can only be included in C++ programs.
#endif

/// \file arch/demangle.h
/// \ingroup group_arch_Strings
/// Demangle C++ typenames generated by the \c typeid() facility.

#include "pxr/pxr.h"
#include "pxr/base/arch/api.h"
#include <string>
#include <typeinfo>
#include <typeindex>

PXR_NAMESPACE_OPEN_SCOPE

/// \addtogroup group_arch_Strings
///@{

/// Demangle RTTI-generated type name.
///
/// Given a variable \c v, the construct \c typeid(v).name() returns
/// the type-name of \c v; unfortunately, the returned type-name is
/// sometimes extremely encoded (otherwise known as "mangled").
/// \c ArchDemangle parses the passed in type-name \c typeName into a
/// readable form, and overwrites \c typeName.  If \c typeName
/// cannot be unmangled, the function returns \c false without altering
/// \c typeName. Otherwise \c true is returned.
ARCH_API bool ArchDemangle(std::string* typeName);

/// Return demangled RTTI-generated type name.
///
/// If \c typeName can be demangled, the function returns the demangled
/// string; otherwise, the function returns the empty string.
///
/// \see ArchDemangle()
inline std::string
ArchGetDemangled(const std::string& typeName)
{
    std::string r = typeName;
    if (ArchDemangle(&r))
        return r;
    return std::string();
}

/// Return demangled RTTI-generated type name.
///
/// Returns the demangled name associated with typeInfo (i.e. typeInfo.name()).
///
/// \see ArchDemangle()
/// \overload
inline std::string
ArchGetDemangled(const std::type_info& typeInfo) {
    return ArchGetDemangled(typeInfo.name());
}

/// Return demangled RTTI-generated type name.
///
/// Returns the demangled name associated with typeIndex (i.e. typeIndex.name()).
///
/// \see ArchDemangle()
/// \overload
inline std::string
ArchGetDemangled(const std::type_index& typeIndex) {
    return ArchGetDemangled(typeIndex.name());
}

/// Return demangled RTTI generated-type name.
///
/// Returns the demangled name of type T.
///
/// \see ArchDemangle()
/// \overload
template <typename T>
inline std::string
ArchGetDemangled() {
    return ArchGetDemangled(typeid(T).name());
}

///@}

/// \private
ARCH_API
void Arch_DemangleFunctionName(std::string* functionName);

PXR_NAMESPACE_CLOSE_SCOPE

#endif	// ARCH_DEMANGLE_H 
