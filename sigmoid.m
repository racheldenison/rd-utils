function y = sigmoid(x, theta, k)
        
y = 1./(1+exp(-k*(x-theta)));
