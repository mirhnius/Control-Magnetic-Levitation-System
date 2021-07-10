clear;clc;
g = 9.8;
M = 0.2 + 0.434;
y = 0.03;
c = 0.3;
R = 50;
L = 0.2;
A = [0,1,0;g/y,0,+(2*c/M)*sqrt(g*M*y/c)/y;0,0,-R/L];
B  = [0;0;1/L];
C = [1 0 0 ];
D = 0;
desiredPoles = [-100 -10 -10];


% New System with observer --------------------------------------------
newMatrixA = A - (observerGain*C);
newMatrixB = eye(rank(A));
newMatrixC = eye(rank(A));
newMatrixD = eye(rank(A));
mysys = ss(newMatrixA,newMatrixB,newMatrixC,newMatrixD);
mysys;
timeT = 0:.1:2;
initialX = [1 0 0];
x = initial(mysys, initialX,timeT);
x1 = [1 0 0]*x';
x2 = [0 1 0]*x';
x3 = [0 0 1]*x';
subplot(3,1,1);
plot(timeT,x1,'r',timeT,x2,'g',timeT,x3,'b');
title('Response to initial Condition of State Variables Observer');
xlabel('Time -->');
ylabel('Magnitude -->');
disp('New System Matrix A');
disp(newMatrixA);
else
    disp('System is Unobservable');
    % No observer design possible -----------------------------------------
    end
    %--------------------------------------------------------------------------
    % Now first we need to make controller with given specification of 20.8%
    % overshoot and 4 seconds settling time. For such a controller we
    % calculated the required poles to be
    % [-1+.637i -1-.637i -4]
    %--------------------------------------------------------------------------
    % So ----------------------------------------------------------------------
    % we already have A -------------------------------------------------
    desiredPoles = [-1+.637i -1-.637i -4];
    controllerGain = acker(A,B,desiredPoles);
    disp('Controller Gain is ');
    disp(controllerGain);
    newMatrixA = A - (B*controllerGain);
    newMatrixB = eye(3);
    newMatrixC = eye(3);
    newMatrixD = eye(3);
    initialX = [1 0 0];
    timeT = 0:.1:5;
    mysys = ss(A,newMatrixB,newMatrixC,newMatrixD);
    x = initial(mysys, initialX,timeT);
    x1 = [1 0 0]*x';
    x2 = [0 1 0]*x';
    x3 = [0 0 1]*x';
    subplot(3,1,2);
    plot(timeT,x1,'r',timeT,x2,'g',timeT,x3,'b');
    title('Response to initial Condition of State Variables Controller');
    xlabel('Time -->');
    ylabel('Magnitude -->');
    %--------------------------------------------------------------------------
    % Now finding the reduced order observer that is 10 times faster than the
    % designed controller.
    % With this criteria in mind we can get the MatrixAaa, MatrixAb and so on
    % and the desired observer poles becomes -10+6.377i -10-6.477i
    %--------------------------------------------------------------------------
    % So ----------------------------------------------------------------------
    MatrixAaa = [0];
    MatrixAab = [1 0];
    MatrixAba = [0;-10];
    MatrixAbb = [0 1;-17 -8];
    desiredObserverPoles = [-10+6.377i -10-6.377i];
    observerGain = acker(MatrixAbb.',MatrixAab.',desiredObserverPoles.').'
    newMatrixAAbb = MatrixAbb - (observerGain*MatrixAab);
    newMatrixB = eye(2);
    newMatrixC = eye(2);
    newMatrixD = eye(2);
    mysys = ss(newMatrixAAbb,newMatrixB,newMatrixC,newMatrixD);
    initialX = [1 0];
    timeT = 0:.1:2;
    x = initial(mysys,initialX,timeT);
    x1 = [1 0]*x';
    x2 = [0 1]*x';
    subplot(3,1,3);
    plot(timeT,x1,'r',timeT,x2,'g');
    title('Response to initial Condition of State Variables Reduced Observer');
    xlabel('Time -->');
    ylabel('Magnitude -->');
    % -------------------------------------------------------------------------
    % End of Program. Created By Siddharth Kaul
    % -------------------------------------------------------------------------