#line 1 "/Users/sumioka_air/USD/pxr/usd/lib/usdShade/input.h"
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
#ifndef USDSHADE_INPUT_H
#define USDSHADE_INPUT_H

#include "pxr/pxr.h"
#include "pxr/usd/usdShade/api.h"
#include "pxr/usd/usd/attribute.h"
#include "pxr/usd/usdShade/utils.h"

#include <vector>

PXR_NAMESPACE_OPEN_SCOPE

class UsdShadeConnectableAPI;
class UsdShadeOutput;

/// \class UsdShadeInput
/// 
/// This class encapsulates a shader or node-graph input, which is a 
/// connectable property representing a typed value.
/// 
class UsdShadeInput
{
public:
    /// Default constructor returns an invalid Input.  Exists for the sake of
    /// container classes
    UsdShadeInput()
    {
        // nothing
    }

    /// Get the name of the attribute associated with the Input. 
    /// 
    TfToken const &GetFullName() const { 
        return _attr.GetName(); 
    }

    /// Returns the name of the input. 
    /// 
    /// We call this the base name since it strips off the "inputs:" namespace 
    /// prefix from the attribute name, and returns it.
    /// 
    USDSHADE_API
    TfToken GetBaseName() const;

    /// Get the "scene description" value type name of the attribute associated 
    /// with the Input.
    /// 
    USDSHADE_API
    SdfValueTypeName GetTypeName() const;
    
    /// Get the prim that the input belongs to.
    UsdPrim GetPrim() const {
        return _attr.GetPrim();
    }

    /// Convenience wrapper for the templated UsdAttribute::Get().
    template <typename T>
    bool Get(T* value, UsdTimeCode time = UsdTimeCode::Default()) const {
        return GetAttr().Get(value, time);
    }

    /// Convenience wrapper for VtValue version of UsdAttribute::Get().
    USDSHADE_API
    bool Get(VtValue* value, UsdTimeCode time = UsdTimeCode::Default()) const;

    /// Set a value for the Input at \p time.
    /// 
    USDSHADE_API
    bool Set(const VtValue& value, 
             UsdTimeCode time = UsdTimeCode::Default()) const;

    /// \overload 
    /// Set a value of the Input at \p time.
    /// 
    template <typename T>
    bool Set(const T& value, UsdTimeCode time = UsdTimeCode::Default()) const {
        return _attr.Set(value, time);
    }

    /// Hash functor.
    struct Hash {
        inline size_t operator()(const UsdShadeInput &input) const {
            return hash_value(input._attr);
        }
    };

    /// \name Configuring the Input's Type
    /// @{

    /// Specify an alternative, renderer-specific type to use when
    /// emitting/translating this Input, rather than translating based
    /// on its GetTypeName()
    ///
    /// For example, we set the renderType to "struct" for Inputs that
    /// are of renderman custom struct types.
    ///
    /// \return true on success.
    ///
    USDSHADE_API
    bool SetRenderType(TfToken const& renderType) const;

    /// Return this Input's specialized renderType, or an empty
    /// token if none was authored.
    ///
    /// \sa SetRenderType()
    USDSHADE_API
    TfToken GetRenderType() const;

    /// Return true if a renderType has been specified for this Input.
    ///
    /// \sa SetRenderType()
    USDSHADE_API
    bool HasRenderType() const;

    /// @}

    // ---------------------------------------------------------------
    /// \name UsdAttribute API
    // ---------------------------------------------------------------

    /// @{

    typedef const UsdAttribute UsdShadeInput::*_UnspecifiedBoolType;

    /// Speculative constructor that will produce a valid UsdShadeInput when
    /// \p attr already represents a shade Input, and produces an \em invalid 
    /// UsdShadeInput otherwise (i.e. \ref UsdShadeInput_bool_type 
    /// "unspecified-bool-type()" will return false).
    USDSHADE_API
    explicit UsdShadeInput(const UsdAttribute &attr);

    /// Test whether a given UsdAttribute represents a valid Input, which
    /// implies that creating a UsdShadeInput from the attribute will succeed.
    ///
    /// Success implies that \c attr.IsDefined() is true.
    USDSHADE_API
    static bool IsInput(const UsdAttribute &attr);

    /// Test if this name has a namespace that indicates it could be an
    /// input.
    USDSHADE_API
    static bool IsInterfaceInputName(const std::string & name);

    /// Explicit UsdAttribute extractor.
    const UsdAttribute &GetAttr() const { return _attr; }

    /// Allow UsdShadeInput to auto-convert to UsdAttribute, so you can
    /// pass a UsdShadeInput to any function that accepts a UsdAttribute or
    /// const-ref thereto.
    operator const UsdAttribute & () const { return GetAttr(); }

    /// Return true if the wrapped UsdAttribute is defined, and in addition the 
    /// attribute is identified as an input.
    bool IsDefined() const {
        return _attr && IsInput(_attr);
    }

    /// Set documentation string for this Input.
    /// \sa UsdObject::SetDocumentation()
    USDSHADE_API
    bool SetDocumentation(const std::string& docs) const;

    /// Get documentation string for this Input.
    /// \sa UsdObject::GetDocumentation()
    USDSHADE_API
    std::string GetDocumentation() const;

    /// Set the displayGroup metadata for this Input,  i.e. hinting for the
    /// location and nesting of the attribute.
    /// \sa UsdProperty::SetDisplayGroup(), UsdProperty::SetNestedDisplayGroup()
    USDSHADE_API
    bool SetDisplayGroup(const std::string& displayGroup) const;

    /// Get the displayGroup metadata for this Input, i.e. hint for the location 
    /// and nesting of the attribute.
    /// \sa UsdProperty::GetDisplayGroup(), UsdProperty::GetNestedDisplayGroup()
    USDSHADE_API
    std::string GetDisplayGroup() const;

    /// @}

    /// Return true if this Input is valid for querying and authoring
    /// values and metadata, which is identically equivalent to IsDefined().
    explicit operator bool() { 
        return IsDefined(); 
    }

    /// Equality comparison. Returns true if \a lhs and \a rhs represent the 
    /// same UsdShadeInput, false otherwise.
    friend bool operator==(const UsdShadeInput &lhs, const UsdShadeInput &rhs) {
        return lhs.GetAttr() == rhs.GetAttr();
    }

    // -------------------------------------------------------------------------
    /// \name Connections API
    // -------------------------------------------------------------------------
    /// @{

    /// Determines whether this Input can be connected to the given 
    /// source attribute, which can be an input or an output.
    /// 
    /// \sa UsdShadeConnectableAPI::CanConnect
    USDSHADE_API
    bool CanConnect(const UsdAttribute &source) const;

    /// \overload
    USDSHADE_API
    bool CanConnect(const UsdShadeInput &sourceInput) const;

    /// \overload
    USDSHADE_API
    bool CanConnect(const UsdShadeOutput &sourceOutput) const;

    /// Authors a connection for this Input to the source described by the 
    /// following three elements: 
    /// \p source, the connectable owning the source,
    /// \p sourceName, the name of the source and 
    /// \p sourceType, the value type of the source shading attribute.
    /// 
    /// \p typeName if specified, is the typename of the attribute to create 
    /// on the source if it doesn't exist. It is also used to validate whether 
    /// the types of the source and consumer of the connection are compatible.
    ///
    /// \sa UsdShadeConnectableAPI::ConnectToSource
    ///
    USDSHADE_API
    bool ConnectToSource(
        UsdShadeConnectableAPI const &source, 
        TfToken const &sourceName, 
        UsdShadeAttributeType const sourceType=UsdShadeAttributeType::Output,
        SdfValueTypeName typeName=SdfValueTypeName()) const;

    /// Authors a connection for this Input to the source at the given path.
    /// 
    /// \sa UsdShadeConnectableAPI::ConnectToSource
    ///
    USDSHADE_API
    bool ConnectToSource(SdfPath const &sourcePath) const;

    /// Connects this Input to the given input, \p sourceInput.
    /// 
    /// \sa UsdShadeConnectableAPI::ConnectToSource
    ///
    USDSHADE_API
    bool ConnectToSource(UsdShadeInput const &sourceInput) const;

    /// Connects this Input to the given output, \p sourceOutput.
    /// 
    /// \sa UsdShadeConnectableAPI::ConnectToSource
    ///
    USDSHADE_API
    bool ConnectToSource(UsdShadeOutput const &sourceOutput) const;

    /// Finds the source of a connection for this Input.
    /// 
    /// \p source is an output parameter which will be set to the source 
    /// connectable prim.
    /// \p sourceName will be set to the name of the source shading property, 
    /// which could be the parameter name, output name or the interface 
    /// attribute name. This does not include the namespace prefix associated 
    /// with the source type. 
    /// \p sourceType will have the value type of the source shading property.
    ///
    /// \return 
    /// \c true if this Input is connected to a valid, defined source.
    /// \c false if this Input is not connected to a single, valid source.
    /// 
    /// \note The python wrapping for this method returns a 
    /// (source, sourceName, sourceType) tuple if the parameter is connected, 
    /// else \c None
    ///
    /// \sa UsdShadeConnectableAPI::GetConnectedSource
    ///
    USDSHADE_API
    bool GetConnectedSource(UsdShadeConnectableAPI *source, 
                            TfToken *sourceName,
                            UsdShadeAttributeType *sourceType) const;

    /// Returns the "raw" (authored) connected source paths for this Input.
    /// 
    /// \sa UsdShadeConnectableAPI::GetRawConnectedSourcePaths
    ///
    USDSHADE_API
    bool GetRawConnectedSourcePaths(SdfPathVector *sourcePaths) const;

    /// Returns true if and only if this Input is currently connected to a 
    /// valid (defined) source. 
    ///
    /// \sa UsdShadeConnectableAPI::HasConnectedSource
    /// 
    USDSHADE_API
    bool HasConnectedSource() const;

    /// Returns true if the connection to this Input's source, as returned by 
    /// GetConnectedSource(), is authored across a specializes arc, which is 
    /// used to denote a base material.
    /// 
    /// \sa UsdShadeConnectableAPI::IsSourceConnectionFromBaseMaterial
    ///
    USDSHADE_API
    bool IsSourceConnectionFromBaseMaterial() const;

    /// Disconnect source for this Input.
    /// 
    /// \sa UsdShadeConnectableAPI::DisconnectSource
    ///
    USDSHADE_API
    bool DisconnectSource() const;

    /// Clears source for this shading property in the current UsdEditTarget.
    ///
    /// Most of the time, what you probably want is DisconnectSource()
    /// rather than this function.
    ///
    /// \sa UsdShadeConnectableAPI::ClearSource
    ///
    USDSHADE_API
    bool ClearSource() const;

    /// @}

    // -------------------------------------------------------------------------
    /// \name Connectability API
    // -------------------------------------------------------------------------
    /// @{
        
    /// \brief Set the connectability of the Input. 
    /// 
    /// In certain shading data models, there is a need to distinguish which 
    /// inputs <b>can</b> vary over a surface from those that must be 
    /// <b>uniform</b>. This is accomplished in UsdShade by limiting the 
    /// connectability of the input. This is done by setting the 
    /// "connectability" metadata on the associated attribute.
    /// 
    /// Connectability of an Input can be set to UsdShadeTokens->full or 
    /// UsdShadeTokens->interfaceOnly. 
    /// 
    /// \li <b>full</b> implies that  the Input can be connected to any other 
    /// Input or Output.  
    /// \li <b>interfaceOnly</b> implies that the Input can only be connected to 
    /// a NodeGraph Input (which represents an interface override, not a 
    /// render-time dataflow connection), or another Input whose connectability 
    /// is also "interfaceOnly".
    /// 
    /// The default connectability of an input is UsdShadeTokens->full.
    /// 
    /// \sa SetConnectability()
    USDSHADE_API
    bool SetConnectability(const TfToken &connectability) const;

    /// \brief Returns the connectability of the Input.
    /// 
    /// \sa SetConnectability()
    USDSHADE_API
    TfToken GetConnectability() const;

    /// \brief Clears any authored connectability on the Input.
    /// 
    USDSHADE_API
    bool ClearConnectability() const;

    /// @}

private:
    friend class UsdShadeConnectableAPI;

    // Constructor that creates a UsdShadeInput with the given name on the 
    // given prim.
    // \p name here is the unnamespaced name of the input.
    UsdShadeInput(UsdPrim prim,
                  TfToken const &name,
                  SdfValueTypeName const &typeName);
    
    UsdAttribute _attr;
};

PXR_NAMESPACE_CLOSE_SCOPE

#endif // USDSHADE_INPUT_H
