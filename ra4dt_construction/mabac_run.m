clc;
clear;
format long;
data = readcell("data.xlsx");

%% 李语义表-MABAC
ivifn_matrix = create_ivifn_matrix(data);

%% 确定专家权重
zhuanjia_zonghe = compute_expert_weights(ivifn_matrix);

%% 接李语义表-MABAC
zhuanjiajuji_matrix = aggregate_expert_judgments(ivifn_matrix, zhuanjia_zonghe);
FMgeshu = 1/23;
border_vector = compute_border_vector(zhuanjiajuji_matrix, FMgeshu);
[juliS, juliO, juliD] = compute_SOD_distances(zhuanjiajuji_matrix, border_vector);
risk_priority = juliS + juliO +juliD;

%% 确定风险因子权重
risk_fengxianzonghe = compute_risk_weights(zhuanjiajuji_matrix, zhuanjia_zonghe);

%% 接李语义表-MABAC
jiaquan_matrix = compute_weighted_matrix(zhuanjiajuji_matrix, risk_fengxianzonghe);

baa_vector = compute_baa_vector(jiaquan_matrix, FMgeshu);

referenceS = baa_vector(1:4);
yuanFMS = compute_dimension_score(jiaquan_matrix(:,1:4), referenceS);

referenceO = baa_vector(5:8);
yuanFMO = compute_dimension_score(jiaquan_matrix(:,5:8), referenceO);

referenceD = baa_vector(9:12);
yuanFMD = compute_dimension_score(jiaquan_matrix(:,9:12), referenceD);

yuanpaixu = yuanFMS + yuanFMO + yuanFMD;
[yuanrank, sorted_data] = compute_ranking(yuanpaixu);

%% MABAC-GRA-TOPSIS
cols_to_remove = [21, 22, 23, 24, 45, 46, 47, 48, 69, 70, 71, 72];
groups = {
    1:4, 21:24, 41:44, 5:8, 25:28, 45:48, 9:12, 29:32, 49:52,...
    13:16, 33:36, 53:56, 17:20, 37:40, 57:60
};

[new_ivifn, reordered_matrix] = preprocess_data(ivifn_matrix, cols_to_remove, groups);

MABAC_zhuanjiajuhe = compute_expert_aggregation(reordered_matrix);

MABAC_jiauqna = apply_weighting(MABAC_zhuanjiajuhe);

MABAC_BAA_vector = compute_MABAC_baa_vector(MABAC_jiauqna, FMgeshu);

[MABAC_d1, MABAC_d2, MABAC_d3] = compute_distance_matrices(MABAC_jiauqna, MABAC_BAA_vector);

MABAC_rpv = MABAC_d1 + MABAC_d2 +MABAC_d3;
[MABAC_rank, sorted_data] = compute_ranking(MABAC_rpv);

[MABAC_score, MABAC_score1, MABAC_score2, MABAC_score3] = calc_scores(MABAC_jiauqna);

[MABAC_top, MABAC_low] = gen_top_low_matrices(MABAC_jiauqna, MABAC_score);

[MABAC_max_distance, MABAC_min_distance] = calc_distances(MABAC_jiauqna, MABAC_top, MABAC_low);

max_max_MABAC = max(max(MABAC_max_distance));  
min_max_MABAC = min(min(MABAC_max_distance)); 
max_min_MABAC = max(max(MABAC_min_distance));  
min_min_MABAC = min(min(MABAC_min_distance)); 

[MABAC_p_max, MABAC_p_min, MABAC_row_means1, MABAC_row_means2] = calc_p_matrices(MABAC_max_distance, MABAC_min_distance, max_max_MABAC, min_max_MABAC, max_min_MABAC, min_min_MABAC);

[MABAC_gra1, MABAC_gra2] = gen_gra_vectors(MABAC_jiauqna, MABAC_score1, MABAC_score2, MABAC_score3);

[MABAC_zheng, MABAC_fu, MABAC_d1, MABAC_d2] = calc_ideal_distances(MABAC_jiauqna, MABAC_gra1, MABAC_gra2);

MABAC_topsis = MABAC_d1 ./ (MABAC_d1 + MABAC_d2);
[MABAC_top_rank, sorted_data] = compute_ranking(MABAC_topsis);
new_MABAC_rank = MABAC_top_rank - MABAC_rank;

%% TOPSIS
TOPSIS_score_function = calculate_score(jiaquan_matrix);

[TOPSIS_lixiang1, TOPSIS_lixiang2] = generate_ideal_solutions(jiaquan_matrix, TOPSIS_score_function);

[TOPSIS_zhengjie, TOPSIS_fujie] = calculate_block_distances(jiaquan_matrix, TOPSIS_lixiang1, TOPSIS_lixiang2);

[TOPSIS_zhengquan, TOPSIS_fuquan] = calculate_global_distances(jiaquan_matrix, TOPSIS_lixiang1, TOPSIS_lixiang2);

TOPSIS_geomean = compute_geomean(TOPSIS_zhengquan, TOPSIS_fuquan);
[TOPSIS_georank, sorted_data] = compute_ranking(TOPSIS_geomean);

TOPSIS_xiangdui = compute_xiangdui(TOPSIS_zhengjie);
TOPSIS_tihe = compute_tihe(TOPSIS_zhengjie);
TOPSIS_tihefu = compute_tihe(TOPSIS_fujie);
TOPSIS_huise = compute_huise(TOPSIS_tihe, TOPSIS_tihefu);
[TOPSIS_huiserank, sorted_data] = compute_ranking(TOPSIS_huise);

TOPSIS_xiangduifu = compute_xiangdui(TOPSIS_fujie);
TOPSIS_xiangduibi = compute_xiangduibi(TOPSIS_xiangdui, TOPSIS_xiangduifu);
[TOPSIS_xiangduibirank, sorted_data] = compute_ranking(TOPSIS_xiangduibi);

%% 正负理想解GRA
lixiang_zhengGRA = compute_gra_matrix(jiaquan_matrix, TOPSIS_lixiang1);

lixiang_fuGRA = compute_gra_matrix(jiaquan_matrix, TOPSIS_lixiang2);

[lixiang_max_zheng, lixiang_min_zheng] = compute_max_min(lixiang_zhengGRA);

[lixiang_max_fu, lixiang_min_fu] = compute_max_min(lixiang_fuGRA);

lixiang_zhenghuise = compute_huise_matrix(lixiang_zhengGRA, lixiang_max_zheng, lixiang_min_zheng);

lixiang_fuhuise = compute_huise_matrix(lixiang_fuGRA, lixiang_max_fu, lixiang_min_fu);

[lixiang_guiyi_means1, lixiang_guiyichuli1] = compute_guiyi_normalize(lixiang_zhenghuise);

[lixiang_guiyi_means2, lixiang_guiyichuli2] = compute_guiyi_normalize(lixiang_fuhuise);

lixiang_tiehe1 = lixiang_guiyi_means1 ./ (lixiang_guiyi_means1 + lixiang_guiyi_means2);
lixiang_tiehe2 = lixiang_guiyichuli1 ./ (lixiang_guiyichuli1 + lixiang_guiyichuli2);

%% BAA向量GRA
BAA_oushi = compute_oushi_matrix(jiaquan_matrix, border_vector);

[BAA_max_oushi, BAA_min_oushi] = compute_max_min(BAA_oushi);

BAA_huiseguanlian = compute_huiseguanlian(BAA_oushi, BAA_max_oushi, BAA_min_oushi);
BAA_row_huise = mean(BAA_huiseguanlian, 2);
BAA_huiseguiyi = BAA_row_huise ./ norm(BAA_row_huise); 

BAA_paixuguiyi = yuanpaixu ./ norm(yuanpaixu); 

BAA_zhengfuhua = compute_zhengfuhua(BAA_huiseguiyi, BAA_paixuguiyi);

BAA_hunhe = BAA_paixuguiyi * 0.5 + 0.5 * BAA_zhengfuhua;
[BAA_hunherank, sorted_data] = compute_ranking(BAA_hunhe);

BAA_rankcha = BAA_hunherank - yuanrank;

[BAA_zuidayuansu, BAA_zuixiaoyuansu] = compute_zuidazuixiao(BAA_zhengfuhua, BAA_paixuguiyi);

BAA_qujianshu = abs(BAA_zuidayuansu - BAA_zuixiaoyuansu);

BAA_matrix = compute_baa_matrix(BAA_zuidayuansu, BAA_zuixiaoyuansu, BAA_qujianshu);

BAA_column_sums = sum(BAA_matrix);

BAA_bianhua = (BAA_column_sums + 23/2 - 1) / (23*22);
[BAA_bianhuarank, sorted_data] = compute_ranking(BAA_bianhua);

