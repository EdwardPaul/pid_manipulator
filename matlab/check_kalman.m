function [rControl rObserve] = check_kalman(H)

A = H.A;
B = H.B;
C = H.C;

n = size(A,1);

controlMatrix = [];
observeMatrix = [];
for i = 1:n
controlMatrix = [controlMatrix A^(i-1)*B];
observeMatrix = [observeMatrix; C*A^(i-1)];
end

rControl = rank(controlMatrix);
rObserve = rank(observeMatrix);
if rControl == n
disp(["The system is controllable", "rank:",num2str(rControl)]);
else
error(["The system is not controllable", "rank:",num2str(rControl)]);
end
if rObserve == n
disp(["The system is observable", "rank:",num2str(rObserve)]);
else
error(["The system is not observable", "rank:",num2str(rObserve)]);
end
end