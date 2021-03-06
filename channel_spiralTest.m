% Test case suite for channel_spiral.m
% Tests the function with various values of parameters. If all test cases
% pass, "All tests passsed. Good job" will be displayed in the command
% window. Otherwise, "Not all tests have passed." will be displayed.
% NOTE: channel_spiral.m must be in the same folder as channel_spiralTest.m

pRange = [0.8:0.1:1.2]/10^12; % 5 values
uRange = [0.08 0.008]./(10^4); % 5 values
diameter = [3:10]; % 7 values
flowRange = [0.1:0.1:1].*(10^12)/60; % 10 values

% Case 1
[a1 b1 c1] = channel_spiral3(pRange(1),uRange(1),diameter(1:2)/2,flowRange(1));
ex_out1_1 = [123  124  125  126  127  128  129  130  86  87  88  89  90]';
ex_out1_2 = [10 10 10 10 10 10 10 10 11 11 11 11 11]';
ex_out1_3 = [0.0839,0.1492;0.0833,0.1481;0.0828,0.1472;0.0822,0.1462; ... 
    0.0817,0.1452;0.0811,0.1443;0.0806,0.1433;0.0801,0.1424; ...
    0.0836,0.1486;0.0827,0.1470;0.0818,0.1454;0.0809,0.1438;0.0800,0.1423];
case1_result = isequal(isequal(a1,ex_out1_1), ... 
    isequal(b1,ex_out1_2), isequal(c1,ex_out1_3));

% Case 2
[a2 b2 c2] = channel_spiral3(pRange(1),uRange(1),diameter(2:3)/2,flowRange(1));
ex_out2_1 = [141 142 143 144 145 146 147 148 149 150 101 102 103 104 ...
    105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 ... 
    121 122 80 81 82 83 84 85 86 87 88 89 90 91]';
ex_out2_2 = [11 11 11 11 11 11 11 11 11 11 12 12 12 12 12 12 12 12 12 ...
    12 12 12 12 12 12 12 12 12 12 12 12 12 13 13 13 13 13 13 13 13 13 ... 
    13 13 13]';
ex_out2_3 = [0.0956,0.1494;0.0950,0.1485;0.0945,0.1476;0.0939,0.1468; ... 
    0.0934,0.1459;0.0929,0.1451;0.0924,0.1443;0.0918,0.1435; ... 
    0.0913,0.1427;0.0908,0.1419;0.0953,0.1489;0.0944,0.1475; ...
    0.0935,0.1462;0.0927,0.1449;0.0919,0.1436;0.0911,0.1423; ...
    0.0903,0.1411;0.0895,0.1399;0.0888,0.1387;0.0880,0.1376; ...
    0.0873,0.1364;0.0866,0.1353;0.0859,0.1342;0.0852,0.1332; ...
    0.0846,0.1321;0.0839,0.1311;0.0833,0.1301;0.0826,0.1291; ...
    0.0820,0.1281;0.0814,0.1272;0.0808,0.1262;0.0802,0.1253; ...
    0.0920,0.1437;0.0908,0.1418;0.0896,0.1401;0.0885,0.1383; ...
    0.0874,0.1366;0.0864,0.1350;0.0854,0.1334;0.0844,0.1318; ...
    0.0834,0.1303;0.0825,0.1289;0.0815,0.1274;0.0807,0.1260];
case2_result = isequal(isequal(a2,ex_out2_1), ... 
    isequal(b2,ex_out2_2), isequal(c2,ex_out2_3));

% Case 3
[a3 b3 c3] = channel_spiral3(pRange(1),uRange(1),diameter(1:2)/2,flowRange(2));
ex_out3_1 = [137 138 139 140 141 142 143 144 145 98 99 100]';
ex_out3_2 = [11 11 11 11 11 11 11 11 11 12 12 12]';
ex_out3_3 = [0.0841,0.1495;0.0836,0.1486;0.0831,0.1477;0.0826,0.1468; ...
    0.0821,0.1459;0.0816,0.1450;0.0811,0.1442;0.0806,0.1434; ... 
    0.0802,0.1426;0.0842,0.1496;0.0833,0.1482;0.0826,0.1468];
case3_result = isequal(isequal(a3,ex_out3_1), ... 
    isequal(b3,ex_out3_2), isequal(c3,ex_out3_3));

% Case 4
[a4 b4 c4] = channel_spiral3(pRange(3),uRange(2),diameter(1:2)/2,flowRange(3));
ex_out4_1 = [86 87 88 89 90]';
ex_out4_2 = [10 10 10 10 10]';
ex_out4_3 = [0.084,0.1494;0.0831,0.1478;0.0823,0.1462;0.0814,0.1447; ...
    0.0806,0.1432];
case4_result = isequal(isequal(a4,ex_out4_1), ... 
    isequal(b4,ex_out4_2), isequal(c4,ex_out4_3));

% Case 5
[a5 b5 c5] = channel_spiral3(pRange(3),uRange(2),diameter(1:2)/2,flowRange(4));
ex_out5_1 = [104 105 106 107 108 109 110]';
ex_out5_2 = [10 10 10 10 10 10 10]';
ex_out5_3 = [0.0843,0.1499;0.0836,0.1487;0.0829,0.1474;0.0822,0.1462; ...
    0.0816,0.1450;0.0809,0.1439;0.0803,0.1427];
case5_result = isequal(isequal(a5,ex_out5_1), ... 
    isequal(b5,ex_out5_2), isequal(c5,ex_out5_3));

% result
if (case5_result == 1) & isequal(case1_result, case2_result, ...
        case3_result, case4_result, case5_result)
    disp('All tests passed. Good job!')
else
    disp('Not all tests have passsed.')
end
