#import "ViewController.h"
#import "NPLSystemView.h"

@interface ViewController ()

@property (nonatomic) NPLSystemView *lSystemView;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    if (!self.lSystemView) {
        self.lSystemView = [[NPLSystemView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:self.lSystemView];
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
