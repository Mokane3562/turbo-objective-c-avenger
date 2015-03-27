//
//  SphereModel.h
//  Modeling
//
//  Created by Minglun Gong on 19/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//  This file copied from Lab 10 for use with Assignment 2

#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES2/glext.h>

// VBO attribute index
enum
{
	ATTRIB_POSITION,
	ATTRIB_NORMAL,
	ATTRIB_COLOR,
	ATTRIB_TEXCOORD,
	ATTRIB_TANGENT,
	ATTRIB_BITANGENT,

	NUM_ATTRIB
};

@interface SphereModel : NSObject

- (SphereModel*) init: (int) seg;
- (void)dealloc;
- (void)drawOpenGLES1;
- (void)drawOpenGLES2;
- (void)createVertexBufferObject;
- (void)createTangentVBO;

@end
