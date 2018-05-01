//
//  HomeTableViewCell.m
//  KnowAny
//
//  Created by super on 2018/4/27.
//  Copyright © 2018年 super. All rights reserved.
//

#import "HomeTableViewCell.h"
@interface HomeTableViewCell()
@property (nonatomic, strong)UIView *bgView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *iconImageView;
@end

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createBgView];
        self.titleLabel = [UILabel new];
        [self.bgView addSubview:self.titleLabel];
        
        self.iconImageView = [UIImageView new];
        [self.bgView addSubview:self.iconImageView];
        
        self.iconImageView.sd_layout.topSpaceToView(self.bgView, 10).leftSpaceToView(self.bgView, 10).widthIs(70).heightIs(60);
        self.titleLabel.sd_layout.topEqualToView(self.iconImageView).leftSpaceToView(self.iconImageView, 10).rightSpaceToView(self.bgView, 10).autoHeightRatio(0);
        
        [self.bgView setupAutoHeightWithBottomViewsArray:@[self.iconImageView, self.titleLabel] bottomMargin:10];
        [self setupAutoHeightWithBottomViewsArray:@[self.bgView, ] bottomMargin:5];
    }
    return self;
}

- (void)createBgView {
    self.bgView = [UIView new];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.shadowOffset = CGSizeMake(1, 1);
    self.bgView.layer.shadowOpacity = 0.3;
    self.bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    [self.contentView addSubview:self.bgView];
    self.bgView.sd_layout.topSpaceToView(self.contentView, 5).leftSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 10);
}

- (void)setModel:(StoriesModel *)model {
    _model = model;
    NSLog(@"title = %@", model.title);
    self.titleLabel.text = model.title;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:[model.images firstObject]]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
    self.backgroundColor = [UIColor whiteColor];
    if (selected) {
        self.bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    } else {
        self.bgView.backgroundColor = [UIColor whiteColor];
    }
}

@end
