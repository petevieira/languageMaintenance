#import <stdio.h>
#import "JSON.h"                // Open Source Objective-C JSON Framework by Stig Brautaset
#import "GoogleTranslateViewController.h"

@implementation GoogleTranslateViewController {
    @synthesize lastText = _lastText;


}

- (void)dealloc {
    [translations release];
    [_lastText release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    translations = [[NSMutableArray alloc] init];
}

- (void)performTranslation {
    responseData = [[NSMutableData data] retain];

    NSString* langString = @"en|ja";
    NSString* textEscaped = [_lastText stringByAddingPercentEscapeUsingEncoding:NSUTF8StringEncoding];
    NSString* langStringEscaped = [langString stringByAddingPercentEscapeUsingEncoding:NSUTF8StringEncoding];
    NSString* *url  = [NSString stringWithFormat:@"http://ajax.googleapis.com/ajax/services/language/translate?q=%@&v=1.0&langpair=%@", textEscaped, langStringEscaped];

    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)doTranslation {
    [translations removeAllObjects];
    [textField resignFirstResponder];

    button.enabled = NO;
    self.lastText = textField.text;
    [translations addObject:_lastText];
    textView.text = _lastText;

    [self performTranslation];
}

@end
