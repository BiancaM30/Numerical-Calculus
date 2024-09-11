function [Q,fcount] = adquad(F,a,b,tol,varargin)
%ADQUAD  adaptive quadrature
%call [Q,fcount] = adquad(F,a,b,tol,varargin)
% F - integrand
% a,b - interval endpoints 
% tol - tolerance, default 1.e-6.
% the aditional arguments are passed to the integrand, F(x,p1,p2,..).

% make F callable by feval.
if ischar(F) && exist(F)~=2
   F = inline(F);
elseif isa(F,'sym')
   F = inline(char(F));
end 

if nargin < 4 || isempty(tol), tol = 1.e-6; end

% Initialization 
c = (a + b)/2;
fa = F(a,varargin{:}); fc = F(c,varargin{:});
fb = F(b,varargin{:});

% Recursive call
[Q,k] = quadstep(F, a, b, tol, fa, fc, fb, varargin{:});
fcount = k + 3;
