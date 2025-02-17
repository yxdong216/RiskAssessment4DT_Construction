function [zuidayuansu, zuixiaoyuansu] = compute_zuidazuixiao(zhengfuhua, paixuguiyi)
    zuidayuansu = zeros(23, 1);
    zuixiaoyuansu = zeros(23, 1);
    for i = 1:23
        if zhengfuhua(i) > paixuguiyi(i)
            zuidayuansu(i) = zhengfuhua(i);
            zuixiaoyuansu(i) = paixuguiyi(i);
        else
            zuidayuansu(i) = paixuguiyi(i);
            zuixiaoyuansu(i) = zhengfuhua(i);
        end
    end
end
