//
//  PlacesDataController.m
//  ParalaxTable
//
//  Created by Kristy on 02.04.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "PlacesDataController.h"


@interface PlacesDataController ()

@property (nonatomic, strong) NSArray *tablePhotos;
@property (nonatomic,strong) NSArray *tableLabels;
@property (nonatomic,strong) NSArray *tableSummary;
@property (nonatomic, strong) NSArray *placesLocation;


-(void)initializeDefaultPlace;

@end

@implementation PlacesDataController

-(id)init {
    self = [super init];
    
    if (self) {
        _placesList = [[NSMutableArray alloc]init];
        [self initializeDefaultPlace];
        return self;
    }
    return nil;
}

-(void)initializeDefaultPlace {
        self.tablePhotos = @[[UIImage imageNamed:@"test1.jpg"],
                            [UIImage imageNamed:@"test2.jpg"],
                            [UIImage imageNamed:@"test3.jpg"],
                            [UIImage imageNamed:@"test4.jpg"],
                            [UIImage imageNamed:@"test5.jpg"],
                            [UIImage imageNamed:@"test6.jpg"],
                            [UIImage imageNamed:@"test7.jpg"],
                            [UIImage imageNamed:@"test8.jpg"],
                            [UIImage imageNamed:@"test9.jpg"]];
    
    
    self.tableLabels = @[@"Калла",
                         @"Роза",
                         @"Орхидея",
                         @"Ромашка",
                         @"Пион",
                         @"Хризантема",
                         @"Гербера",
                         @"Тюльпан",
                         @"Подснежник"];
    
    self.tableSummary = @[@"Цветок калла очень популярен при создании свадебных букетов из-за своего величия и красоты. Являются одним из самых красивых цветов с уникальной формой цветка; имеют широкий спектр цвета: оттенки зеленого, розового, фиолетового, желтого и оранжевого (см. — все каллы). Известны также другие распространенные имена, такие как аронники, трубчатые, свиные и мини-каллы.",
                          @"Этот цветок имеет волшебную притягательность и необыкновенную красоту, которая испокон веков привлекала к себе огромное внимание людей. Многие из них сочинили большое количество сказок и легенд о прекрасной розе, так как она пользовалась большой популярностью и любовью у всех народов мира. ",
                          @"Орхидеи похожи на произведения искусства, радуют и обогащают нас своей красотой. И формы этих цветов самые изысканные. Они напоминают то птиц, то бабочек, то ящериц, то лебедей. Тонкие ароматы этих цветов кружат голову. Пожалуй, орхидеи - одно из самых совершенных творений природы, и недаром многие называют их аристократами среди растений.",
                          @"Собирать ромашку следует только в сухую погоду, в ранние утренние часы, когда в клетках всех растений активизируются процессы фотосинтеза и происходит повышенная выработка витаминов и других полезных веществ. В случае выпадения обильной утренней росы сбор ромашки производить не следует – лучше выбрать для этого сухое и теплое утро.",
                          @"Пион относится к классу многолетних растений и может быть травянистым, полукустарниковым либо кустарниковым. Данное растение может иметь несколько стеблей, высота которых редко превышает отметку в 1 м.",
                          @"По описанию - на букетные хризантемы, множество соцветий похожи на плотные шаровидные шапки незагнутых цветков. Самые поздние из всех моих хризантем и самые капризные. Цветение начинается только в конце сентября - начале октября, самый пик цветения - конец октября.",
                          @"Многолетнее красивоцветущее травянистое растение семейства сложноцветных или астровых (Asteraceae). В открытом грунте произрастает только в районах с очень теплым климатом, поэтому используется в первую очередь как оранжерейная (на срезку) или комнатная культура.",
                          @"Значение цветка варьируется и от цвета, так красные тюльпаны могут символизировать объяснение в любви (поверь мне), в то время как белые олицетворяют признание вины и желание получить прощение. Многоцветные же  тюльпаны сообщают девушке о том, что у нее прекрасные глаза. Также тюльпан может означать собой богатство и свидетельствовать о любви и взаимности чувств!",
                          @"Подснежник — многолетне луковичное растение. Луковица округлая, до 3 см в диаметре. Листья немногочисленные, узкие, плоские, линейные или ланцетные, блестящие темно-зеленого или серовато-зеленого цвета, шириной 1 см. Из луковицы вырастает одиночный цветок на прямой цветоножке. Листья появляются одновременно с цветками. Цветки поникающие, колокольчатой формы, белые с зелеными пятнышками на краю лепестка."];
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(37.766997, -122.422032);
    
    for (int i = 0; i<9; i++) {
        [self addPlaceWithTitle:[self.tableLabels objectAtIndex:i] summary:[self.tableSummary objectAtIndex:i] photo:[self.tablePhotos objectAtIndex:i] andLocation:coord];
     }
}


-(NSUInteger)placesCount {
    return [self.placesList count];
}

-(Places *)placeAtIndex:(NSUInteger)index {
    return [self.placesList objectAtIndex:index];
}

-(void)addPlaceWithTitle:(NSString *)title summary:(NSString *)summary photo:(UIImage *)photo andLocation:(CLLocationCoordinate2D)location {
    Places *newPlace = [[Places alloc]initWithTitle:title summary:summary photo:photo andLocation:location];
    [self.placesList addObject:newPlace];
    
}

@end

