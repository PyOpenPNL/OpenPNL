/////////////////////////////////////////////////////////////////////////////
//                                                                         //
//                INTEL CORPORATION PROPRIETARY INFORMATION                //
//   This software is supplied under the terms of a license agreement or   //
//  nondisclosure agreement with Intel Corporation and may not be copied   //
//   or disclosed except in accordance with the terms of that agreement.   //
//       Copyright (c) 2003 Intel Corporation. All Rights Reserved.        //
//                                                                         //
//  File:      pnlContextPersistence.hpp                                   //
//                                                                         //
//  Purpose:   Persistence contexts                                        //
//                                                                         //
//  Author(s):                                                             //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////


#ifndef __PNLCONTEXTPERSISTENCE_HPP__
#define __PNLCONTEXTPERSISTENCE_HPP__

#ifndef __PNLCONTEXT_HPP__
#include "pnlContext.hpp"
#endif

PNL_BEGIN

// FORWARDS
class CXMLWriter;
class CXMLContainer;

class PNL_API CContextPersistence: public CContext
{
public:
    CContextPersistence() {}
    bool SaveAsXML(const std::string &filename) const;
    bool SaveViaWriter(CXMLWriter *writer) const;
    bool LoadXML(const std::string &filename);
    bool LoadXMLToContainer(CXMLContainer *container, const std::string &filename);
};

PNL_END

#endif // include guard
