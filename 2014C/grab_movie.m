url_main='http://www.imdb.com';
url_page='/search/title?at=0&genres=action&sort=num_votes,desc&start=';%1,51,101
page_movie=0:1;
item_movie=page_movie*50+1;
url_movie=[];
i=1;
[sourcefile, status] = urlread(sprintf([url_main url_page '%d'], item_movie(i)));
list_movie

expr1 = 'href="/title/tt\d\d\d\d\d\d\d/"';    %��ȡ���ڣ�'s'�ո��ַ�����������ݣ�
[list_movie, date_tokens]= regexp(sourcefile, expr1, 'match', 'tokens');   %����������ʽ�������ؼ��� 'match'�� 'tokens'
[list_movie2, date_tokens]= regexp(sourcefile, expr1, 'match', 'tokens');

list_total=[str2mat(list_movie{1:end});str2mat(list_movie2{1:end})];

%% �ö�ά��Ԫ���鴢��ȫ�����ݣ�ÿһ�д���һ����Ӱ
actornum_main=zeros(105,1);%actornum_main���������������ڵ�λ��
expr2='<span class="itemprop" itemprop="name">(\w* \w*)*</span>';%��Ա���ֵ�������ʽ



%��201תΪ100������ȥ���ظ���
%list_total_real=zeros(100,24);
%list_total_real(1,:)=list_total(1,:);

%actor_total=cell(500,200);
actor_total=zeros(500,200);
for i=1:2:199
    list_temp=list_total(i,7:end-1);
    %if strcmp(list_temp,list_total(i,7:end-1))==0 %�������һ����ȣ���ʼץ
        url_item=[url_main list_temp 'fullcredits?ref_=tt_cl_sm#cast']
        [file_item,status]=urlread(url_item);   %��ȡ��ҳ
        [list_actor, date_tokens]=regexp(file_item, expr2, 'match', 'tokens');
        list_actor_temp=str2mat(list_actor{1:end});
        [hang, lie]=size(list_actor_temp); %�������У����0
        buchonghang=500-hang;
        buchonglie=200-lie;
        list_actor_temp=[list_actor_temp ;zeros(buchonghang,lie)];
        list_actor_temp=[list_actor_temp zeros(500,buchonglie)];
        actor_total=[actor_total; list_actor_temp];
        !actor_total{}=list_actor_temp;
        size(actor_total)
    %else
    %    list_temp=list_total(i,7:end-1);
    %end
    i
end


%% io
[t1,t2]=size(actor_total)
fid=fopen('test.txt','w+');
for i=1:t1
    fprintf(fid,actor_total(i,40:end-7));
    fprintf(fid,'\n');
end
fclose(fid)