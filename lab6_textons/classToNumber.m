function [ number ] = classToNumber( class )
    number=0;
    switch class
        case 'bark'
            number=1;
        case 'wood'
             number=2;
        case 'water'
             number=3;
        case 'granite'
             number=4;
        case 'marble'
             number=5;
        case 'floor'
            number=6;
        case 'pebbles'
             number=7;
        case 'wall'
             number=8;
        case 'brick'
             number=9;
        case 'glass'
             number=10;
        case 'carpet'
            number=11;
        case 'upholstery'
           number=12;
        case 'wallpaper'
            number=13;
        case 'fur'
            number=14;
        case 'knit'
            number=15;
        case 'corduroy'
            number=16;
        case 'plaid'
            number=17;
        otherwise
           error('da fuq?')
    end
    
end

