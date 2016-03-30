function [ class ] = labelToClass( label )
    class=''
        switch label
        case 'T01'
            class='bark';
        case 'T02'
            class='bark';
        case 'T03'
            class='bark';
        case 'T04'
            class='wood';
        case 'T05'
            class='wood';
        case 'T06'
            class='wood';
        case 'T07'
            class='water';
        case 'T08'
            class='granite';
        case 'T09'
            class='marble';
        case 'T10'
            class='floor';
        case 'T11'
            class='floor';
        case 'T12'
            class='pebbles';
        case 'T13'
            class='wall';
        case 'T14'
            class='brick';
        case 'T15'
            class='brick';
        case 'T16'
            class='glass';
        case 'T17'
            class='glass';
        case 'T18'
            class='carpet';
        case 'T19'
            class='carpet';
        case 'T20'
            class='upholstery';
        case 'T21'
            class='wallpaper';
        case 'T22'
            class='fur';
        case 'T23'
            class='knit';
        case 'T24'
            class='corduroy';
        case 'T25'
            class='plaid';
        otherwise
           error('da fuq?')
    end

end

