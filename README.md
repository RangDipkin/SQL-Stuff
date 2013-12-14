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

.                                                                                                   
                                                                                                    
          .                                                                                         
                                          .....,,:,..,,                                             
                            .         :Tvm#imK99$GbrzE..vv,  .v.                                    
                                  .:D@#@@U :5Gb$ww93:..::,.:,:.,v,:::v,.                            
                               ..r3ri,vr....,:,:v...:,:.  ..  .,. TDSv:,.                           
                             .C3v,   r7F0$993wrFv,U8Dm,.,BDS,,r99:.    .,7:,.                       
                            .Kr... ,8w9WWK$8Be,T,vg9zz.v9e7,.:7, ...:. .,..,,                       
                         ,KSKv:5CviEG0Bm7vEK57S9rr::7:.::.  .:  :m:v,,r::,,v,T,                     
                        vvv ..:eUG99#WeK7.7Q3UQrFS,::.7eCriGSF$Q#m08Ger.::9SC                       
                        ,.,iwKzEgBm@m. ,v:.7.@Bv9BBre$D$88D7SE7K:,.5@#97. :GmC,,                    
                       rUD#DG$8W#B#K      .. 7Fv0@wDQ99K::.         .G8#v.:::r.                     
                      ,39U9mQ#NQ8U.   ..       .v:.. ..               38:  v:z3.                    
                    :vFFvKGG@DU0b                                      9BC, ,:7r                    
                    ,S9w#9wBBKb#.                                       mBmU:F.:.                   
                     .7w3,WBgW@m                                        .8Cr:,v::                   
                      K5 3$BB#8.     .                                   BwF,.v.,.                  
                     .E,rW$8QN7     ..                                   .#BB..#z                   
                     :FvD@Bbb07. ..   ..                                  @#mr,5.                   
                     v3e#G7E90v ..:  ..                                   mQwrvT                    
                     v9Q09KUEU,.....   ...                                 Qw8U.                    
                     7U0BBE39r7.. .     ..... .                            9@K7,                    
                     TSS3iU$G3,F, ,,                                    .  .mSr5.  ..               
                     Ci9e.7BGUme ,z,              .     . ...  ..,:CF3wiz,  wW#.  ...               
                    rr, .C9Qg58. ,:..  ..::::Sw58@@Wbe:.:C..,U$#8BGwK9$mDDS.U$F  .   .              
                    7z#@73@Q#87   .vE,KNQmeCUK58#BWDU3UC$r..9@#5EUb9izC3z7U T$S   .                 
                   .C.ve::W@#g: ,rr$z:SBKzemDw77eBwS35Dv   ,@@$bF##@@z7r,K7 :#7                     
                    v,..:,K0Qb  ,:v:: :E8Be#@@E,Kv,:b9z.    559377KF7T99vr, :#v.                    
                    ..,WU0U.90 ...   ,wvrmv:,,,v:TSC, ..    T..3bDBW#@WF:,   FC                     
.                   .7.K,:9,emv.T:    .K9UGDgmBmG:    .,    r.    ....      v.r                     
.                    Ti,. :,. :,9U..        ..     .....     v.            .r,7                     
. .                   :85,Ue. ::ebC..              .,,:..    ,r           ,K:v:                     
.                      ,.  :Kr,:rmi:..           .BC .,.       :#.        g5..                      
. .                     v7. ,Wv,7veF:::.       .U$@z           S@WK       Kv                        
                         ,v,.vF.r,,3rT::..    78U..i9GBDe3F9w999..Cm.     7,                        
. . .                         SF...CvTv:v...,CG,  ,7F58D$Gmmi,,,,  .B,.,..v                         
                               B3..S:.::,r,75G.    ..,,:,F7:.7r77v. ,F.:: T#U0Bwmm9DwG5$597vzv..    
. .                            :m7:zF. 7:rCG9:  ,:v::,v7:. .T7FC7SBbE:,v: e@QmWNQ#@@@@@@@#@@@@@@@@3 
                              v@g5:vE: :v.:F:FU$B#NQBBmW0N$mESiivC33r .C. #@#89mg0D##B0@BG9WWBB0#@w 
                             .#@#vBrK9. C, : Ez,,z8g$iT,. .  .,,v:S,  KF .@##8gGS9N@BmQNmB8W#WWB#@7 
.                          7K,m#B.FB9er  v::     .rUmiCr.. ..Tv7Kev .ge...B@@8BBG30@$8w#B5@DQ##Q@8  
.                        v@@7.KN7.,rmG8:  ,rv  ..   :C9GW#NNWUS7:   rT.,@3.Q@#W#D9W0g5D0@3$D#89$@0  
                       .#@@K,v:gvT.,7eB#DF:r3. ... . ...:33Cv.   ..   7@QGv.5@##080WN####5BNNW5mG   
                .    ,W@@@m.7K:#:C..,,rCDW8SUb:         ..,.. .     .K@@g8U. .@###BmNW0B#0NB0B$9,   
     . .       .    G@@@@@r.vKvD:7v .,::,Tw85#B,....         ..    .D@@@0N7.  .@@@G$UBGW##$G0Nr,    
                  .@@@#0@#, ,7vrS U.,,,v3r7UzC#@8Sz:,,.    .,. ,5rU#9K##N,$NQD .@#BN$8Bb#mWBBS.     
.        .       .@@@88@0. ,,:C.5.:z ,.,:U7CS77mBBBB9GmiKKe3iDQ@85WG,m@N3:@@#@5 C@0###WGNmmS        
. .   .   .     v@Q5mmbQv .,v,F::$ U..,,,:7TSrrT7vzSU9$ebB@##$53r7iv7W@B57@W#br, 0@G#$GBQBD.        
  .  . .      .g@Qw5m7zG,..::,,3.vG,F.,,,::r7Cr7Sr7FC7,v:7v:,,.:v::,:D@GUTg#@Q:.:v@eBmUNmw9         
. . . .     z0@@#B#Bm90#z.,,C..7v z3C7,vv:,,,,vrr,vrKT7TCvTv,:::,,:,r9@#i v@@@9,, 8#BBBBg9.         
.    .   ,W####Qb0B5D@0@#7..:,..7r r7b. ,rv,.,,,,:,v,,,::rv7:T:::..:z5##8,.iNQ0v,.,@z5bQE.          
. .    :@@#B8Qm9BW8$m$B#@B. .:. :r. 7U5. :zrv:::rCv:rT7C3Tv::,,:,.:CrD#9B$e..75iv. QQ9N#        .   
. .  ,@@@0wg0B$Q##$E9Db8@@3,.v:..C. .KE9..emCr..,:,:vUzTr7rv:rr:T7:T:@9rKCUmb: r:. 9#mQ:            
.   i@@gm9SUU9wUbvKGmCBBQ@#,.... ..  :rKF,.T$wv... .,v7vvvvv77v3v..T7@rvie5Cw8.v,. v#UF             
   b@wrv:vvv,,,v:TUeCK973#@e .  ....,7F:,:, 7b9E,,,,.,:SrSrrv795,..rC@zCwKv,r9FS,  .#B:             
. :K......... ..,v9KiU3Srb@@: .,7v70@@#B83v:FeCwzv:,. .,.,vvr73,,,r,F@9vzr,v.rvv,  .@W,             
. .            . .,r:,FbFEN@#,,i38@@#$3UWNGr.3m5EGKT:.    .:3v   :r:B@F,:v:7,3v.   .@#              
. . . . . . .     ...:,.w8F#@mvvU@@$G93e3SGG5vT7U9QW#BC:,....   .v7:W@m.T7v7ET.    S@B              
.  ..... ..... .    .. .C$UvB#S :@BBUKC0bC:Tv#9:7::mG:TeSz:,....:v ,W@E.:r:r9:.   .@@.              
. ... . . ..... .     ...r3r30Qv.#09U,vr5$9BvSrB@C.z.   ..,.....,, .@@evv:vKe,.   Q@z               
. .. ......... ... .     ..:rKQ@,G0vv:,.veb99E7rm.,m53v.   .......  m@:v:,:iv.    K,                
. . . ........... . .       v,Smb:@3:7STSTzEC7KCe3:vmQB$S,.       . :8,,..... .                     
  .. ............... . . . .     i#5:v7:v,.,:,,..... r,UmmFr.. . .             .                    
. ................... ......                                                                        
.                                                                                                   
