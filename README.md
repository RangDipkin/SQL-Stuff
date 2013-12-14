SQL-Stuff (Travis Pressler)
=========

dijkstra.sql  -- Given some table called 'graph' which represents an undirected, weighted graph; this algorithm reads 
                 some vertex as a parameter, then calculates the shortest path to every other vertex on the graph.
                 It then outputs every vertex on the graph along with its total path distance into a table called 
                 'paths'. Make sure that the 'graph' table follows this format: 
                 (vertex1 integer, vertex2 integer, weight double).

leaves.sql    -- Given some tree called 'tree', this algorithm reads some node as a parameter, then inserts all edges
                 which are linked to that node or descendants of that node into a table called 'tc'.  Make sure that 'tree' follows this format: 
                 (parent integer, child integer).

mark.sql      -- Given some tree called 'tree', and the root as a parameter. This algorithm does a breadth-first search through the tree, and 
                 creates a table called 'depth_marks' with every node along with its depth.
                 Make sure that 'tree' follows the format:
                 (parent integer, child integer).

max_occur.sql -- Given some table of characters called 't', this algorithm finds the maximum number of repetitions of 
                 any given char in the table, and lists the characters which are at that maximum; these outputs go into a 
                 table called 'maxes'.  This was an exercise in using mySQL loop structures.

```                                                                                
                                                    :G;t;:G7G22; .Cx;                                                        
                                   ..          ;tO;SNE5EsSxQSSS8t2K: :tx;:  .2t,                                             
                                           ..s#NMNMNC 585Qg#ggbQsO;.C;;:,:;;;;.,2,;..,;,:                                    
                                         ;Z80M@GK@7  .:xQ9COO:;t. ..,,;. ::... :, :gK0S:t:                                   
                                      :7:Ct.:  ,;.:Q25,.: ;Ct.,,CgQx7. .O;:  .,t. .x7..::.::                                 
                                    .9sCt;   .9gx@MbgEEE#b257;QN#0EC :Z#NKst:O08@D:      ,,Cxt:,                             
                                   .Gt: ,:, Q#@t#b@GQ@#S9.;2::@K575;:sQ57;,.tCO,  ,.;t:. ,:. .;,.                            
                                OOsb5tZ07;CbxQ@b@95tD9tE0t0G2;tCtZ2::;;;   .t.  .92.tt,Ott;:,;;;7s.                          
                              t;87,...7@809ss@MEQD7.tSNQt0#xOSt.Ct, CZ2::;t;;t0#@@9KZ7t5,:t:gtx;                             
                              t:, .7t7tGsKb0@MQt7ZZ5.0E;bMs,gO79;7CsbDZgbM@QK@#EKsQ#NM@Stt:,;b5E;,..                         
                             ,t,tS#E08D@M@QNMG  ..::.;; NMO5D@MGGg@EK@#KEt.tx::t... xNNb02; .7Q95;;:                         
                            ,52#NMDS@@@@#@#@;        ,, txx;MM09@#g7gt.::..           9b#M;,t;;:t;                           
                           .txEK0QK#M#M@#g2     .         . Z2,:: .;                   :#st  t7;C2t                          
                          :tZG;:8K@MN@QNE:                                              t#5;. .;t08;                         
  .                     ,2520Zg@@s@NgO@#Z                                                Z#b@x,,7 ;t.                        
                          t5KSNZZ#EEQgN#                                                  0@sEStx0.7                         
                           ttEx.KN@#N#MO                                                  .ES:t;;:ttt                        
                           ;E9 t@@E@@MD.      .                                            g#OG,,7: ;;.                      
                          .7b,:#gE@#Ng:. .   .,                                            .#Q@S:.G@x                        
                          .Dt:8M@#EE@g;.     .  .                                           KM@#2::M;                        
                          :87s@N#SgSNDt.. :    .. .                                         KN@gCt2G                         
                          .b;EN@tsQGND. ..::   .   .                                        .NbS0:G;                         
                          ,sb#NDx090bt:...,,      .                                          C#s@gG                          
                          O8bMg@@sO8tx;....,     ....,,. ...                                 .NMKDt                          
                          tt7EbK2QESDC;;: .,.                                                 xNttt0. . .                    
                          ;g57C2sEg@Q;tg: :t,                            ..            .,,,,  .@DGD0   . .                   
                          ZZs@b..g@SSS#C :tx.       .        ,:,        ...   ..;;tZ89gKE9Z;,  8EN@   . .     .              
                         xt.  :St#E#SEE .:;t,. . ...::;;tsQS@MMM@@SZ. ,2, .;OEEMNM@@S8Q@bg@@9t.8gg,                          
                        .GxNME.7MN@N@S;   .:,D.,QE#@EQQgE@N##EE@Kx7sx2#b;.,x#M#gOtOOt;t27Q2tgt O@G;                          
                        ,2.ZDME7@MN#@E.  : QD820@#Q7t;tt;,tsE#EEQQ98G7;.  tNNMQgEMNMNMbO52tOxt :NSt                          
                        .0.,t.. S#M@#G..C5O5g;,.ZbG0@NMNMMxZGDbt;O0bg.    ;MMKKs:9E@@#O;0C,25; ;Mx;                          
                         t7 ,:2t;8E@@, ,,::;:;..DD@MtQ@M## tQt,:7@gt;      55sss5OxxOtt889tCt  :N0,.                         
                         .; g@D@@;.0M:..;..   .b0.;85,:.,.t;::Z87:. ..     x:,tg@@#@NNMM@Ot;.   tQ;                          
                         .Z 5E,2@g.9MZ;.;t ..   tE9Sb#@E88bE@S; .   ::     5.    .;ttt;,       ;;;t                          
. .                       ss .:  :tt;,x 0D..     :;;.,C5DGG:.   ,, .;.     ,t,                 O.,t                          
                           xbZ,.55,. .2:8SO,.,                 ..,,.,.      ;;               .;Ot7;                          
. .                         xE#t.bK. .O:D9g:,                   ,,:t;,.     .D;              E2,:;                           
                             ;    O5tt;t78Q2:,,.              OM; .;;,       . 8N:          D#5..                            
. .                          .x;;  t#x:;O7QQ7;;;,           tEMN.              DMND         2Zt                              
                               5Q: .9E,,G;:Gxt;t;. .      tK@7,C8t:;tt:,,:,t2G9@;:S#;       ;G,                              
.                                :;, ;Q.tt,tst2ttt;,.   .t#S:  ;x8@NM##@b##E9xZ:,  :@G .,.. tt                               
                                      @2.; ;G;;O;;;;,,,;xE;  ..CG7ZQGQDsQ0GC:,:t:.  ,@2..;,.:t  .                            
. .                                   2@9,.,0t,,t:;t7:D9bt      ..::t:;ZQt;,772O5x;  ,Q,.tO. #@9#NEE#@Eb#b@E@@EK97Os7:.      
                                       GKOttDZ, :Q;Z7ZKDZ   .,;;::,.tt,,   ;2Ztttt5SZ2O,t;t..MMEb@ME#MMMMMNMNMMMNMNMNMMMN#b. 
                                      ;@89O,5s;..t;;:S5Cx,tsbEKgbgE@@#@E9ZQ8ss@KO0E#@8; 7;; ONMN#s9#@@@#MN#E#N#9K@N####@MNM  
                                     OMMN0g;tKs: tx, 5:.98#K9E###@SSZ9QgKb0ttt;:;;,:.,  2G: @M####KSEN@@NM8#MN8#99#@bg@#@MM  
                                    .b#MM.E@OO9Z .OG ,t GZ.  ;5@Kg52;,      .t;t7t0g;  Zbt  @M#M#@@@72@MMg@@N#EEM###MN@@M@E  
                                 .0S:tN#N.:g@8OQ:  ;x;t  .   .;s0@G2C;,... :tt;7G8G. ,#@t .::MNM#K#b@sEMNENg@M@DNNgNNM#MMM   
.                               #NM2:.ME2::;GbKK0   ,t2;   .,    t5gE@#NM#N@EQ9DO    QQ; ,Mb 7MNN@NME8@@N@@0##M58@@##8K@MMt  
                              xMNMs:t.b8;x.;;5s@MEx;:;29: .,...,..,::;5KgQQD;.    .,   .tMN85:GMNM@M@8N##@@MNNMbg#@M#E5@@;   
                      .     tNM#Mb:;Q:s#;5,.;Cx2Q@M@9OtO7., .      .,.,:tt:.,,. ...   ;xMNEEG7  @NM#M#MEMNMNN#Mg@NM#EEbSD    
                   . .    sMMMNMN,;xs77M,Z7...,tttxg#@DsNE,           .,.,..         ;sMMM@#@G   bN##M#g@E@#@@NMN@E@#bKZ   . 
        .         ..     #MNMNMMN.:;s7x@;;g..,;;;;;;Zg@8@NG:;.;,,           :;:  .  t@MNMN@M0;..  ZNMN#S#x@KE#M#@K8@#5:.     
       .               tNMNM##NMb.,:22:Dx O7 t;;;Gx2OZD2t@NN87tt:,::      :t,  .95:ENbO@NMN:O@@#@C sMM@@Mb@@EbN@EM@#8t,      
.                     2NMNNENNMO .;:CtC,@..E..,.:;Z9Oxs5ZOg#M#EE92Z2O;t;;:::;Z@N#QENS:xNM@E.MNM#M@, NM@###M#E9N88gZ:.        
     .     .         5NMN@EEMMs  :;t:7D.s@ Z5 ;;:,,t5tCGtt7xODs@QEEM#K@ENMNMMMM#QDSS2tSMM@S.NMN#@Ms. MNMNM#ME@N@Eg:          
. .   .   .         @NNZKg@80E; ,.:t:;Gt.@s b..:;;t:722ZG2CCGtttttOGxCGDEKK8Gtttt72OtOENM8#7M#@NKt.G tM@5#@OK#@KEG           
       . .       .sMMEESg@2xs@:.;:;t:,tx. M7:g,;;::;;;7xtOOxsOO5GG2t;ttOt;:;;:;tOt;t:;QNMs8;8M#MNg:,G.MMx#@0E#8Q8O           
. .    ..      t@MMMN@NM#b9bMNZ ;;;x; tZt .#;Zx:tCt;;;;;tt72t;tCxSDODOGOtOt:;;;t::t;;tQ@M@Q .@M#Mb5,:.tM@#@@@@@0s            
       .    ,gNMM#MME@@#0KM#NMEt,;:t;..;x7 ,StSt ;;OC;,.,:.:t;,t;;.;;;;tt7O;t7;tt:;:ts5N#M@. 2NM@N0;;, #NtKKEK@s             
. . .     ;#MNb@##ES8#@b@@#@#NM@:..:t, .tZ; ;G0b. .;7ttCttO;;CttCOt;CxZO2;7;t::;; ::s20NNbNE7:.G@@#;t:.tMSgDNN;              
. ..    ;NNMKE@@N@5@@N@#89EEbMMMZ: .t;, ;C:. 729g, ;2D7;;:.ttDtt;C22Z25ttC;;;;;t;:ttZ;bMgD8bbbt,,ts0tt.,N#Q@MQ               
. ...  NMNN#ES@#E@#NMNN9QQ@S#bMN@tt,7:t.:Ot  .SCbQ;.C@8Gx:,.;:::;t5stt27Gttt7xO;xOt:7;N#t29Oxsb#S :tt,. ##bE@                
. .  tMM@#gK2G059g00@77gE#28@#@MN0:;:::: ::   tQ7SZt..QE87,:,,. .;CtttttttCC77tQt. :2tN@.5xDS8xDN;.O;., S#x9;                
.   8M@D5O2Ox27tx;;7C;xQDGt@KsK#MN, ,,   .,.  .t:tt;t  ZEb0x::::;;:txGOZtt2OxOD9: .;xCM@;Q89Dt;s88Cs; , 2M0@                 
.  Z@7;t,:::,;,...;;:7Dg5sQ0ttt8MM@ .. ,:2t;9@#M@xO7;7.25GQg;C;;...,:t;tZOtt;SSx:;:x;7NN;Q92t;t:ts;Z: . 7Mbg                 
. ,;; ... ... ... ..,;20Z2Qt@s5QMNMs ,,GDCCMMNME##MEZCtDEZx85Zt;;.. .,..:;ts2O,.,:C7,0M#tOtx;;x.tZ,t..  tNMG                 
  .                . ..;tt,tQKxQSMNMt:O9x@NM@NEQt0EN@8;.t@E0SK85;t;.    .,;0t,   :t7:MN@;;;t;ZttxZ;     :MN;                 
. ... . . . . ...     ... t;;:9@DxMN@2t7ZMM@E8b50Ds7gE#bt,xQSS#N#@#Zt:,.. ...   .t72t@MMt:7xCtDZQ.: .   gNM.                 
. .. . . ......... . .   ,:. .Q@K2Z#@b,;tM#E@50ssMGOtttDN#t 7;;5#NG9QgG2;:::,::.;O:.;@NM:,ttt;79;;     tNMx                  
. . . . ... ..... . . .     ,,:ZS7:S#@Z ,NMg@027DE#8C80 SDg#E@ CO,. .;;tC;,.... ;;. 7NMN;Ott7;Gg;t.    NME                   
. .. ... ......... . . .   ..,.;tGsO9M@8 gN0sZ;:t:2@@5NDO5,EM2 tst,,     ...,,,,::. ,MN@,x;t,7QG:,    5M@:                   
. . . . ........... ... .       ..:C78MNttMZCt7C;:7tgQGD00OtS;.0gbS5t.    ..,......  SMs,C;:;tZ;,.    t.                     
.  . . . ........... . . .        .tt;@@# N#O;Ox77xx;Ss7t5OGs9t,7E@E@g7;.         .. ,Nx;t,;,.. ..                           
. .   ................. . . .     .     .S#MQttZ5;5t;;Ox;tt;C;:;..gxC#@K05t.  .....   . .                                    
   . . ................... . . ...        tt... ,  .                  ,C;,:,.                                                
. .   . ..................... . ...                                                                                          
                                                                                                                          
                                                                                                                             ```
