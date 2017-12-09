%%Gyro thing
function gyro

close all; clc; clear all;

t = 0:.1:45; %s
theta_2i = 0; %rad
omega_2i = 0; %rad/s
theta_3i = 0; %rad
omega_3i = 0; %rad/s
OMEGA_1 = 100; %rad/s
torque = 10; %rad/s^2
J1 = 1;
J2 = 1;
J3 = 1;

qi = [theta_2i; omega_2i; theta_3i; omega_3i]; %state vector
u = [OMEGA_1; torque]; %input vecotr
A = [0, 1,0,0; 0,0,0,0; 0, J1/J3,0,0; 0,0,0,0];
B = [0,0; 0, 1/J2; -J1/J3,0; 0, 1/J3];

[t, q] = ode45(@rhs, t, qi);

subplot(2,2,1)
plot(t,q(:,1));
xlabel("time"); ylabel("theta_2");
subplot(2,2,2)
plot(t,q(:,2));
xlabel("time"); ylabel("omega_2");
subplot(2,2,3)
plot(t,q(:,3));
xlabel("time"); ylabel("theta_3");
subplot(2,2,4)
plot(t,q(:,4));
xlabel("time"); ylabel("omega_3 ");
    function dqdt = rhs(t,q)
        dqdt = A*q + B*u;
    end
end