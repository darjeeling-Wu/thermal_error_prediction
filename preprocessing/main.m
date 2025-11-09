%import data
T = readtable('training_data.xlsx','sheet','sheet1');
Test = readtable('testing_data.xlsx','sheet','sheet2');

% split data
n = height(T);
split_index = round(0.7*n);
Train = T( 1:split_index, :);
Val = T(split_index+1:end, :);
display(Train);
display(Val);

% features from training data
tr_time = Train.time;
tr_mtemp = Train.motor_temp;
tr_btemp_r = Train.bearing_temp_r;
tr_btemp_f = Train.bearing_temp_f;
tr_jtemp = Train.jig_temp;
tr_intemp = Train.cnn_temp_in;
tr_outtemp = Train.cnn_temp_out;
tr_x1 = Train.x1;
tr_x2 = Train.x2;
tr_y1 = Train.y1;
tr_y2 = Train.y2;
tr_z = Train.z;

% features from validation data
val_time = Val.time;
val_mtemp = Val.motor_temp;
val_btemp_r = Val.bearing_temp_r;
val_btemp_f = Val.bearing_temp_f;
val_jtemp = Val.jig_temp;
val_intemp = Val.cnn_temp_in;
val_outtemp = Val.cnn_temp_out;
val_x1 = Val.x1;
val_x2 = Val.x2;
val_y1 = Val.y1;
val_y2 = Val.y2;
val_z = Val.z;

% features from testing data
te_time = Test.time;
te_mtemp = Test.motor_temp;
te_btemp_r = Test.bearing_temp_r;
te_btemp_f = Test.bearing_temp_f;
te_jtemp = Test.jig_temp;
te_intemp = Test.cnn_temp_in;
te_outtemp = Test.cnn_temp_out;
te_x1 = Test.x1;
te_x2 = Test.x2;
te_y1 = Test.y1;
te_y2 = Test.y2;
te_z = Test.z;


