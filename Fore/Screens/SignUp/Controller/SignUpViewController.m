//
//  ViewController.m
//  Fore
//
//  Created by pavan krishna on 26/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController () <UITextFieldDelegate>

@property (nonatomic, strong) LayoutManager *layoutManager;

@property (weak, nonatomic) IBOutlet UIImageView *foreImageView;
@property (weak, nonatomic) IBOutlet RSFloatInputView *nameTextField;
@property (weak, nonatomic) IBOutlet RSFloatInputView *emailTextField;
@property (weak, nonatomic) IBOutlet RSFloatInputView *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *connectWithFaceBookButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.layoutManager = [[LayoutManager alloc] init];
    self.signUpDelegate = [SignUpDelegate sharedInstance];

    _nameTextField.textField.keyboardType = UIKeyboardTypeDefault;
    _nameTextField.inputFontSize = 10;
    _nameTextField.idlePlaceHolderFontSize = 13;
    _nameTextField.floatPlaceHolderFontSize = 10;
    _nameTextField.textField.font = [UIFont systemFontOfSize:12];

    _emailTextField.textField.keyboardType = UIKeyboardTypeEmailAddress;
    _emailTextField.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _emailTextField.inputFontSize = 10;
    _emailTextField.idlePlaceHolderFontSize = 13;
    _emailTextField.floatPlaceHolderFontSize = 10;
    _emailTextField.textField.font = [UIFont systemFontOfSize:12];

    _passwordTextField.textField.secureTextEntry = YES;
    _passwordTextField.inputFontSize = 10;
    _passwordTextField.idlePlaceHolderFontSize = 13;
    _passwordTextField.floatPlaceHolderFontSize = 10;
    _passwordTextField.textField.font = [UIFont systemFontOfSize:12];

    _nameTextField.textField.delegate = self;
    _emailTextField.textField.delegate = self;
    _passwordTextField.textField.delegate = self;
    
    _signUpButton.layer.masksToBounds = YES;
    if (IS_IPHONE_6P) {
        _signUpButton.layer.cornerRadius = 22;
        [_connectWithFaceBookButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_loginButton.titleLabel setFont:[UIFont systemFontOfSize:17]];
    }
    else if (IS_IPHONE_6)
    {
        [_connectWithFaceBookButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_loginButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        _signUpButton.layer.cornerRadius = 22;
    }
    else if (IS_IPHONE_5){
        [_connectWithFaceBookButton.titleLabel setFont:[UIFont systemFontOfSize:10]];
        [_loginButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
        _signUpButton.layer.cornerRadius = 18;
    }
    else if (IS_IPHONE_4_OR_LESS){
        _signUpButton.layer.cornerRadius = 14;
        [_connectWithFaceBookButton.titleLabel setFont:[UIFont systemFontOfSize:8]];
        [_loginButton.titleLabel setFont:[UIFont systemFontOfSize:11]];
    }
    
    [self addConstraints];
}

-(void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)addConstraints;
{
    [[self foreImageView] mas_makeConstraints:^(MASConstraintMaker *make) {
        if (IS_IPHONE_6P) {
            make.top.equalTo(self.view.mas_top).offset([self.layoutManager height:17]);
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.equalTo(@(150));
            make.height.equalTo(@(120));
        }
        else if (IS_IPHONE_6)
        {
            make.top.equalTo(self.view.mas_top).offset([self.layoutManager height:17]);
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.equalTo(@(150));
            make.height.equalTo(@(120));
        }
        else if (IS_IPHONE_5){
            make.top.equalTo(self.view.mas_top).offset([self.layoutManager height:10]);
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.equalTo(@(120));
            make.height.equalTo(@(100));
        }
        else if (IS_IPHONE_4_OR_LESS){
            make.top.equalTo(self.view.mas_top).offset([self.layoutManager height:10]);
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.equalTo(@(120));
            make.height.equalTo(@(100));
        }
    }];
    
    [[self loginButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-[self.layoutManager height:5]);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@([self.layoutManager width:30]));
        make.height.equalTo(@([self.layoutManager height:3.5]));
    }];
    
    [[self connectWithFaceBookButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.loginButton.mas_top).with.offset(-[self.layoutManager height:1.2]);
        make.left.equalTo(self.view.mas_left).with.offset([self.layoutManager width:10]);
        make.right.equalTo(self.view.mas_right).with.offset(-[self.layoutManager width:10]);
        make.height.equalTo(@([self.layoutManager height:3.5]));
    }];

    [[self signUpButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.connectWithFaceBookButton.mas_top).with.offset(-[self.layoutManager height:2.2]);
        make.left.equalTo(self.view.mas_left).with.offset([self.layoutManager width:10]);
        make.right.equalTo(self.view.mas_right).with.offset(-[self.layoutManager width:10]);
        make.height.equalTo(@([self.layoutManager height:6]));
    }];

    [[self passwordTextField] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.signUpButton.mas_top).with.offset(-[self.layoutManager height:7]);
        make.right.equalTo(self.view.mas_right).with.offset(-[self.layoutManager width:10]);
        make.left.equalTo(self.view.mas_left).with.offset([self.layoutManager width:10]);
        make.height.equalTo(@([self.layoutManager height:7]));
    }];
    
    [[self emailTextField] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.passwordTextField.mas_top).with.offset(-[self.layoutManager height:2.8]);
        make.left.equalTo(self.view.mas_left).with.offset([self.layoutManager width:10]);
        make.right.equalTo(self.view.mas_right).with.offset(-[self.layoutManager width:10]);
        make.height.equalTo(@([self.layoutManager height:7]));
    }];
    
    [[self nameTextField] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.emailTextField.mas_top).with.offset(-[self.layoutManager height:2.8]);
        make.left.equalTo(self.view.mas_left).with.offset([self.layoutManager width:10]);
        make.right.equalTo(self.view.mas_right).with.offset(-[self.layoutManager width:10]);
        make.height.equalTo(@([self.layoutManager height:7]));
    }];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)continueWithFacebookButtonPressed:(id)sender {
    [[self signUpDelegate] signUp:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
