PGDMP     %                    y        	   SportBets    12.6    12.2     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    24822 	   SportBets    DATABASE     }   CREATE DATABASE "SportBets" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE "SportBets";
                postgres    false            ?            1259    24853 
   matchesbet    TABLE     v   CREATE TABLE public.matchesbet (
    idmatch text NOT NULL,
    idbet text NOT NULL,
    team text,
    cuota text
);
    DROP TABLE public.matchesbet;
       public         heap    postgres    false            ?            1259    24831    partidos    TABLE     ?   CREATE TABLE public.partidos (
    id text NOT NULL,
    local text,
    visitante text,
    clocal text,
    empate text,
    cvisitante text,
    dateini text,
    datefini text,
    result text,
    status text,
    winner text,
    pais text
);
    DROP TABLE public.partidos;
       public         heap    postgres    false            ?            1259    41296 	   userbanco    TABLE     K   CREATE TABLE public.userbanco (
    email text NOT NULL,
    saldo text
);
    DROP TABLE public.userbanco;
       public         heap    postgres    false            ?            1259    24839    userbets    TABLE     e   CREATE TABLE public.userbets (
    id_bet text NOT NULL,
    email text NOT NULL,
    status text
);
    DROP TABLE public.userbets;
       public         heap    postgres    false            ?            1259    24823    usuarios    TABLE     ~   CREATE TABLE public.usuarios (
    name text,
    lastname text,
    email text NOT NULL,
    password text,
    logo text
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            ?          0    24853 
   matchesbet 
   TABLE DATA           A   COPY public.matchesbet (idmatch, idbet, team, cuota) FROM stdin;
    public          postgres    false    205   ?       ?          0    24831    partidos 
   TABLE DATA           ?   COPY public.partidos (id, local, visitante, clocal, empate, cvisitante, dateini, datefini, result, status, winner, pais) FROM stdin;
    public          postgres    false    203   ?       ?          0    41296 	   userbanco 
   TABLE DATA           1   COPY public.userbanco (email, saldo) FROM stdin;
    public          postgres    false    206   ??       ?          0    24839    userbets 
   TABLE DATA           9   COPY public.userbets (id_bet, email, status) FROM stdin;
    public          postgres    false    204   ??       ?          0    24823    usuarios 
   TABLE DATA           I   COPY public.usuarios (name, lastname, email, password, logo) FROM stdin;
    public          postgres    false    202   ??                  2606    24860    matchesbet matchesbet_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.matchesbet
    ADD CONSTRAINT matchesbet_pkey PRIMARY KEY (idmatch, idbet);
 D   ALTER TABLE ONLY public.matchesbet DROP CONSTRAINT matchesbet_pkey;
       public            postgres    false    205    205            	           2606    24838    partidos partidos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.partidos
    ADD CONSTRAINT partidos_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_pkey;
       public            postgres    false    203                       2606    41303    userbanco userbanco_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.userbanco
    ADD CONSTRAINT userbanco_pkey PRIMARY KEY (email);
 B   ALTER TABLE ONLY public.userbanco DROP CONSTRAINT userbanco_pkey;
       public            postgres    false    206                       2606    24846    userbets userbets_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.userbets
    ADD CONSTRAINT userbets_pkey PRIMARY KEY (id_bet, email);
 @   ALTER TABLE ONLY public.userbets DROP CONSTRAINT userbets_pkey;
       public            postgres    false    204    204                       2606    24830    usuarios usuarios_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (email);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    202            
           1259    24852 	   fki_email    INDEX     ?   CREATE INDEX fki_email ON public.userbets USING btree (email);
    DROP INDEX public.fki_email;
       public            postgres    false    204                       1259    24866    fki_matches    INDEX     E   CREATE INDEX fki_matches ON public.matchesbet USING btree (idmatch);
    DROP INDEX public.fki_matches;
       public            postgres    false    205                       2606    24847    userbets email    FK CONSTRAINT     {   ALTER TABLE ONLY public.userbets
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.usuarios(email) NOT VALID;
 8   ALTER TABLE ONLY public.userbets DROP CONSTRAINT email;
       public          postgres    false    204    202    3079            ?   /  x???In;@???TC")??I???G??A??+6pP/?'? ?+?Z"w????}/GFL??b9???<?????7??!?^??xK?W??zi;R???p?)?Ay????[?VFޑ?V?p#?A$?!<?$?|]Z???K?"?{??.d܈?0*=?(???^
?v3?DD1!˽??؂k??{?x?QG?^???????ؐj?O+=??iG2?????cb?GУQ?he?ٲ?Dj???{??R n|?#?A<?s?\9???TA?ÕDD????FĆl??	<??o?+?p?fP?S?t!?v2?9{??Tf?HT.????1?y????]?????+??^??_?NhI?g??Í??a??.|&?/n$y???V?T??a?4?7!??m!o??VV??0??#EbW$????*?>????|1K	?9hV?;??D?59??2???|X?bB.?d*Q???#???5????4?lB?ҏ3?FĿ??Nn???ӎh???D\E???*fB??ǕcFDL??u???ꎔrN??x֎???W1???Y?i!c?Q.?[H?$??u???naBN?????
?| B?͹P??j3?~?2.?M?%e???5?5^?J?@\??Q???FP.?%??4"?v?x???s"!?t?<:??]?r? VDm??'??S?@?ݒ??ɢH|jb???d߰ݵ??d#????@?Y) ,v$??R2C??5?W_?҄\=?OŌ?/A<w??#%?vtn1????b?/`C?.??q?!?b?i????p???C?ʖK????􆜶X???X?<NVŚ?$t?#r.g???	?.??^z?T̈??`*fGV()2??u,s?9??>`?rv??"?'S???t??E?{??E????CJq??s?R4??E?s?JܑG;
??[??X r??vD?GH#???;c??X ??}?R??3?&}??N??n??c1ʹ?Ҏ?y???=??l??2???????}????:K?NrR@???I%?C?9? ???8??"3??" NC??4????,f?_(_??`1#kz??????)a?%k?H?@?С?s????gX@?-??????Q?V'k;?%c?{^X'?w%??~??
???5Dz???u??k??9?L?Y?????a?????[??s,Mgܦ?Y??b.??C??R?k?Գ??x϶??eFf??V??gG??13qV?ٖ??H?R?Q??P??E?{'???홑??'~?0 ??????]?yzR?"-Ef?4#????˚?%Ԯw??d??+??W??~Jk???f??? ?.nF?:???U ˎHvp>tq-?!??Ѿ?u?Ⱥ???????ĳ???гY?W?Q ?W?Ea????z??PM~#s??b?nt???#?EL?????1z?V?N31wo?k?0&)??%I^\r?
;?8?#??:???t?:??4??;?Bʼ?J??8uv9?P?4??W=k??#)?v???N'u(?J?nVnR??P?*??)Q??{???,dD???oB?+??>?q???[x>pF>?K?&???^O?b?q6?j|~??????B???8?y?ù[????????N?      ?      x???˒%G?%????b?
?f???e&*Qh<
?DU????- ??0"2{? g1k.????ed??pA?]?Ew53wU????!?]?EB??U?=ꪡ?ӟ?^?^.W??7?]ߝ??|?????|d????7'?Q?N???wU?;?~c?????>???_Ň?p???ן~???W???'s????sU??;??????ߞ?O_??zu?y<_??\?????hgG{???????o??l??>???o?"??9?????|9?\?z???Qߌ?l????ﰘ3Xt??????????ګW|8???=????R????n?sv6W??????w?E7????Vv????????????<?{?????????W7???M{?????0Jn??ɤ??ƞ>????g??>????|{????rOF???????޼?<??;ڦ?i;M?G???H??????????h???g?????|}w{?՛ќ?Ә's??L??UmO?\??d?h?;?????,)??iI???????y?Jo?n??N???????????v:???????v??3?ig?wt???^?{??h;????m~W9h|?f?l??s~?Ɲ???????w????`?????h????v???t???h{???@ُ?8???ds?˟?5{?e?C??r<??ho???|?ۿ?~????~?????m?l???=}~?p??՟>>}|????????Ջ????????5??a??n???f6????v?엉65n????<?5#.E?y{??Y]?|??M??]T??4ڹ?~wM??>|?x?ۿ?W??tf?>?6Դ???&?<??Z?qY5?dm????a?????????????]?~??qi??ױ=??&?AYަBk?;ί??f????A3?~P[?t?+K?L?kH???????TM??7?<??<?e?M???>8aw?Z??Q??.?i???0?ƕyos????~T??DO??e???̥?c?ː??8Y???m?rsVL?2?lW??+<?tx???5V3?~P??x??c̟?????;^??????0?l? 𘞃j??6?p=????%W????T{b??Q?b62??d?4????0gS?{??H??6?P??4???qS؛AL????nyw???g?Kq?.??,??޴?v???%l?G/? ?r3F?,?Ԯ?pt?	h?U?=?e?㮕w>_az?F?b?َ?-???>(F??,[?y???#?i?]??(???1?[n?? ?NS\O???j?N??????k?|?1??^????\?y??MQ?:??o?}z$3ڳ????^????D?????????Y?#pw?P???????\]V{?ʾ???p?ɱp?,s??vUg??L??u?X?A?-???j?C???lW?	Bqh%??Td4?.y??6޹?wC?R;????[?Q?9?b?xUV{????L?\???2Rc?	l?e?I?>???	^y??rm??ߚ?褪6??d<V?[?8?(?? N??~??W??????ۻ??ߏ??p??r???ǻ۫?ww?ߎ??ի???q?????N?sC?_???b???A|????^?1Á?o??`?0??????@?C??+??0-??/?-??AG?=.s'?6qtb???	>(co??[H?	;???x?ee?-0?Sdcx1???	??q???I?:?ٞfx??;oiot?A???????]D??n?q??r셿?M?????|???2??
??W@?]??N?i???v?m?\Q?)?=????????V={pj-??.?]?&?????c??X??.?h??y???}P??:?3???1EW????bN?hZi???4?2??y+?SC??K??b??`?X??fp?H?и??m?o	??(l?w?c??|c???{K?#c47%	??w?
?0??QL0??{[??.Gƕ????Ew???{(s.s?????J???t??Mm????`5??ȭ?O?30uZ??5???}???R??#??j?,??;?)?Z5??r\?ئ???U>>??MiY??K|\?U+??7?/???)Ǒ?آr[??Krd[???* l?Uף????????S?????ိ@9??#P?;?)?a??|?P?5XF??+??
R??A?D?Sev?Lp??D???&?ψÏ7Y??b"m?g?ǗU?N?aiX??(?_??????
????^?Q??N)qT?O|???eϏ????mw?S??:y???@?4?"??X?+m?????+ʅ??3?/?y#1/t0?v??泥Oz~???
???'a???sip??>>/??>?Dh?Ǯ!?
???;?)??nb?????`c???4?!??????U???@?m?-:j??3?%%xM?S?<?=v0sҌOw????????i????{r?<?X&?pE$???"*???l?gR?4??O-G???I6{?????k????ݶ?@r?6*?S(????T??a|???r?xJ]-}qJiR)h?Q|C> ??yD??<w???	F?b?h?tF??o8?%???E??2;?)??0??a?????`??n+???'P?fe@\nS?ێ?? m?
?@? ??}ԋs?fV??I?????sX??h???.ۡn??1??Ó{??????aS?e?"f?y#ϲ?%???蘒 ?)@??[?ø?!??I=??;#???ހvc?C?T??l*???????+@I?wJ???oώ?&:.1 ??ȠP?L????(?L???^s_???:l9]_LV?xB?sA?u?8ÒG????<#???;Q??51?ޚֵ"?.+l?
??8?=3??}?mYI???-*?h??ʞ\????-"4????w???z?????{?ײs??K?P??_?Z?(OJ|?X?%??[?vH۴?/?g??4b<???5??1????i??а(???jHb?-?7L?4??Qp?ܣ?MJ	?t	?ǧ	Wpg?s???)N?4Z????eȵ:??5=y7?֎??b?\??? ?9Q?_??=?%z?Y??Xcr!????c?NR?)o???????-?pe????ʻ?ɠ?????W??Y?6?b??5??e	??JJί*?kHn?5ncJ??Ǉ?l7?\ ??y?B????8;?
?/???+s??Ql?H??_!??2Pc?V?|?E+,??&d???d;|??X??
RF?d?Kj??T??TO&?'????l?رfk<?~Sw?? ?\?&;W).?F??'27??!|?[S???t?????J?hP?B?Yó?[?f?%???ԤCB>?L?{?N?X??Mb+?P???T?? Ȫ??y?{+g[?[$[A~A??VF=??<m>W?5f^?f?5-??2?D???[?zFn}???Q?dmR??a|?m??_$??;?˄??TRQ?????B?Ĺ&?8???\?*???1?????p?5?u???3??? ?N"?'??r?]?!ht??#??KU?;?+h??s??7?>?vܯ?Y??0=~???+??????V?{?L?@o???hx?(U??1OU+0l-?|҈???|Ɯ]S??????????u1졲+3?$𯬘?rQ???=?.?ġ?\?H?>??ϩ7?.2??(%?v?;?C?????9q?>?R???u?d?ɇ1?N$??
SxM`???3?LV??In?\???W?H#2?rE???M/?e?C????????0I?Đ???辦???????Ű6??p;FW?|.??????҇?????G_G+?Xq?dj?(?\?r???	_\rν????ۄ?z7uP/rT??L?~?DP$?_???????'
Ν rT?Ҥ?????8?l?R???7w???1Z	???f)???@??]????6??g?]??me!Y?Yљ???Л.Ut^?)-VՋ=? ^=g??j???Z??x?v??? ?	??Xa??_0d?@e3???/w ??ON????\???W6? ?/qv.f????????+?T4|??,??wM?L?S?&b֎2?M????)Y<?@Q??0???7?E h֊?F$?&|+?ֻ?}䒚D??D=???j?R?&????i?e??v@^???K???????
g????????d???ͳ!?]J?L?ѳ)?0h????J?J?me    $bˏ????߾??o:?? ?YF=ixu????yu????A?f????4?fW?hv?kL?]Ô??h?????w????????????ni?An?U?????f}?Ի?? ?N??i=???+??a?@?????-t?_SD??m?%???r???,??:bm?x\RG*???A?T??<?-????a?????!??en:ݙH?:L#?~?ލ??ռ?*A???3]?????8?ԃ{?S?^??ڿФ?-B??yT???D?i??D9???q???!2?l?|#m?L?5?,}2?=b??p?vEyA????q??h~??iA}?2i<?)??S?;1????(?od?k?>\?>u?Ľ?43??@գ???ʽ???
$?~?V<΋??LL? ???S?o*?Ѐ@???ق???M?R??%:6D??A?E??Pp5٥O?)?W????c?bi?]?t?E~Md?{?aȯ?\Cmt????π?DY?
e?|?r?v!w7?胷S3?qU3?Ej"??&G?t??H6̒fqLh;?}?*XBF???ǫ??CD׌????_?h??o???ɔ nġ?????vW?Q??.?<?E?{Pk?y^q?{?????=?5????Njfa ?2?pW?????d?OJK?T^e?.rYע-??؜?iY???C?"??b??ȵ??3?o!f??+??h??9i??????????-9?(q?\f_??S?B???#M?LQ??8N?l"???:T?ۏ0??3%?Qz??>?ΐ?D?Z?ǢB??N:0?E?\?g?S[?PHRw<t?p{z4?9??ʠVba?D@??`~?h?Ķ?P??*?ʡs?P?Nn?\???g$?7
????`ʟ??j?Y#?*c)V???)?n?Qi?7'???b?vt???33?x??G???58?m???ai????YQ3O?ި)#qփ????B?*?(?lѽ?e?P???)4I????P??+U?<M??eQ?W??DBC\[&28?r?qQ????|3K?=?jn%?}"????ݥ??u??4?0o?JR]?>^*???A?o|}H?ݰ2?N?)??	<0?0f{VHk/?d??yրha?E>?UͫqdA7?????mB\?+?/???'r
??a?M
]???W???j<?b!??
Au$?2???T??52?)?\??pO?=??8C??]PZ?g??Ͻ?և#<?=??????e??)???H?? ???{@??,?m???ֈ[QR9??B?T???d%p&tY'???`!/1?T?j???ʐ???P???*4E?Z9G???h?[g?LS?.??E?+?ԫ????>?)lT?q?](?$???????dB?ļ#lu?cS[ەЊ?????n??.(?*?n??[.n?a????K?1Q?FqW?9??j???I8O>z<U??*?D5???????a???R?????B?:jzq???t5sޫ=?Z?I?'$04???+P?)??Q?LBs?NO?w??C<?e???????G???a??*?m#??U??G?b???ѬH[??r?2B??[ԑs?a?? hڦ?x?s#?V?}??0?J/???)?PȖ<????s&?3?9Y?q0%???u/"?????d?????\e?????rՐ&=AI?Q??y?4?a*?zyws?????\?a??:߿;???_ȩ ?C?F`?)?oL??t?~????&??055y????????;??q???N?v;?W_\ߜo?c???????$????5??N??C;T????????????4?/???^????J????6?3F	?k??????q??.?? ??V⽇??7fA??
?_ꄈx?*???Ίp?????σ=?;;??=w}?=???????>?^???b?{???qS???v??J?!+q?'..??OHȄ????<~?????N?>??q4??Rtp???;???)?Q??X?"6???$?]~?*?I?>=?p??p?????V?)౧??Պ?????p?`sf???5/[?)L?\?V??w@???a?"bJY?~??b?VK??ʒO5MA4+R?Y??
|?~F?%RV???nC??"??8t?&???T3'+?? 0??A]=?x?x?ח????c??d?9k?qN??%???$Y?&Ҷ?7?_~??>??ū?W????/??מ?ڞ?|??%?XA?w?'vS&K???1?C{u?xw{w?yt???x?*F?C?(1?8$o???/GV???ͫ?/????}?4M?4M??,??????OF?O?y??e<`W???a??hM??6?fir?[??}??ԭ??2|s??6;pKh???k???Sf??5|?&?;L??d+sw}?/??E?ŗ???N?񦞚G?x?C?,??EMË???QS?????X?H??b>?l?xcZWE]
??%?v??????f??I??-Q4vrEJO2d?S????c? ????5R?v?VB?f????KO??P݂?un3'_H??6??봶??Xs?M?ôr?z???0?;\??m????=l?P?s??~?ϧ???WU?%?z???n????v?Pӓ??????????@28?ڟ??9?V?"?v??i
_L "?g??p?І*ԨU??ayˊq???5???칩?>??l??4??˝?g?eϺ???`????ظ?I??f?=r??݋]?'??*ÞYyk?
???ۉ????!?? JŇ ??????`g#?Q??u????F?.????C????˂yG#%??>^K???'f?R񋮜?r??W?7?M?n[??=?+ԃ܈??۰$?W?u?N??rV??,???b)?????=?????????)?@m?=!?f.???%?E?????u]??????绻z??.????SZ??sv8??R%ݿ?+n??.?W8?????????G??????>?1??)|??Z??p??_?/7o???/????}i#x?[??!_??=???e&8?Tx?W2?ǡw??????????n???|??r?'?????????'???????,[?$?2섦??0-????w?v????????ʾ:?|{s??['?aʫu??}XU???Go?????qο:ߜ?????????????݇?E?58ѣX?8?)?Ӝ?ܽ?K0??W?q6J?y;????4'??tUbt8?x?l?yœ??x???,<%????????KԄ?VO?? nO?G???+??S^	'h????ڧWw?S?U?????~<??J??Sx?!?р????3?|p??T?߈?*?`k?5NEBy?9?~??5?o?/?ӥ???Ǉ???'?E??????????&{??!?[UJ????????I????F?ϗTB???;???Oߊ???????w??Ǜ+{?	?z<P}?؇?"'?]}??8ߎW????????cx?\?ܱ]????B?a????????L????]???_???s??????t?>MG{????F?????4n3????}??:K???K??0i???I??*??A>??m&??5ɕSP???UCɵI?D???O?f2W??O???<?=6!???fP?f(o?e{<$n?[1??h??????r??aR(eUn?#m'^yI?#????ϐ???J??0????u???a;m?7 k??H?ke?K?d??H?5??ò?8X7?????䊴??V?D?͎?ɕ_?>A+?&L??m?Oh???>????)??:Fbڕ??9	?!?%efYH^?a׳???It??kS?????{????\??9????+??>P7??pza??}?1??^[?%???
ۃP`gb???.???4 ?S?Wy??z?؇??*(ƃ?y0????l-?????2?Hq?m???=??z?n?c0?֎???(??iL4}x?J$?7?7b@????l?j????W????O??į6?? ????????#,[0?8?X???x???4"?????)A4????>?????/??x?????iZq	?Lӫ<?OM??ܛ?O??|????z?};?q??^v??????a??gR?H?&?l???U?Nsܬ?????????[?tU?????,e???볫??߾    ?????n?o_ݽ?~\?э?j?????w??^??P7W_?????6ꁐ6??v?m?dL?g?<????t????????_???_?=??l4??? ?Ӹ?K~??????ʬ?rK1NƋ????ͫ?????P=\3?1?=?֪? ϸ???c???՛?????~?/???o/??N??{??9??>?/߼???????~y????????/"?/c?A???N?盫????C??/??????q?6?????r??.??={T40??n?h?};1??8??????o.7W/>\???ӗ?o???|??????Λ?ݎG^2?O??9???B?`?x2?!?j?48;?(_?????o?O.???Xqc۹?Q??g੨O_???g??]}v~??{????K*˲J?t??6M??o?e?Xo?&u??%?	d?ǟ?sΌ???7??!????⃵?}=?C??? ʏ????W????6??'|?????????zwy???L?͝B>+]Y?N?'Q??R??+/??qߍ;??9?6SF?ޗ??^6*?h?/??r&D????????qţF?`nP?_m"2? ??;?N?3kSj?H*?~? ?h#U??D@ i?>?Ѧ9}>?۫??y????&?`Y#??A??	lb??r?ɟ <??A?GO?? ??Mb?kY;???8
??#??K????????~????v?0?tY~???????g?\?i?D??i???sH3\[????9bW_?=??a?7?(?ov??z
???#??2>E?[u???ﾺ?????s?~?s?"?L????]??-?;	?.q?Vw???"ˇ????`???F??????w??=Fs??????_?>??܍0i1\a????9?r?"-?~&?uiO???????2?츾?u?e??I4???$???????+??ʘ{?Ӓ&?ת??~L?????J???3y??ߜ?~{??}>?/멄?LʨJ??FF?uc:??i??w׮9???s?????#a??*?j????Bv?q?????7??ة???b?3?Qv?GY?4;}(?r?L(W???ȉ??f;?&?>?2??M?X!????˸?F??َ?v??z???Ǥ^??f??(+?d???? VMf???L?w(?n?5??s?&b\\??<:r֚'F?.?"?Q4??;ޤqZ[OZ?O????????ˬ6???or?? _fg???A??5v?U?:?i^e????9D??FX?w?{????+????9?g?/??	?2?)???b[??%??I???8???????<	??B?&??Yv?????W???W??H?؟_???Y??p~{[??)?y?A0??"??&?ʕ???? 	?%????????????q??<u?|3???????U?.x?$dʰLi ?d?6?뛻{???????}??<????????{d???a;????O??q????b?????>y/a?????ӹ?????'_??59??ͽ???찭 ؝9}qw??????z???0F??"%R^?dM?WW?w&z??"? 44??X??L?~??d?BB?{?@4????Gf??~??cl]=???????fC?z????N=F??Pfl?????DϨB??? p!R???vD??qn??y3^W7?????????s??muy???<+? ???Ȧ-Qv?{1?hO_??}?????????+?????e?n?x:'?L׮=?.ʹ?I??J??,?#??+T?ξ\??*?)????.^`?O;???#I?V?k#??5	?k??6?(?f򐘘d힣?(?؝?ZL?PX????4???O???5?xaC"
??s?yQ??Or????v?oK{1???ϔH??r?Qs????0&?lS??*?'1xh:????p????????w??Ǉ?Vn???5i?bh1??fi?8ߡ1?IU?jm}S]1?Ep:G?C\E?O???XA?!hk???E]QG??#??pǭ
q?/.o??pf?l???????????????????9|?Ӑ??f??zg<?9?
??C?x???8???r"s
???\i?G{???S;F????r|ͮ??????'n?e(N1r?%???Y??J??V??2?^????????*69?Qc?(?L?I?I~???Os{?x-'??6D?&????ʲDvQ??,??? ????|5??$,?l?Su??w7?, (???]?dw??i? p?-?em????*?L???x9??f?Zӈ?n?ـ??Z.????&??Bt٪????:??????S枤?%xb.?L?k?8^EhOj?}6"?????qB/?>I???;H_SY?P{n???7??d>?इ2???@gl>????W?<?No?Kz?U??<?P?u?RF??ݽNى?q|?R?q;?:?????Z*?n?????J?????R⡓j*e?vẽ?_Z?p?????9?	8??ٜ???j.?okqє??ҷ;??Mu;???ؽ,ɹl???!	 ?"??.?;l?;?Y?V???~=?h?%%q?_?\KƐ?th?׈?~L?eu??ﰾx?N??C?T???7޴?OB??IUJwj?Y--q?d?#)?ހ?ͥ?H^?J????M'?SV???k??s??Md??z?Ҕj??O/Y??????Վ??G?v?x??ثo?/$!~-RȖ?B<a?ļcy?Up?ä?????C??]?I???H$??n? ???i,?????????2% :Y?TV㪤?;?X_@i}yخop?s ?0?gסZR.???=?l??a???S???????S?????v?&Ϗ?7?gO˷^??;VVI(v???bǫ~?t+Y??????[?????????aeR ???y???f?k???{@?1??S?;+?mJ???y?ԘX??O??NRc??/?TS???Jiw+?y??M?)?u?B??κ?n?V#?????p?uc?????Ѵ???g/^\}2????J?ۙcYnKp????jP,???3kcg??p^8y???ؑ{
???u?IAW???CYsX?o????L??&5?-&ڈ?mS?c?????α̠??̉5.????ݙ1??ˠ[??E?[?~??aaw?NL??ۤ??,r?j?j`?N?4?2*1Њ?e?ᆧ???j??b?\??Q\?Փ߱???q? ???0???Y??o K?K?C?^ kT)A?̰??kq??P?w?^1?t+G?}(?쵕?c@u?>??????ʫ`?o????߻ ???+&؇U
f?3??5l??:!d???_9gǥix	v?? Q???\??g??4<K^???%l?Ց?j?+?^??G}|????J?1?ղ?pJL(?v9??6uI?θ?5?W?Z????/?%?q/-EJjq?? ??
?2???????0L(Q-?w??d*ua???1???ש{??D;?(3w(+x??wE@??)??2?ˠ??N??????C|?RV??qUJ?з?! _??O??+?Ȕ??.??y?&?ț??ա?zg?ͅ8=??L?E??=?C(x-??~?u?P???2?ٹ?6Y?x?P???QC?h	??4??9?"?????? ??Y5q?B!
ipL??yjC?Y???!??a}#??>B?_ܟ?Ϗ?{q?n<U?F?d???n?|??:!b???j???z?1???5?	upN?XyY?B??? '?MD`pI~?H=?>? >??.&???8)?\?^M?????\????_???{w~???7?????a"U?w?,??Qk?g??f??r???W??.?k;?<`?6??(???<+?Z??????<?^F?8
<z	??
??Э?U"???P>??r??
'4?^??Dq?]?E?S?QQ???sW?=GL?X????q?}???p?e?2pأWB?ځ?)??5{
?2?{?5?*?{????????d??Y3?I,??քۆ%y??y??S??W?I???%???cm?w?*?W?V??E???Atk=R?W6S!y???$?rQ??nz?A??5Y`;???t& ~o??a?~?|W"?L?(??0j??r?1?a???_/D?a#A?2?P)?|?h"G?|?&??m???t?a?    ?L)%D??f_n
??????t?c?x? ?? ?"*???=?[?????O+?????(?P??J}?@???)?'A7U?Y?????6???"?$?֝????G$B?5???_@E.???_?8Iz?????P퓌ģ??U?JC?ۣ?#??d
???5$?2??IVlm?&#ٌ󛔓?iS?;g7C?1.?	Z?V'???	yB????WB((???!'?6I?OY??% '??U?Ye???"?X????	?&^??#??????nYm??-?Hxʊd?p?????sK??t\)????M??[	(c0Ɋ#Ӻ´Z#KAbZZ\P?? D? j??\ƴl??t??????,?,?{*??-?pE??#\?N??b?ZQ?C?으|+?O????,?1???M???Q`?ɤ??TF ??kMֲ?/-i*?%??oS???5?>ˍd?(??VI??ъ?_??@?^:?I@?D3y???N???????????k??e}/?,9??ءQ??^ ܏ǃs??i?;????`??̂?//???O??%y????n$?$Q?}?h?Q???>ʕ?Iv?X?J+k?A?2??}?+????'@?O_+0?N_j±???""??
Nz?Pd\2f綟N????vO?2? ??`14??Y;????F`P??3?51I????`?J?b??#?[?_u?
%??.뫎?? ?~g?bhp??d)???}?="!?\w?o-??{??'|?N]2 ;,-uF?iߵ???+???)?\\?tK??V呼ע;E'?ڗ???????f?|7?F?wFii4?&?	?!H??_?K,?,9??*?ErS???f?P??Vi d???`*X?Ÿ^??;???d??I??^?/ϯދ?G?????$?:T!?RT*?F?J???!~????v=/?q?K???VJȕ??a΢???c?P;M6?J??)?$F???y??<J:'???3??q????k=?NK??>?}?????n??ÝDߴ??F8_?W?</*w????J?8a1?.P??????nvZ?q??Vp?	?? ?`K+?0T????k????#?C???N}A,??S?]?-KhÖj07?Aҁ???ӭ?&؞{?Y??t;???%JF?U???Zh?*?;???b)?!gC"??⨰?????;Iy?b???ņ8?d? ???x?v?|??4F	X?,*??S??q??L"?m???3z ?\?"?ƶ@???,ƿ++???b??l?ظx?u?B)??k??W??e?Yr??]?#???-I^j?T(??s?)?fREᓛ???W??Ύc???'
N?'V???9??><????????`B???Z??s?F????Q?6|?u??dF 1?DxP?F??[?`5?9T{2??U??;0?x~??x?~????^n?>}}????ۻ???u`+?c?p{???I?=?&/??\+s?z?8???(?熚':?g??=??+?T??*?@?!?Y?# ???x????_??8ٿ???????7?x?%????8Iү6&O ???nλ? ?Q??I???T#??7@u??A<mt
??h??\$K?>$+i͜?z??x?]}~?????j???(}w????Iȶ???5?b????ؽ讻-	"?Ԙ?x????ԙ+?a? P
?BV??$?4???A O1Izk?}?B??/Ҫ?a?EN???Y?y?#??W??nI?h?r?
????D??m?QǮN_JkUzz?&?u)??;?AfطM~-??}7\?iJ!_D*x@]*??`CӮ?o?z/?r?????c?$ټS?O?wv
?z???4?ǔg5Ge<?,?[R?Z*?{yQ????z???h=vڔ???6??zy?K????I&N????K?s)????yB.??M*??;r?~;-?8?z<?j	??{??[??Q?#?A?T??X?H?	6???x??"??a??b,??
?E?HE`??[RD
`??龜??}???nǨ5?????	̭?[s?n?4????>v?Oy1A6?b^u??DR}?VM??#Toܧp?Qʳ?P?Q)?=?D???_??B?a?F?\?*Q?K;?U????S?M?y??6?????"?Xk?&?P?>?$???%?FbX?M3?f?KM?w?uO?.\?I????Ƴ%?K??]??B?]???D?8?BcC?%Ȫ???Y_/?1N!o?h
[F?Q?j}?DZ?~?O??z?F2)|O?i???eH??VT?FH???Җ<??ԯd??;,6??4E?9?2Og皩'G?6/??1?)4?he?b???4?&?NȬqv?*gɰ?)?8??̪??L 7???	Z?4\J??Mh?,?yy????q?u???b?<Ũ?;?;???p.??$???V?8[.???????d??5??7eԖ??'?A?????M:??
?<H?u;?j<v?.v͢?#j?a???>??ԷW????7?T~B?І`p?4?ũ/ﭬ&??/hA?ԍ'?ui??bI?=??j?&??4?ճ[J0?X? ??tѧHX?H???????Xc?a6n??bS??ӫ/P/<?????T?w??1?&~????eR???8?:0?1???A?O????ٛ?d?E???Z????h{??;_kJ\y
?l??m??;HD????W??????l?ä???vC??V?w??@e?5ā?#O(X???>4Ð}?4?<_?|?=??U7@?N?uL?3??Oer?
??A?>v??L???>$???]??pɺ?3?i??Fd?F??t$1Y?????%?MY?zhQ?⪣EO???w?x???}??R???????2)*??zM{/?3???ZBA[l?m0??xd??g??? ?Q?3???6kED	'+??xT?L??S׮y??&?R??bg?LY?>? Ѽ?O?Tg????<?:}BH?E:???Nmrujlv??CƘ?-G?++Z?F??<????]??J#?S`???Fsf?;D???b????FD2?+k???`?uUe/?,>!?
?̍??ه??|4????\??r6?hJs??S???o??????p?ol~g1w?x??????Pv??Ee?S;a?~?????WW5:???OݝB'?ي??ZT??] u5????J?????F?????J????????c??/??Պ?,*???????:????j???CAl5Z?n?հ??$+az?????ϵY,??I??nL??4,?A?u???۰?K?.???yO?|?u??[]?6BL?(.???o??????j[??	1'????^???7??T??4???S?bE??te??:c ?8?_@??ʞ2vp?FƘ?\????ע????i?;Gb?nNG't?3?	F[?0߈??i,???????j;`?@Ŗ?l??x?e???x??9w??????6-8	=?[?^?IFS.2Ę2?..7<??ˇ??.???U?tBy?坯j????C??1?$?Id?^RJ?@?K???MD Z?^??8?E?q`?귌W?s??????EDq????\^?=	%M??~??,m??q Db?]?k)]???Oֳ??/?c
' LcJ2?C??宧Թ?2??Ø^?0yB??^T???4??{?OR?k?M'6=y?V?1?????Gs?9?????K???\F?mjsĭKo?b`G???Yf????F03?5?*?D???t??#9H?,?I	?JLSA?v????kD???)??A?>?č??2U?
???<W?~e????K?K?~??z?"?S?v?V&.8c?X?hg?????????6;?V?zٜ??m???K9:???????%
??47?	?????6?ߔ-^??+?	}?ei??/i?ܕ2-?h???͍?YED?a?(???l?F?VF?????????c?Y????ЇăRDn?2?A??	?1???R??.BM?EH??aՇ]m?\G,?#?????ao?A???????ح&+???RZis?Z@G.dHEQ??(?r-R???Sc?????8??Q???Pj᳗? 5`?=t?ԑ??+ɋ?5?Y?r??6???e???Z,??P?ɕk???y	???m??j(?%5K?i?????5?C??T??GʘxL%?7???1S?K?v???p??p?xyyk	??_?    ?5*????_qBL$R{
/ q?&c??K%V?? x?z??(??˧?r??洔j&???:6??S4?E????-'ķѣD?4?1b_?	??
?"wI*d}']???d?P??g_y?X?? ?v)#?,?X???ѲuBK̘41?1?M?2???	+????BH?W~ߞn;Pð???t?K??.?H?f??ӄ\?(e???:056^+???VViaW1z????EE.j"	??v?f??iW?[_.??Zr&??????0?v35?A??<??????l2????h?!rBh????Hu????|(?S?ѫ??\<!=S??9/V?m?ck5??H???ȗ3c??O????????.????'??s$?? ^?(?????m?6?8	6i?{?V????6#A???!&?I;¸Q???5?r??!?/5? b5k?U?*?m?????
?0?ӴW,??h?Wh%?=ͬ??u~Jo??/}u?ZCb?w8?r?{????&?z=???Ա??f???/xy/?t?E???7$iL????H??}5?????鳍&"\3$3?hה???C&^	[\?)??ٔoi??	?ٕ?<q-&nC?????ݒ\͋k=??v?Ib????C?/?ȴY?g????V?w?V ??$?Ua?3.?ֻ?)%?8@?ŜG?5?*?6???s&?փ???OK?"??{?`S???3!???ڻ+CwVB"l]H~?Vϻ???pw??????6?C?f!JN??p??f?/J??(k󬠱?([Q?`??t?<x{"@?og??N?)???d1[R?uzi}6Q>?$??E???-ǃL???K-E?$?vwYP*??TI?"<????E? ?:ـ?{????~X?
??K??????Ms
S?5y"F?|s?L?U?k?LȈ?x??4??>?ѧ=???S?n?`?UI.d,?^Ig#?0???E4??CO??RI??}m/??{?m??t?????R\
%??uBx딭?a2????g?d?? b????b>????W??:?5؇?*?$????@?5?&KFh?d????r??_a?????#?????G2D?y?la$?iB?ʙ#Q%R`????~*R?8???ѭ?(????ye??3PP?FZ??§???U?=nK???4b?????^???t??k?I??f?n?
?h?G`P??.[h?8?I?J A???$??;?'}??s	?uA?S??ē?????߰> =??;y?Sx9e\?&?[d??"???s????G(?ʵ˗3??k\U?j??ӱ?T???Zrj[a?T#?MЂ8!fD}?]?????'?D?·u?qS?{??1?9?jޝ?h???^??֩?$n?|?C?
UjY??O?0??'?6?o?}?e???XX9D?{???hW?Y	??!yY?d????ہ+?C?l/5??????{???i0???p??Mw????Z"?_?v}Y"??fR????*YmZk/%-?r??S`^%?T\4/8?ePM8?f^qq?&P?%?\?Wt???۴?_?V??`???s?5? 6B???$?T????ɣ??wNg7KW??XX?1?6QH7???PJ??*?#?k?I&??ِ?ke?<0??U.?k?l?Я??e{??p?۩Z0??E???X?;?(??5d??.?P8ʹ???_wSA?IQ??JJ??B?;?Af??zI8J}n?y???Q??5??:J^???Ӡs	?v??֔D??Tvhcƌ???p?ʵ??A??)?,?-7?dg??VS{Ug?--6?$?:	Eى?T)??????8|
?D?2????:^??	?6??M0?gx9a??G?$-v????u?????ԁ 
???&???R?7hI?U@A?:T?>?ݣV???.?J,?F??I?}??ѤI?,~??d??2:?$?d??$??z?86??*?)??rC#????;?ri?bPX&mv????W.??,c5(?	XL?p
R???K?H1H)???5?J?$??AAŪ?0ayuR?????????j?)???}@ą)<????q?uVǪ*]
???TW?4?4Ԅ*?H??gg????,??|.??x?I??rEJeD:Bp!!a?????l@?/>??|"??G?\SQȁ"Yֿ?d??Aa?5??(`2Z??.??˅-???l??????:?\js?P?ژ??&=?f唗s?5~?so??????0f3??pe?;??ט}?r?bެv?Qp???M????8?Py?>??!??wU?0?]??!?C?k14L????):?	??8???\L??g_	?ɽ?;'??@&?x?y??S?TDL?????_>?P}z)?%ڤ?6??I??c??|B????II???r?P???lt?eu???#z?=??B??J?1W???@???k-??BI?fO???!????H?T}U[B?9?,?a?K????>I#?ljL>@?]?\?jRr?R?FlVoF?,?Dkv???c?{?????*?E?V?֙1???O
Um?Y?;?k?krޜ?g?????=㳌}f?L?p{$M??A?)[r?	4??(G~5??8TD?????K4??(????k??e/a+<?Eeh????˔^L/?b?*???M-?ݕ?i??7???h\??g??VPKWn?an	ʄ7ˉ|?Nw??D?r<n'ڔI5h?;¿\?nf?w?????BpE???4ym|?6S??.??WH8??-\??^????j?S????n?	???#????hf!-"?? ?L%?<????s?ڔy??(?_?&z1?Oa'tJ}?B???t?l????sw??????:O!?q?46J?Iُ????V]???
?F?`?F?S??%??{O	???ϫZM?)7??5V?m??aD??䴬?????]?`??kk??;?K$?H??2x_?r("?|??}?+,????0?Z?Ԉ??}'??en4?Fi??z&7?????Vc??3?ʌ?K??T?NU&L??<???[?i&?|6N??U??k?JP?Y?[?A?[ ?0?/???.??{5?;K)l????n??2?L???JZ?UU?l(+?7zD
kyRA?m?ј???|Ҕ?Rk?+[?Ct4??L KXCk?ͼ%???B??o3?????)^>??V?;(?Uj*?HR*??ϛ????#?	??5sFK???)?(?OJ㊢??2??jM??(?R(R͞r??)??"?A?K?$??eDŖ????hӘ??.?5??y?? ???$4??h^#I??A񫥇??"k???JJB?. ~?E8?F?c??H??XSL??L/???!??`?i?+??Py(?t??׉?ߔd????aC?O,??-?1??iHU?4???؏?:S?????????>?zl*?I$.3`????T?ïA?N?,o?<??%bðEz??Gh??Jg??$??6I??Z??f?S&??Mg??2'D?U??R!????lѣI??"???n?S??mH}????p?\P]%??,?Ւ|-???kS?WYa??#vx)?E?ފ??ҊY?3?t=m???Jj?Q&6?qx8{DP7?U&???W??*FG?`??<	?yF?cʚ?e??9?O:TC/S{?5CQH<???N???N}?C	/2??-??????40j????4?_??u???&ʸI?5??"??T???d??????J???+ž}7?ߍ???zN?D?\?^???
???6g?Ƶ???^0?!R?:?g(?J?y??Ɋ~I8?xBl??SZQ^z?,??uϤf?%??
?/???%2(?$
A'+???iZi{???t
j?D?g(y]??z?c?9J+???<]q?趼U?RUo??#)S?}Y?T=?א8}??υ?A܋??ή?q???s?M??p?Af???	Jѳ?????X??b
TzKe?0??{?z????????%֤U|?]?<E???r	r?$Y??jm?Yn[1?UR???1>m/??J??)?UwfKH?͍xy???4?`?m??y?K?????Jb???ሽ N?ʐZ4	M?v??G???^c_Dh???Z^U???????g??5??J??b??ѷ`?????%DcO???b??ʒz??!?I[i!g????
y?v?	'ҕ?$?}?q?s?N{?:2???n?3?V?T???y?    ?Ƿ?Re92???T??כ?b?VS?Y????|??:????h???}=??o??3Eu?	Mf?XK9?A?t?"???6R?[Y?WZ?? ]hM?f???ETmj?=??????"?;?\??xC? ???n???!?B?Nu@ǐb??(??d ʞ?&?t??+[???? ?XϹ.ƾ*鶴??F,$??Hޫʲ?5?6LU?hkh??T???5=?????5O???n??????S<X?D???f???XyV?l?.c?.[?h1U#??b?ʕ?k?;?Mۤ?v9b??x?WLiߛt?5y?????grʤzO??,?@???a?
??u.??,H?Gs??|V????o???N<?(^?mr??4???TdO;tf?lۆ?^;?Jq????I??,@?*T?????I?~?m??Ι?Dgp?xy???:?G?]?c???f^ð'q ???f?6߼????w7קO.?w??W??.???D?Z??ֈk&;}??7?&???h?|???ݸw&???B/`Zϙ`Xk?:'??.??0xȣ`?j{r?l}???L?ʙ?vm??.`??J?a?_t?:?	??lH#1z??2?0??2@????\?aJ܎??V??:??%ު1?h5??d(	??5'l?201@ΐ?!h?6T-%??d??䃦|?^[D??=??H?j?????}
=??&??]?s
???$?H??XiDy?65L?^?ݴ?}?#?????j?J?ɫ??D??????T]
?S??b?]???Uq"?y?}????v??oǑ???s?
?Њ?
+{~????E?R(g9????????????
e?bl?9?8`K?? ??m??}???W??ǘ"?????Y?j"?J??<???|?? ?3A??'N?*?}??1k??j?q뮉?_?>)k??e.xbL???R?8Q??xs??Iԭ?[_??A??f???????T3??)?7?Z?=?^??Շ?ICn-??elLš?0?n?jfKn???6?w??Dė?M????>???ɂ0???ʔ[+???P&?`?~?+/5?4??????YY???????GݝB??a?Ym?i??V??,??????
p?4???*??ć?k???9JR?R??V???P???̰M?ٱ?n?g
?D??cQ?,.??,???????q??@??(??????-?????(K?Q?#d?15??3r'!?W.?l?^<"?s3??"[??Kk
pv????;?\AM?U_?D??? uA!?ĭt??)?
P\e?Z2??4???D?ஂ?[pq??Fӓ?_???njI?F?)?gk??=? |iX[?̓Na05?I?[??(??5??N?\}}??|???.???c??6n??ƪ???>d?<?cƃ???_????p?ӛ7W????? ?$?s?_?/ ?>Oy????r{??vm??ק??y;?=????????]?????Pk5`5.??C;ɪ<?G?竗??)?^?????g-F??癙u];?*x??f?U??EI??@lu=q?Ȝ??-Wr???-~ê?>o?C彄ntr?	?????"4????6[W?"`??F?K?'la??R??? ??P?*u?0????/?m!d?&7JR?]B%ВS?vå?B?W(UQ?C~? i?aH?&]????:??G?t.??H?N?ͷ?Ǳ?-???+??*??????^??Q?K*s֖?rKK7;)h?@Q?vRe??\??2?~'H???̬B??D:??󦐫Nvˋ?]?AϘ??
?L????r'???
??&B??nqRՔ?c-cEK?G???V/????jX3WgJu??6?Zɖ?uj??f????[?}q????Q?#T?ܩIRT?F???I%??_J??u+??>??Գ????e?UJ~?VI׀2H?J???\?>}먽???+U???Z?s?I??-k??R8و??&??ri?",i<ܠJ9Q?m?+??@-w?su???+l??d{??t?.xW??Y͛?d?8??h??.??g`?6??u?q(7?%9???YZ?֓????K?9Yn,z????{??UV/??Wn?#mb}p?Eq>P??ECm5'???8YET??S??J}M?r?:??X&tKc5h?d???HyrI}??^?Jbʜ[X'???L?S<R)n?????DT)I???G??;Yf
??S???k??uvZ???*??*q0B+??y?7N?g+ŵ?QF?? ??Z?~?_J?-?<?o??c?K?r? ??>? ???8??E?w?b?<T`.?ڣ?WpztF%"???<\??(???? ?????I??<?X?T?Tj)1&e??8#??^c??B?Y#?????`ӂ?C?B#"??)?c??i4??^?C?[?3ť??>?)fW??u
*?0?8{??????
 ????1??\L?\??I?E??\??*?(???a??z`?S? iϺ?6+??Ҫ?????4?CҒ?Wd[s@l6K
?psk"9??aD?B?C?ᶚ#?!V0???6?09j+=S???????"?QkMĹ?o;??l?[????????2v^H?.??te3????????ϗq??!6?,?!/)0$??O?i?̰]?ٰ?w(,`?[????+???Y?????????㦢a?!v??x?(??:?	i?w\?W?w?w^?&H?????r???.&m49??????p?????4??%?????f&)???*??qI/?-?a?YN????aO?S?[~??v<?W?C?[Z?	n???uQ?$???M??,?զ?O{B?y?&$9?$?<?J?????2A?|~??v???1?!??y]m? X?x?ꆤ?{H?w??"FE?E???%??HqѶU?_=?~N??nx?O???*Rǜ3W??*?a?Ȓv???O??????;?,???3???S???ώ???????W???
???j?/P怮v???vi?>?V??\<?m}?M?G?????kD??N?'??[?.<?_??PW????[??H??
?+??v??R+?J?Ju???J?Z?k??ъU??!?!@?jEJ
?q}4
??@?\?7??E?s???Q24y\ӄ?aJ?7?N??Gd.]???|ί?>u1???r?U?q??M<? D?)???[!B?sٱ^??tݑ7?[#J?Sg??.??a?H???q??.?6qgӡW???)?JG/?~\ʚ?3L?H?b8??????h?$?F`?=?4?[??<+]*??}?J????\?n??????xe???M\#?=?2Uh? oo??	p+T??@g??V??P?????2?	$??]?|??#??N?)ʋM?-o????,Q????Ea????ֿB?U?7??mЊ#?/???>??^_#J)?D?d?ɱ?(?Sz??^)?y[\H?X??Z?.iP5/ٶ1_ø???<;%,?Wy	???
?Q?4?3S&vVYAM2?}?? z?d?}(?r??*X???]I?"f???:?}??o?;?2V9;PS2azQK~??pIǞ?M(?????????9??G%6?eϦ?kո2Q?J??v?:?y~???ǰ????`?ӑ???_b?z[?ךV????$?????????v?L:%rk'a?r??&?4p???T?H?OjmiM???tS?I?Umt???A
?2??ܼ?~BY?Z??[:U?K?"??aQ??Ivw????k????.^?F6?8??Y??kJ
?E?[???/?$?????S?j-?Z??I??n{
?w???_?w???2???{?V$?O??7UV??????c-????פϏت??)m?ʒ??;W8_H???I?????hZ8?ff??~KZ?]????n7?̹R??=d$\k??u?Q???<]???n???@ӜK??T?}E??????C??sJ^????*+e?|f??^+]#?;?xB?]?߭h??@?9?f~??]?M?~????眿nd?-q???i??>?h??m-???}?N?????'?3KLQ???->se?5S????HU?y?`K?"?P???T?el?՗ޜ?)3i?L+s?
??̔+Yp??e?Ъ??????,?d???A??i?%??	\?j????(+m?z??ǯJ?ڕ??i?5P-z??j??3???
?'???s
93?????q?|D??    5?.?>?)Z`fS?FS|S?o+????a6?Aun2?:?E????	?? [&?k?%*???t}Q?=MܕYo?u^m?C9???Uw?uO?m?MJ?qSL?????<??*?????.A?????Oʽ?*?????'?]C??Ra(إ??f?=??2oU?-?x?I.uUi??~????z??B3M!;??YF??@?D????u?? ?w?!*[?T?ɇShT?1_,?Ԁ????ઢk?7??^V?c|?)E?諫+Z?收?-????࡮?r?T.?U?7@?b???lʡP3?-ys?blF?????ț??:??eT?-e??T??F8MJ[?/?7??k??)?h?G	?.?JP΢?=+?-5il??*??an$i???'h???&(SZ?R??5?Z?z??)??+S?2??2?Z???ryk?v\$6J???L]ӎFx?????5???????Nև??x?V?????[Ҋ?p??<]+W?Vk+?z??I(?(?_???=?h?Br?Y?\/P?F?9???<?o?$?+_aN'???-'?&??PW?,?]d[???8v?D??&G0jo犍?????-5??V[	Ɩ%藭?F??Ѣ??L?
Up??:??E] N?դn??ԥ????j^?!??W?@??Ќ??4]E?&??d??e??:?j?Z???????q?]ߞ?{?????!??????\???B?cK?I??xtgo~??z}^*???kE\??(\?(zj??e??e}h??ݢV?^??'??Cy#?3?U?^??XQivw???F?<???????M?????
?????,jP?(6?R?????8y??e]v?A???./??R?????K+߱՚?e?F??]???Zy?k"??%¢aˊ_??~Y??n*X]yX???PHmm{?K_uYFU$?;???	?7Jcj????I?|?_<?<???[I}???2Co>?{?h??@jI??Z'?b??L???LA>?5??
?0?Pa5?`d+?k??(y??afS??Gi1??Vq?2锌bb??7Mc?5?(5?# #u????4-??Dnڹ ??`??^RV?Z??v?D??~??jI#????5	'uK
N?F?.9u????]ã??Z?	=?b???i???kRc?A!L׽\?L?^+2??z<H?? ???d&?V??6/W­OAG?g;?3}Z??k?8?KNl??z[&K#u?wS?;_nO=?7|A
?W?E??A?????;@?;???p?	?s^]N?1b???J\??`'?Ք[)%3F??8*ˌa;}R'??YW?*??g??,??-Io?Rkv??R+A?(%??q??Ũy|G????C??9]/F??e1&??4???,??d??B?1?#????+??f??>??CI???uH??????ZA??KL??d?1?????,a??????Uf???YL??+	!;? o)????=?/?&?r?????Vt???MQ ?GB??s?:T??t???tX????r???o??P?@?z*?1??q?1?H??bHCÊ2]??2#u?H?4??1بɴ ?-blt	?>?Dhݱw"?????A??{$'~?ۺ^A??yw???e11?S?YM????˵?U)	??v??xzS????m
??E*3?r?Wns?3d?hL?Ű2?:??y?D"?V\???|???n?:>IM,w4????B??=?9;?)?,?B??aL??9˱?nn??(%?U?????W??mD?ʮ?r??^J?,? PQ?q??#??!?`??u2???r??~???!?Ј?ԅ?"?????5a?E?7??U?t??cl?q>$??j%?Q?)i?L	?/?K.?l?uQ?A??B=y???k?fr(?TA?%??o??Y?l???&??????r?ɣI>??^_0??Dv???'r?䵴?8l?>)K&1g?ە?bJ??Ɗ?}??1!Wi??r??$??7{UMPb%???O%?P??5 ސW?z$m~Dq???M`?;-?U??Ƌ?ՑWZ??ʻ?f1=????7Ȧ?;l*w??t???G4LO?jv???l?5|hzhݞ?ֆm??]??.??VvUioUZ???4??i.?⻌jCN)	???2??C???V????xB)?(t)?????x???c F???"?I2\???_?˧_~??yW?w7????2?U?M???B?ԑ?]D?8Kf?7?E??$wd?}????'t9?)?y??
^??V?y>\?l?5vu???!"?????
]?????$m??$m?y??hމA???rk?߫???Z?&??C?9ם???Td?>??*??L?S#C,H??q?{??TO??V\T?????U/??KڍP<???B?'?+??ч???A@??v?`???Fך?.y~?MI????	??<\=??*???????/?K??[R?m????X.?@ڢܧ?v?2E
?(??0l??cOLke?y?h?q???*???qtZ?&v???/A?+?oSn???????Bŝ??K??????ATX@=/ժ?217e5[y?+?+Qa???>??`u\???kD??>?f??*q?Z???????&?|??^*??'???wp]?7??Qo?"f?y;?!;?q?-rl???*nw?Ĵ?9???r_?jJ??Q?Թ?S4Y??????I?`???2%?b???Y??(3??s?B]???U??h9K@C??Ʋ???:k????Op??t???QL?*{@{CeV;???R󧬱?2?-r??o??md?p?_?}????b?W?_??nzs0?U|?.hC?[?Ihue????z??@ӑ?"	U????BgFc?	wy|;????-m>????š???3?5??j????:^?>?fm?e?b?Uܳñ2-G?a??c?<밂?:???ʃ>?E$?|4?&?fp?eKD?W??7?$0???? ?sV-K,"?K????&??????-?????Bx? }?J󗪧???0}??>nr?P<??%?r?MLƚAX????
??ҫ	 i~?;?vF?
????/????:????Zq?IeO??9?????꧘??~}?>?g p???m2????!0?n?e???d8??#?c_?(????(_BJ??M?>'???????!?P^??Cn?G??????T?`t?)H4t???9?5?
<F??&؏Q??g??#??X?QiG?
Er#?Q?me?*(??WvT?Į??AU????p.K??
.??bݓ?XW?-???Xބ?A".???%???<???e?qM?(????????L??m?ޕWbY??L?~??2s????Hz???S?????j??tە??w???@3???^?LN?8?nNv????I?|eJ??C??'M???e???d[?X?_?	ꌟ?V&d"???a
dX$b???IJ?jm???xe?+,??J?iEz1??_????mx???<C??2??R?E??nǻ?Ú?U?k???X???~?X]???sOy?!a?fr??CA?'??϶J ?r?MY?V??E???]8?[?W???=??B .!???p?ÿ!?;HD7u???R?&???Iu?Ŕ!$1???ܘ&?i?G?<V?J,PNEQ?u????OEbg2a?r?K? #D??mY?v??-??U?؉???9l?F??$?yV?f??2J???&h?sv??PY?q%??5~???ŋ^?k]c????b?;??H??~R????C?:?q??{wb???~?X\?$??F?????xG5YY??k???9?	9????;???M?a?h?&-??0V=	=a*?&W#Q?2??2?>eRe??Ƌ?
???j?A#?a??M??J??R}ev????]IMr5L?pt???(nKş6*???B??ݛ׾?3J2? ??B8????D4?aɱ5ګ]??)??et?O????w|K{(7??6??M?Yx????TѴx?r??d?}??=-?o?yd???x???b?YM??:R?j	E??a? ????C8???2?ň??B?0H?bi?HH???J4?xZ(?? ???N??刀?f^7ϕ?М?/iqt?D???S?D??@??b???lǟ9?????rYz?`?????ꤠ_qO'lp???0F?-Q???F?ϵ?p?(??%	I?h?H???? b  ?@??-OiS˷eK ?Y7?*%7w?u?n?(?W?,??&ݳ?M
wP?16b9??P?k?T???E&t?f??(?3iH ?|??i9}]?F?Vw?$?2#??cm9?rډ??,I?n?'MQ??m4?!C%Q??o2?1??9I????q;?{?m?h?A?7?P/Q?+??!Z???@?z?zsZFDcֈ;?uw??L+C????a??>?+?eU/??:A???4:s;,+۸??*?͠?_Rts]iW?:?3umL!H?e4???+??9?[?]? y???gBd?lޛ???G??$?e{mP??`QY???[	?┚??I?????^e??????s??A=Y??r?@?0????ˇ?????_;??2.x?L?.p???L?	x?Qk%????.?,=U???eW?C$?Y07?WZ%??a?%,??Ld???VrN?[p7qM56?gY?J?'p?P?B?]?[?Չ????^?0]ڀC>???ŦK?WIs??p?Q????xI??Y?:P??JP5??&?R???8?	g D?=y:ynHc$RFP?c?/UU?2?$&?1???r?????;??!?
?_???7?SC~[?𹝫Ay??!?f??????4??ѕ<<????f?4?F??z?I???5?{"??S??Ntll?P?e??*??P?K???'?m)??e*Y?a_?J?8PQ?R?*U???Z?(?p?=?UY6?s??-aI?n???^??(?p??'98??=?76??*??ʨP?"+?)?س??g?,?/??$(fG?!gi#?f??FJ0?E??n1>vpu?O?a??5?????W??>9??by5???7??wM(?l??+???Pc??}v?z????h??)??yW?x??6????F9??x?r??x,̮̺ǠZ?.m?ߑ???
5???O????0?ŧZ??JXP?\c?GBU?|m???g?*?? ??Ǟǀ?^?Y?????[???D	 1rmdm?|?qv????`?????j̞aP?g"$?36?`b?t??&NI?=?= ?8k??ۼ???]?-#??ɷ!/#a?????B+O??I??"??,gh?&!T?p??e\d0?-U?G)O??iwI?yܲO>vb???W?97EGD??1?a	7Bh/?Y?.1???J?3٨4Ȼʮ?????8?M?1?F3?ִ?O???Һ/?@_??	;Wt?8j?O?)Q??1iC7?m??g??e?fI??0???????)]T??K?h/<??EV?%?i??K@?3V????:c???fIN	??@A??Lx??G]Ai؇???dIl?)G??g????T?LzZ??K0^?????L?MT?2i??????^?C????	?A"FxyS΋V?ÜT?{??????3?X޷~?:?s_????\QV?^I???$?5?=T?U???}d?i.?d?L??X?R?PS???Q??c2*??G???)?y?$???󊭬*SUѸ%???V???%Їm?y.?i??c.??????????? L-|ő?B??ty?t????D?5??????e????F??:?????H?hFk? H|??NL4e???/H???ݘ?i??Dewae??W??`I}??-Yֳ?N?????Hİ^?8!!f?A?˗?\:F?Q??~I酛?????>??8M2?园???v???!?P???.?c?wN???=???????J???/?
zI??ӝ?<ZLBKD????x????8B????m%?w?T/	?fR?vm?8?WVG?mf?@w#??eJ@Z?JJ,?wb?⤷D??????2?hϻ????d???B??d\0??t	???#z??r1?Sк`??C4???????????A??      ?   X   x??)MN4254??qH?M???K???43?36?43?*-N-2G???J)NLNI?)??	N?2C$e\E???y??ŕH¦?\1z\\\ ??%      ?   ?  x???O?]7?י?? [?e??H?f?vc?R)?4АE?}u?????2???s???Om??F]+?l??$?s?Q???޽~???o????6?|}????????O????Ëv?uF?cM??3K5??A*?zG??%?`/*hX??  ?bF7???VO?&???9?AmUX~Api?|??6{? F&t?3bP??8??	??;?l?u\2r?ZxA?:|''??B?a??{I?BD>??݈c??.Й???B&Z?6?<??ZX???W37?N????3"?@?8???vrV&??7D?#$?M??9?Dg?M1}a?vFho?ֻU?y??!?޵??k?????,?Di1?3???R??l:k??3???m??,ijw"?@m{#??yF???24sxw{4???A?)(>?????wS?R?~At*?%?2#mhDE??B???$??:????T??Y\us????????__????!z)ܡ?ib\f[?1"???$Q/?Ѣs?R3??+ۤV?<.?h??W?b??¶??`?3?(G???????\?????-?{?%?7ZDb??YN????j?9??ki???R??R??5tF?6?1b?????G??o:a?#? ?1?~wgV??T?r?&??6???'?#?I%?4?Z4???????)b?????]?]?U ^??i??2Q?3^??^A????-?T??g?e?-"??j1?0l;W??Nm??^oZ??J'?XZ?Ŭ???????Xpb?6??N?%Z2???m?Zmm???خ;#K].?^8EԢ?L??.??????E_a???2Pvrj?????ƪK??A0???d??/?E??n˷?ZюT??lp?1?1?έ?e-?zF??ZFGA???bƫWQ<#b??49?K??*??)&??vi?x??P?X?M<(wquׂ?)????86????v1cƳ?oD8R?4??O??sm5/??_|??/3??6?k??|?????O?y?????˿)٨w      ?   ?  x??RYN?0?vN???@پ??JHek+??S;N?8q??S??8c?B0 @D?L?y??l???f??g,U???(5?Jp??8f^??]?K?L9??+??9|E(t??Ua?,ӧ????	??ރ@?D??η*@\k#:??<?Y?<?G8r%??ă??By?L?L??4[?M[X[?Q??n3j?.mZچ????eӢ~?:???;???(?xp???d??
????X=?_?2?%??xT-???U?R
&1??	???+Y*???| (B*??_!?W"W??O? ???)IjXc-?x?FTP?$?????R)? ?~?eD	sB?!﨧??4??!?!#U?i???h????????????!>?}??~? ?0'     