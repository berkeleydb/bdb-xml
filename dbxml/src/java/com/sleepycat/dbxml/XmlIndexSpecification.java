/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.39
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.sleepycat.dbxml;

public class XmlIndexSpecification {
  private long swigCPtr;
  protected boolean swigCMemOwn;

  protected XmlIndexSpecification(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(XmlIndexSpecification obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public void delete() /* no exception */ {
    if(swigCPtr != 0 && swigCMemOwn) {
	swigCMemOwn = false;
	dbxml_javaJNI.delete_XmlIndexSpecification(swigCPtr);
    }
    swigCPtr = 0;
 }

  public void addIndex(String uri, String name, int type, int syntax) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_addIndex__SWIG_0(swigCPtr, this, uri, name, type, syntax);
  }

  public void addIndex(String uri, String name, String index) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_addIndex__SWIG_1(swigCPtr, this, uri, name, index);
  }

  public void deleteIndex(String uri, String name, int type, int syntax) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_deleteIndex__SWIG_0(swigCPtr, this, uri, name, type, syntax);
  }

  public void deleteIndex(String uri, String name, String index) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_deleteIndex__SWIG_1(swigCPtr, this, uri, name, index);
  }

  public void replaceIndex(String uri, String name, int type, int syntax) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_replaceIndex__SWIG_0(swigCPtr, this, uri, name, type, syntax);
  }

  public void replaceIndex(String uri, String name, String index) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_replaceIndex__SWIG_1(swigCPtr, this, uri, name, index);
  }

  public void addDefaultIndex(int type, int syntax) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_addDefaultIndex__SWIG_0(swigCPtr, this, type, syntax);
  }

  public void addDefaultIndex(String index) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_addDefaultIndex__SWIG_1(swigCPtr, this, index);
  }

  public void deleteDefaultIndex(int type, int syntax) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_deleteDefaultIndex__SWIG_0(swigCPtr, this, type, syntax);
  }

  public void deleteDefaultIndex(String index) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_deleteDefaultIndex__SWIG_1(swigCPtr, this, index);
  }

  public void replaceDefaultIndex(int type, int syntax) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_replaceDefaultIndex__SWIG_0(swigCPtr, this, type, syntax);
  }

  public void replaceDefaultIndex(String index) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_replaceDefaultIndex__SWIG_1(swigCPtr, this, index);
  }

  public void reset() throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_reset(swigCPtr, this);
  }

  public boolean getAutoIndexing() throws XmlException {
    return dbxml_javaJNI.XmlIndexSpecification_getAutoIndexing(swigCPtr, this);
  }

  public void setAutoIndexing(boolean value) throws XmlException {
    dbxml_javaJNI.XmlIndexSpecification_setAutoIndexing(swigCPtr, this, value);
  }

  public XmlIndexDeclaration find(String uri, String name) throws XmlException { return dbxml_javaJNI.XmlIndexSpecification_find(swigCPtr, this, uri, name); }

  public XmlIndexDeclaration next() throws XmlException { return dbxml_javaJNI.XmlIndexSpecification_next(swigCPtr, this); }

  public String getDefaultIndex() throws XmlException {
    return dbxml_javaJNI.XmlIndexSpecification_getDefaultIndex(swigCPtr, this);
  }

  public static int getValueType(String index) throws XmlException {
    return dbxml_javaJNI.XmlIndexSpecification_getValueType(index);
  }

  public final static int UNIQUE_OFF = 0x00000000;
  public final static int UNIQUE_ON = 0x10000000;
  public final static int PATH_NONE = 0x00000000;
  public final static int PATH_NODE = 0x01000000;
  public final static int PATH_EDGE = 0x02000000;
  public final static int NODE_NONE = 0x00000000;
  public final static int NODE_ELEMENT = 0x00010000;
  public final static int NODE_ATTRIBUTE = 0x00020000;
  public final static int NODE_METADATA = 0x00030000;
  public final static int KEY_NONE = 0x00000000;
  public final static int KEY_PRESENCE = 0x00000100;
  public final static int KEY_EQUALITY = 0x00000200;
  public final static int KEY_SUBSTRING = 0x00000300;

}
