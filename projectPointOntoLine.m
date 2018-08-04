function [Q, alfa, dist] = projectPointOntoLine(P, V2, V1)

% [Q, alfa, dist] = projectPointOntoLine(P, V2, V1)
%
% Projects a point P onto line that goes through points V1 and V2. The
% projected point is Q.

v = (V2-V1)/norm(V2-V1); %// normalized vector from V1 to V2
Q = dot(P-V1,v)*v+V1; %// projection of P onto line from V1 to V2
dist = norm(P-Q);
alfa = (Q(1)-V1(1))/(V2(1)-V1(1));