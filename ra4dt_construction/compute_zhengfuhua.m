function BAA_zhengfuhua = compute_zhengfuhua(huiseguiyi, paixuguiyi)
    BAA_zhengfuhua = zeros(size(huiseguiyi));
    for i = 1:length(huiseguiyi)
        if paixuguiyi(i) > 0
            BAA_zhengfuhua(i) = huiseguiyi(i);
        else
            BAA_zhengfuhua(i) = -huiseguiyi(i);
        end
    end
end
