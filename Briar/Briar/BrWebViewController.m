#import "BrWebViewController.h"

@interface BrWebViewController () <UIWebViewDelegate>

@end

@implementation BrWebViewController

- (id) init {
  self = [super init];
  if (self) {
    self.title = NSLocalizedString(@"Web", @"webview controller: tab bar button");
    self.tabBarItem.image = [UIImage imageNamed:@"first"];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.webView.delegate = self;

  NSString* htmlStr = @"<html><head><meta charset='utf-8'></meta></head><body><br /><br /><br /><br /><a name='top'></a><h1>Hi! You're on top!</h1><a id='link-to-bottom' href='#bottom'>Skip to bottom</a><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><a name='bottom'></a><h1>You've hit rock bottom.</h1><a id='link-to-top' href='#top'>Get back on top!</a><br /><br /><br /><br /><br /><br /><br /><br /></body></head>";

  [self.webView loadHTMLString:htmlStr baseURL:nil];
  self.view.accessibilityIdentifier = @"webViewPage";
}

- (void)loadRequestFromString:(NSString*)urlString {
  NSURL *url = [NSURL URLWithString:urlString];
  NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
  [self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

# pragma mark - UIWebViewDelegate methods

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
  NSLog(@"%@", error);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
  NSLog(@"Finished loading.");
}

@end
