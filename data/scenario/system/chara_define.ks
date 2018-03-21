;=========キャラクター事前定義情報 
;don_chaucha
[chara_new  name="don_chaucha"  jname="don_chaucha"  storage="chara/1/don_chaucha_neutral.png"  ]
;quirquincho
[chara_new  name="quirquincho"  jname="quirquincho"  storage="chara/2/quirquincho_happy.png"  ]
;quirquincho_sad
[chara_new  name="quirquincho_sad"  jname="quirquincho_sad"  storage="chara/3/quirquincho_sad.png"  ]

;=========変数宣言部分 
[iscript] 
f['lives']=3; 
f['nextScene']=1; 
f['usedScenes']=''; 
f['answered']=0; 
f['gameover']='false'; 
f['total']=2; 
f['lost']='false'; 
f['won']='false'; 
f['maxQuestions']=2; 
f['availableScenes']=''; 
f['label']=''; 
f['correctAnswers']=0; 
[endscript] 
