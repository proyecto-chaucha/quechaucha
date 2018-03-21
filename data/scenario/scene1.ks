[_tb_system_call storage=system/_scene1.ks]

*start

[cm  ]
[tb_start_tyrano_code]
[hidemenubutton]
[_tb_end_tyrano_code]

[playbgm  volume="100"  time="1000"  loop="true"  storage="bleeps_and_synths.ogg"  fadein="true"  click="true"  ]
[tb_eval  exp="f.lives=3"  name="lives"  cmd="="  op="t"  val="3"  val_2="undefined"  ]
[tb_eval  exp="f.answered=0"  name="answered"  cmd="="  op="t"  val="0"  val_2="undefined"  ]
[tb_eval  exp="f.maxQuestions=10"  name="maxQuestions"  cmd="="  op="t"  val="10"  val_2="undefined"  ]
[tb_eval  exp="f.total=60"  name="total"  cmd="="  op="t"  val="60"  val_2="undefined"  ]
[tb_eval  exp="f.correctAnswers=0"  name="correctAnswers"  cmd="="  op="t"  val="0"  val_2="undefined"  ]
[iscript]
f.nextScene = -1;
f.gameover = false;
f.won = false;
f.lost = false;
f.usedScenes = [];
f.usedScenes.push(f.nextScene);
f.availableScenes = [];
for(i = 1; i <= f.total; i++)
{
f.availableScenes.push(i);
}
[endscript]

[bg  storage="gamebg2.jpg"  time="1000"  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=1 ]
# Don Chauchisco
Bienvenido a ¡ Qué Chaucha !.[p]
Las reglas son simples.[p]
Tienes [emb exp="f.lives"] oportunidades.[p]
Debes responder correctamente [emb exp="f.maxQuestions"] preguntas.[p]
¡ Éxito ![p]
#
[_tb_end_text]

[jump  storage="questions.ks"  target="*start"  ]
[s  ]
