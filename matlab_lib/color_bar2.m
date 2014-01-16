M=rand(3);

figure

subplot(1,2,1)

h=bar3(M)

for n=1:numel(h)

    cdata=get(h(n),'zdata');
    set(h(n),'cdata',cdata,'facecolor','interp')

end

subplot(1,2,2)

h=bar3(M)

for n=1:numel(h)

    cdata=get(h(n),'zdata');
    cdata=repmat(max(cdata,[],2),1,4);
    set(h(n),'cdata',cdata,'facecolor','flat')

end