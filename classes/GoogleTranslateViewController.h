#import <UIKit/UIKit.h>

@interface GoogleTranslateViewController : UIViewController {
    IBOutlet UITextView* textView;
    IBOutlet UITextField* textField;
    IBOutlet UIButton* button;

    NSMutableData* responseData;
    NSMutableArray* translations;
    NSString* _lastText;

    @property (nonatomic, copy) NSString * lastText;
}

- (IBAction)doTranslation;

@end
