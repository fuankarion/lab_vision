function fb  = createBank(orients,numScales)
    
    % create filter bank
    [fb] = fbCreate(orients,1,numScales,sqrt(2),2);
    

end

