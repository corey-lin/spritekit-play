//
//  GameViewController.m
//  SpriteTask
//
//  Created by coreylin on 4/24/16.
//  Copyright (c) 2016 coreylin. All rights reserved.
//

#import "GameViewController.h"
#import "MainScene.h"

@implementation GameViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  srand((unsigned int)time(NULL));

  // Configure the view.
  SKView * skView = (SKView *)self.view;
  skView.showsFPS = YES;
  skView.showsNodeCount = YES;
  /* Sprite Kit applies additional optimizations to improve rendering performance */
  skView.ignoresSiblingOrder = YES;
  
  // Create and configure the main scene.
  MainScene *main = [MainScene sceneWithSize:skView.bounds.size];;
  main.scaleMode = SKSceneScaleModeAspectFill;
  
  // Present the main character.
  [skView presentScene:main];
}

- (BOOL)shouldAutorotate
{
  return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return UIInterfaceOrientationMaskAllButUpsideDown;
  } else {
      return UIInterfaceOrientationMaskAll;
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
  return YES;
}

@end
