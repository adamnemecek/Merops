//
// Created by sumioka-air on 2018/05/05.
// Copyright (c) 2018 sho sumioka. All rights reserved.
//

//#include <MaterialXCore/Document.h>
//
//namespace mx = MaterialX;
//
//@implementation MaterialXModel
//- (void)setTexture:(id <MTLDevice>)device {
//
//}


//
//// Create a document.
//mx::DocumentPtr doc = mx::createDocument();
//// Create a node graph with a single image node and output.
//mx::NodeGraphPtr nodeGraph = doc->addNodeGraph();
//mx::NodePtr image = nodeGraph->addNode("image");
//image->setParameterValue("file", "image1.tif", "filename");
//mx::OutputPtr output = nodeGraph->addOutput();
//output->setConnectedNode(image);
//// Create a simple shader interface.
//mx::NodeDefPtr shader = doc->addNodeDef("shader1", "surfaceshader", "simpleSrf");
//mx::InputPtr diffColor = shader->setInputValue("diffColor", mx::Color3(1.0));
//mx::InputPtr specColor = shader->setInputValue("specColor", mx::Color3(0.0));
//mx::ParameterPtr roughness = shader->setParameterValue("roughness", 0.25f);
//// Create a material that instantiates the shader.
//mx::MaterialPtr material = doc->addMaterial();
//mx::ShaderRefPtr shaderRef = material->addShaderRef("shaderRef1", "simpleSrf");
//// Bind roughness to a new value within this material.
//mx::BindParamPtr bindParam = shaderRef->addBindParam("roughness");
//bindParam->setValue(0.5f);
//// Display the value of roughness in the context of this material.
//cout << roughness->getBoundValue(material)->getValueString();
