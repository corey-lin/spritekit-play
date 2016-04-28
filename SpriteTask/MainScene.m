//
//  GameScene.m
//  SpriteTask
//
//  Created by coreylin on 4/24/16.
//  Copyright (c) 2016 coreylin. All rights reserved.
//

#import "MainScene.h"

@interface MainScene()
@property (nonatomic, strong) SKSpriteNode *main;
@property (nonatomic, copy) NSMutableArray *enemies;
@end

@implementation MainScene

#pragma mark - Properties

-(SKSpriteNode *)main {
  if(!_main) {
    _main = [SKSpriteNode spriteNodeWithImageNamed:@"Main"];
    _main.size = CGSizeMake(50, 50);
  }
  return _main;
}

-(NSMutableArray *)enemies {
  if(!_enemies) {
    _enemies = [NSMutableArray new];
    int numOfEnemies = 5 + rand() % 10;
    for(int i = 0; i < numOfEnemies; ++i) {
      SKSpriteNode *enemy = [SKSpriteNode spriteNodeWithImageNamed:@"Enemy"];
      enemy.size = CGSizeMake(50, 50);
      [_enemies addObject:enemy];
    }
  }
  return _enemies;
}

#pragma mark - Life Cycle

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
  self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  self.main.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
  [self addChild:self.main];
  
  CGRect superFrame = view.frame;
  CGRect centerArea = CGRectMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame), 50, 50);
  for (SKSpriteNode *enemy in self.enemies) {
    do {
      enemy.position = CGPointMake(rand() % (int)superFrame.size.width,
                                 rand() % (int)superFrame.size.height);
    } while(CGRectIntersectsRect(centerArea, CGRectMake(enemy.position.x, enemy.position.y, 50, 50)));
    [self addChild:enemy];
  }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  /* Called when a touch Ends */
  
  for (UITouch *touch in touches) {
    CGPoint location = [touch locationInNode:self];
    SKSpriteNode *bullet = [SKSpriteNode spriteNodeWithImageNamed:@"Bullet"];
    
    bullet.position = self.main.position;
    
    // Create the actions
    SKAction *action = [SKAction moveTo:location duration:1];
    SKAction * actionMoveDone = [SKAction removeFromParent];
    [bullet runAction:[SKAction sequence:@[action, actionMoveDone]]];
    [self addChild:bullet];
  }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
