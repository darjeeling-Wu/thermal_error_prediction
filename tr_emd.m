
function OutTable = tr_emd(Train)
% tr_emd 產生跟 tr_vmd 相同輸入格式，但輸出為 EMD 特徵表
% Input : Train (table)
% Output: OutTable (flat table, 含 IMF 特徵)

    % -------- 基礎欄位直接保留 --------
    baseVars = Train.Properties.VariableNames;
    OutTable = Train;   % 先複製一份原始表格

    % -------- 需要做 EMD 的欄位（模仿你 VMD 的欄位） --------
    emdVars = { ...
        'motor_temp', ...
        'bearing_temp_r', ...
        'bearing_temp_f', ...
        'jig_temp', ...
        'cnn_temp_in', ...
        'cnn_temp_out'};

    maxNumImf = 5;   % 你可以改成 3~8，看你取幾個 IMF

    % -------- 對每一個欄位做 EMD --------
    for k = 1:numel(emdVars)
        v = emdVars{k};

        if ~ismember(v, baseVars)
            warning('欄位 %s 不存在，跳過。', v);
            continue;
        end

        % 原始訊號
        x = Train.(v);
        x = x(:);  % 保證 column vector

        % -------- 執行 EMD --------
        try
            [imf, ~] = emd(x, 'MaxNumIMF', maxNumImf);
        catch ME
            error('EMD 執行失敗，欄位 %s，錯誤：%s', v, ME.message);
        end

        numImf = size(imf, 2);

        % -------- IMF 加為新欄位 --------
        for i = 1:numImf
            newVar = sprintf('%s_imf%d', v, i);
            OutTable.(newVar) = imf(:, i);
        end
    end

end
