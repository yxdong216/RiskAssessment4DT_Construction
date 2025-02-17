function risk_fengxianzonghe = compute_risk_weights(quanzhongjuji, zhuanjia_zonghe)
    [file, path] = uigetfile('*.xlsx', '请选择一个位于A1:C5的 expert_dafen 矩阵的 Excel 文件');
    
    if file == 0
        error('未选择文件，请选择一个有效的 Excel 文件。');
    end
    
    expert_dafen = xlsread(fullfile(path, file), 'A1:C5');
    
    if size(expert_dafen, 1) ~= 5 || size(expert_dafen, 2) ~= 3
        error('Excel 文件中的 expert_dafen 矩阵大小无效，应该是 5x3 的矩阵。');
    end

    quanzhongjuji = [
    0.434266874, 0.486360157, 0.413776706, 0.486252748, 0.331688678, 0.425653576, 0.417236656, 0.571480232, 0.604042884, 0.61036513, 0.376377786, 0.38963487;
    0.462203204, 0.51146016, 0.398207464, 0.486696517, 0.411272415, 0.457154257, 0.456789534, 0.541031557, 0.642233383, 0.642233383, 0.357766617, 0.357766617;
    0.331333741, 0.361199788, 0.579758147, 0.638800212, 0.58629783, 0.609774594, 0.339600039, 0.388100109, 0.37014717, 0.396805098, 0.554377745, 0.594103868;
    0.150848478, 0.204006763, 0.700143946, 0.790958323, 0.466991711, 0.497131739, 0.445810583, 0.498671517, 0.647342011, 0.651300531, 0.341556885, 0.346504702;
    0.163871773, 0.228101129, 0.662093621, 0.741870402, 0.413525739, 0.475404086, 0.414710941, 0.520217839, 0.508907327, 0.521114616, 0.443161168, 0.46142095;
    0.232798664, 0.284688367, 0.617291732, 0.715311633, 0.391663018, 0.466770045, 0.406260298, 0.494257135, 0.544957474, 0.544957474, 0.455042526, 0.455042526;
    0.434128864, 0.464336255, 0.478179546, 0.530048218, 0.407923884, 0.478954194, 0.402902064, 0.500285942, 0.574643582, 0.585195748, 0.38392052, 0.39970678;
    0.434128864, 0.464336255, 0.478179546, 0.530048218, 0.471372321, 0.533237345, 0.360704661, 0.455962252, 0.576945018, 0.581693731, 0.409737894, 0.415673386;
    0.476151766, 0.50934761, 0.43210938, 0.478630733, 0.409171635, 0.461391032, 0.445810583, 0.526146116, 0.29081772, 0.349885326, 0.523688488, 0.613228861;
    0.453907801, 0.479165636, 0.457914643, 0.497569498, 0.389980043, 0.471516356, 0.371694598, 0.493313455, 0.210780689, 0.262314909, 0.643487074, 0.726567091;
    0.229447153, 0.284492186, 0.620346108, 0.693615905, 0.513737295, 0.530696831, 0.436310804, 0.469303169, 0.37014717, 0.396805098, 0.554377745, 0.594103868;
    0.316990888, 0.347098427, 0.56373716, 0.612080216, 0.504435439, 0.526745229, 0.430101302, 0.473254771, 0.647342011, 0.651300531, 0.341556885, 0.346504702;
    0.168446746, 0.197677945, 0.727656536, 0.773139615, 0.476577398, 0.533001829, 0.366031767, 0.466998171, 0.43781925, 0.466127046, 0.479442513, 0.530512677;
    0.308103626, 0.342609753, 0.59553214, 0.648077276, 0.285634087, 0.360481998, 0.498756089, 0.62641337, 0.545167782, 0.568070198, 0.387892865, 0.429211171;
    0.281239838, 0.324464509, 0.593090553, 0.675535491, 0.345831288, 0.440576113, 0.393055328, 0.555656428, 0.647342011, 0.651300531, 0.341556885, 0.346504702;
    0.251869759, 0.320972718, 0.551003792, 0.65676542, 0.376530254, 0.415881088, 0.515529433, 0.568409241, 0.590262106, 0.590262106, 0.409737894, 0.409737894;
    0.326143158, 0.356185841, 0.559442056, 0.601904148, 0.371417703, 0.428139365, 0.472421926, 0.559233846, 0.576945018, 0.581693731, 0.409737894, 0.415673386;
    0.326143158, 0.356185841, 0.559442056, 0.601904148, 0.387187047, 0.431748274, 0.481852162, 0.546196022, 0.545167782, 0.568070198, 0.387892865, 0.429211171;
    0.219429208, 0.261500567, 0.658772354, 0.733310008, 0.378580284, 0.406588705, 0.532845122, 0.578389859, 0.508782226, 0.547270977, 0.37109875, 0.436251218;
    0.211164776, 0.294885018, 0.535632913, 0.647678827, 0.418144661, 0.512995233, 0.335454254, 0.475735983, 0.487394957, 0.508445491, 0.44695282, 0.480507992;
    0.231130245, 0.269239514, 0.628734375, 0.683241998, 0.245861524, 0.333395847, 0.512332836, 0.634881826, 0.510941645, 0.535567469, 0.417081813, 0.461509323;
    0.424640207, 0.454604835, 0.487705787, 0.545395165, 0.550855793, 0.568368356, 0.399429191, 0.423557915, 0.570816614, 0.570816614, 0.429183386, 0.429183386;
    0.390016897, 0.416030564, 0.531031202, 0.565734187, 0.386871808, 0.450105086, 0.442243701, 0.534596617, 0.512461546, 0.539231341, 0.408071214, 0.460768659
    ];



    risk_jiaocha1 = zeros(23, 23); 

	for i = 1:23
	    for j = 1:23
	        Zj1 = quanzhongjuji(j, 1); 
	        Zj2 = quanzhongjuji(j, 2);  
	        Zj3 = quanzhongjuji(j, 3);  
	        Zj4 = quanzhongjuji(j, 4);  
	        
	        Zi1 = quanzhongjuji(i, 1);  
	        Zi2 = quanzhongjuji(i, 2);  
	        Zi3 = quanzhongjuji(i, 3);  
	        Zi4 = quanzhongjuji(i, 4);  
	        
	        term1 = (Zj1 + Zj2 + 2 - Zj3 - Zj4);
	        term2 = (Zi1 + Zi2 + 2 - Zi3 - Zi4);
	        
	        part1 = 0.25 * term1 * log(2 * term1 / (term1 + term2));
	        part2 = 0.25 * (4 - term1) * log(2 * (4 - term1) / ((4 - term1) + (4 - term2)));
	        
	        risk_jiaocha1(i, j) = part1 + part2;
	    end
	end

	risk_jiaocha2 = zeros(23, 23);

	for i = 1:23
	    for j = 1:23
	        Zj5 = quanzhongjuji(j, 5);
	        Zj6 = quanzhongjuji(j, 6);
	        Zj7 = quanzhongjuji(j, 7);
	        Zj8 = quanzhongjuji(j, 8);
	        
	        Zi5 = quanzhongjuji(i, 5);
	        Zi6 = quanzhongjuji(i, 6);
	        Zi7 = quanzhongjuji(i, 7);
	        Zi8 = quanzhongjuji(i, 8);
	        
	        term1 = (Zj5 + Zj6 + 2 - Zj7 - Zj8);
	        term2 = (Zi5 + Zi6 + 2 - Zi7 - Zi8);
	        
	        part1 = 0.25 * term1 * log(2 * term1 / (term1 + term2));
	        part2 = 0.25 * (4 - term1) * log(2 * (4 - term1) / ((4 - term1) + (4 - term2)));
	        
	        risk_jiaocha2(i, j) = part1 + part2;
	    end
	end



	risk_jiaocha3 = zeros(23, 23);

	for i = 1:23
	    for j = 1:23
	        Zj9 = quanzhongjuji(j, 9);
	        Zj10 = quanzhongjuji(j, 10);
	        Zj11 = quanzhongjuji(j, 11);
	        Zj12 = quanzhongjuji(j, 12);
	        
	        Zi9 = quanzhongjuji(i, 9);
	        Zi10 = quanzhongjuji(i, 10);
	        Zi11 = quanzhongjuji(i, 11);
	        Zi12 = quanzhongjuji(i, 12);
	        
	        term1 = (Zj9 + Zj10 + 2 - Zj11 - Zj12);
	        term2 = (Zi9 + Zi10 + 2 - Zi11 - Zi12);
	        
	        part1 = 0.25 * term1 * log(2 * term1 / (term1 + term2));
	        part2 = 0.25 * (4 - term1) * log(2 * (4 - term1) / ((4 - term1) + (4 - term2)));
	        
	        risk_jiaocha3(i, j) = part1 + part2;
	    end
	end



	risk_jiaocha4 = zeros(23, 23);

	for i = 1:23
	    for j = 1:23
	        Zj1 = quanzhongjuji(j, 1);
	        Zj2 = quanzhongjuji(j, 2);
	        Zj3 = quanzhongjuji(j, 3);
	        Zj4 = quanzhongjuji(j, 4);
	        
	        Zi1 = quanzhongjuji(i, 1);
	        Zi2 = quanzhongjuji(i, 2);
	        Zi3 = quanzhongjuji(i, 3);
	        Zi4 = quanzhongjuji(i, 4);
	        
	        term2 = (Zj1 + Zj2 + 2 - Zj3 - Zj4);
	        term1 = (Zi1 + Zi2 + 2 - Zi3 - Zi4);
	        
	        part1 = 0.25 * term1 * log(2 * term1 / (term1 + term2));
	        part2 = 0.25 * (4 - term1) * log(2 * (4 - term1) / ((4 - term1) + (4 - term2)));
	        
	        risk_jiaocha4(i, j) = part1 + part2;
	    end
	end


	risk_jiaocha5 = zeros(23, 23);

	for i = 1:23
	    for j = 1:23
	        Zj5 = quanzhongjuji(j, 5);
	        Zj6 = quanzhongjuji(j, 6);
	        Zj7 = quanzhongjuji(j, 7);
	        Zj8 = quanzhongjuji(j, 8);
	        
	        Zi5 = quanzhongjuji(i, 5);
	        Zi6 = quanzhongjuji(i, 6);
	        Zi7 = quanzhongjuji(i, 7);
	        Zi8 = quanzhongjuji(i, 8);
	        
	        term2 = (Zj5 + Zj6 + 2 - Zj7 - Zj8);
	        term1 = (Zi5 + Zi6 + 2 - Zi7 - Zi8);
	        
	        part1 = 0.25 * term1 * log(2 * term1 / (term1 + term2));
	        part2 = 0.25 * (4 - term1) * log(2 * (4 - term1) / ((4 - term1) + (4 - term2)));
	        
	        risk_jiaocha5(i, j) = part1 + part2;
	    end
	end



	risk_jiaocha6 = zeros(23, 23);

	for i = 1:23
	    for j = 1:23
	        Zj9 = quanzhongjuji(j, 9);
	        Zj10 = quanzhongjuji(j, 10);
	        Zj11 = quanzhongjuji(j, 11);
	        Zj12 = quanzhongjuji(j, 12);
	        
	        Zi9 = quanzhongjuji(i, 9);
	        Zi10 = quanzhongjuji(i, 10);
	        Zi11 = quanzhongjuji(i, 11);
	        Zi12 = quanzhongjuji(i, 12);
	        
	        term2 = (Zj9 + Zj10 + 2 - Zj11 - Zj12);
	        term1 = (Zi9 + Zi10 + 2 - Zi11 - Zi12);
	        
	        part1 = 0.25 * term1 * log(2 * term1 / (term1 + term2));
	        part2 = 0.25 * (4 - term1) * log(2 * (4 - term1) / ((4 - term1) + (4 - term2)));
	        
	        risk_jiaocha6(i, j) = part1 + part2;
	    end
	end



	risk_shang1 = sum(risk_jiaocha1);
	risk_shang2 = sum(risk_jiaocha2);
	risk_shang3 = sum(risk_jiaocha3);
	risk_shang4 = sum(risk_jiaocha4);
	risk_shang5 = sum(risk_jiaocha5);
	risk_shang6 = sum(risk_jiaocha6);

	risk_shangS = (risk_shang1 + risk_shang4) / 2;
	risk_shangO = (risk_shang2 + risk_shang5) / 2;
	risk_shangD = (risk_shang3 + risk_shang6) / 2;

	risk_Szong = sum(risk_shangS);
	risk_Ozong = sum(risk_shangO);
	risk_Dzong = sum(risk_shangD);

	risk_fengxianguiyi1 = risk_Szong / (risk_Szong + risk_Ozong + risk_Dzong);
	risk_fengxianguiyi2 = risk_Ozong / (risk_Szong + risk_Ozong + risk_Dzong);
	risk_fengxianguiyi3 = risk_Dzong / (risk_Szong + risk_Ozong + risk_Dzong);

	risk_fengxiankeguan1 = (1-risk_fengxianguiyi1) / (3 - risk_fengxianguiyi1 - risk_fengxianguiyi2 - risk_fengxianguiyi3);
	risk_fengxiankeguan2 = (1-risk_fengxianguiyi2) / (3 - risk_fengxianguiyi1 - risk_fengxianguiyi2 - risk_fengxianguiyi3);
	risk_fengxiankeguan3 = (1-risk_fengxianguiyi3) / (3 - risk_fengxianguiyi1 - risk_fengxianguiyi2 - risk_fengxianguiyi3);


	risk_zhuguan = zhuanjia_zonghe * expert_dafen;


	risk_fengxianzonghe1 = (risk_zhuguan(1) * risk_fengxiankeguan1) / (risk_zhuguan(1) * risk_fengxiankeguan1 + risk_zhuguan(2) * risk_fengxiankeguan2 + risk_zhuguan(3) * risk_fengxiankeguan3);
	risk_fengxianzonghe2 = (risk_zhuguan(2) * risk_fengxiankeguan2) / (risk_zhuguan(1) * risk_fengxiankeguan1 + risk_zhuguan(2) * risk_fengxiankeguan2 + risk_zhuguan(3) * risk_fengxiankeguan3);
	risk_fengxianzonghe3 = (risk_zhuguan(3) * risk_fengxiankeguan3) / (risk_zhuguan(1) * risk_fengxiankeguan1 + risk_zhuguan(2) * risk_fengxiankeguan2 + risk_zhuguan(3) * risk_fengxiankeguan3);

	risk_fengxianzonghe = [risk_fengxianzonghe1, risk_fengxianzonghe2, risk_fengxianzonghe3];
end

