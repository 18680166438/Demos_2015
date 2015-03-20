//
//  Shader.fsh
//  OpenGLDemo
//
//  Created by wanshaofa on 15/3/12.
//  Copyright (c) 2015年 enuke. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
