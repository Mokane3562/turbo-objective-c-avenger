//
//  ViewController.m
//  SolarSystem
//
//  Created by Michael Nolan John Singleton on 2015-03-14.
//  Student Number: 201103561
//  Copyright (c) 2015 mnjs51. All rights reserved.
//

#import "ViewController.h"
#import "SphereModel.h"
#import "ImageTexture.h"

@interface ViewController () {
    CGPoint _rotation[6];
    
    SphereModel *_earthModel;
    ImageTexture *_earthTexture;
    
    SphereModel *_sunModel;
    ImageTexture *_sunTexture;
    
    SphereModel *_moonModel;
    ImageTexture *_moonTexture;
    
    SphereModel *_marsModel;
    ImageTexture *_marsTexture;
    
    SphereModel *_mercuryModel;
    ImageTexture *_mercuryTexture;
    
    SphereModel *_venusModel;
    ImageTexture *_venusTexture;
}
@property (strong, nonatomic) EAGLContext *context;

- (void)setupGL;
- (void)tearDownGL;
- (void)setupOrthographicView: (CGSize)size;

@end

@implementation ViewController

const float EARTH_RADIUS = 1;
const float AU = 10;
const float EARTH_DAY = 100;
const float EARTH_YEAR =36.5;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    
    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    
    [self setupGL];
}

- (void)dealloc
{
    [self tearDownGL];
    
    if ([EAGLContext currentContext] == self.context) {
        [EAGLContext setCurrentContext:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    if ([self isViewLoaded] && ([[self view] window] == nil)) {
        self.view = nil;
        
        [self tearDownGL];
        
        if ([EAGLContext currentContext] == self.context) {
            [EAGLContext setCurrentContext:nil];
        }
        self.context = nil;
    }
}

- (void)update
{
    [self setupOrthographicView: self.view.bounds.size];
    
    _rotation[0].x += self.timeSinceLastUpdate *(EARTH_DAY/3);
    
    _rotation[1].x += self.timeSinceLastUpdate *EARTH_DAY;
    _rotation[1].y += self.timeSinceLastUpdate *EARTH_YEAR;
    
    _rotation[2].x += self.timeSinceLastUpdate *(EARTH_DAY/2);
    _rotation[2].y += self.timeSinceLastUpdate *((1/0.240)*EARTH_YEAR);
    
    _rotation[3].x -= self.timeSinceLastUpdate *(EARTH_DAY/4);
    _rotation[3].y += self.timeSinceLastUpdate *((1/0.615)*EARTH_YEAR);
    
    _rotation[4].y += self.timeSinceLastUpdate *((1/0.1748)*EARTH_YEAR);
    
    _rotation[5].x += self.timeSinceLastUpdate *(EARTH_DAY);
    _rotation[5].y += self.timeSinceLastUpdate *((1/1.881)*EARTH_YEAR);
}

- (void)setupGL
{
    [EAGLContext setCurrentContext:self.context];
    
    _earthModel = [[SphereModel alloc] init:16];
    _earthTexture = [[ImageTexture alloc] initFrom:@"earth.png"];
    _rotation[0].x = 0, _rotation[0].y = 0;
    
    _sunModel = [[SphereModel alloc] init:16];
    _sunTexture = [[ImageTexture alloc] initFrom:@"sun.png"];
    _rotation[1].x = 0, _rotation[1].y = 0;
    
    _moonModel = [[SphereModel alloc] init:16];
    _moonTexture = [[ImageTexture alloc] initFrom:@"moon.png"];
    _rotation[2].x = 0, _rotation[2].y = 0;
    
    _marsModel = [[SphereModel alloc] init:16];
    _marsTexture = [[ImageTexture alloc] initFrom:@"Mars.png"];
    _rotation[3].x = 0, _rotation[3].y = 0;
    
    _mercuryModel = [[SphereModel alloc] init:16];
    _mercuryTexture = [[ImageTexture alloc] initFrom:@"Mercury.png"];
    _rotation[4].x = 0, _rotation[4].y = 0;
    
    _venusModel = [[SphereModel alloc] init:16];
    _venusTexture = [[ImageTexture alloc] initFrom:@"Venus.png"];
    _rotation[5].x = 0, _rotation[5].y = 0;
    
    glEnable(GL_CULL_FACE);
    glCullFace(GL_BACK);
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LEQUAL);
    
    glClearColor(0, 0, 0, 0);
    glClearDepthf(1);
    
    [self setupLights];
}

- (void)tearDownGL
{
    [EAGLContext setCurrentContext:self.context];
}

- (void)setupLights
{
    GLfloat sunPosition[] = {0, 0, 15, 5};
    
    float white[] = {1, 1, 1, 1};
    float grey[] = {.5, .5, .5, 1};
    
    glLightModelf(GL_LIGHT_MODEL_TWO_SIDE, GL_FALSE);
    glLightModelfv(GL_LIGHT_MODEL_AMBIENT, grey);
    
    glEnable(GL_LIGHT0);
    glLightfv(GL_LIGHT0, GL_POSITION, sunPosition);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, white);
    glLightfv(GL_LIGHT0, GL_SPECULAR, white);
    glLightfv(GL_LIGHT0, GL_AMBIENT, grey);
    
    float diffuse[] = {.9, .9, .9, 1};
    float specular[] = {.1, .1, .1, 1};
    glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, diffuse);
    glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, specular);
    glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, 5);
    
}

- (void)setupOrthographicView: (CGSize)size
{
    glViewport(0, 0, size.width, size.height);
    float min = MIN(size.width, size.height);
    float width = 12 * size.width / min;
    float height = 12 * size.height / min;
    
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrthof(-width, width, -height, height, -2, 2);
}

#pragma mark - GLKView and GLKViewController delegate methods

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnableClientState(GL_VERTEX_ARRAY);
    
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    
    glEnable(GL_LIGHTING);
    glPushMatrix(); {
        glScalef(EARTH_RADIUS*2, EARTH_RADIUS*2, EARTH_RADIUS*2);
        glRotatef(_rotation[0].x, 0, 0, 1);
        [_sunTexture bind];
        [_sunModel drawOpenGLES1];
    }
    glPopMatrix();
    glPushMatrix(); {
        glRotatef(_rotation[2].y, 0, 0, 1);
        glTranslatef(0, AU*.387, 0);
        glRotatef(_rotation[2].x, 0, 0, 1);
        glScalef(EARTH_RADIUS*.383, EARTH_RADIUS*.383, EARTH_RADIUS*.383);
        [_mercuryTexture bind];
        [_mercuryModel drawOpenGLES1];
    }
    glPopMatrix();
    glPushMatrix(); {
        glRotatef(_rotation[3].y, 0, 0, 1);
        glTranslatef(0, AU*.723, 0);
        glRotatef(_rotation[3].x, 0, 0, 1);
        glScalef(EARTH_RADIUS*.950, EARTH_RADIUS*.950, EARTH_RADIUS*.950);
        [_venusTexture bind];
        [_venusModel drawOpenGLES1];
    }
    glPopMatrix();
    glPushMatrix(); {
        glScalef(EARTH_RADIUS, EARTH_RADIUS, EARTH_RADIUS);
        glRotatef(_rotation[1].y, 0, 0, 1);
        glTranslatef(0, AU, 0);
        glRotatef(_rotation[1].x, 0, 0, 1);
        [_earthTexture bind];
        [_earthModel drawOpenGLES1];
        glPushMatrix(); {
            glRotatef(_rotation[4].y, 0, 0, -1);
            glTranslatef(0, AU*.15, 0);
            glScalef(EARTH_RADIUS*.273, EARTH_RADIUS*.273, EARTH_RADIUS*.273);
            [_moonTexture bind];
            [_moonModel drawOpenGLES1];
        }
        glPopMatrix();
    }
    glPopMatrix();
    glPushMatrix(); {
        glRotatef(_rotation[5].y, 0, 0, 1);
        glTranslatef(0, AU*1.524, 0);
        glRotatef(_rotation[5].x, 0, 0, 1);
        glScalef(EARTH_RADIUS*.532, EARTH_RADIUS*.532, EARTH_RADIUS*.532);
        [_marsTexture bind];
        [_marsModel drawOpenGLES1];
    }
    glPopMatrix();
    
    glDisable(GL_LIGHTING);
}

@end
