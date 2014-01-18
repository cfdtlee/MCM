function judge=classify(score)
standard=[62.2000000000000,0.0558000000000000,0.887118778427361,0.00442106460782840,0.0236140687796681,0.00336182336182336,0.00680037773315841,31.3282677058778,5.01400000000000,1.30000000000000,0.426000000000000;73.9625000000000,0.0955000000000000,1.27072568158238,0.00766052862242994,0.0841804029304029,0.0333005328568209,0.0630462471565020,7.41672413031411,28.7975000000000,4.73400000000000,0.785000000000000;80.0714285714286,0.0990000000000000,5.27565210828885,0.0156733315577131,0.250000000000000,0.121514770291678,0.130455251973837,6.66203754670865,37.7871428571429,6.07142857142857,0.987142857142857]
[M N]=size(score);
judge=-ones(N,3);
for i=1:11
    if score(i)>=standard(3,i)
        judge(i,3)=1;
    elseif score(i)>=standard(2,i)
        judge(i,2)=1;
    elseif score(i)>=standard(1,i)
        judge(i,1)=1;
    end
 end