[_tb_system_call storage=system/_intro.ks]

*intro

[tb_start_tyrano_code]
[hidemenubutton]
[_tb_end_tyrano_code]

[glink  color="orange"  storage="intro.ks"  size="15"  text="Saltar"  x="854"  y="6"  width=""  height=""  _clickable_img=""  target="*next"  ]
[bg  time="1000"  method="crossfade"  storage="intro/intro1.jpg"  ]
[tb_ptext_show  x="14"  y="19"  size="30"  color="0xffffff"  time="1000"  text="Quirquincho&nbsp;estaba&nbsp;viendo&nbsp;sus&nbsp;videos&nbsp;favoritos"  face="Tahoma"  edge="undefined"  shadow="0x333333"  anim="false"  fadeout="false"  wait="true"  in_effect="bounceIn"  out_effect="fadeOut"  ]
[wait  time="2000"  ]
[tb_ptext_hide  time="1000"  ]
[bg  time="1000"  method="crossfade"  storage="intro/intro2.jpg"  ]
[tb_ptext_show  x="25"  y="21"  size="30"  color="0xffffff"  time="1000"  text="Cuando&nbsp;un&nbsp;anuncio&nbsp;salvaje&nbsp;aparece"  face="Tahoma"  edge="undefined"  shadow="0x333333"  anim="false"  fadeout="false"  wait="true"  in_effect="bounceIn"  out_effect="fadeOut"  ]
[wait  time="2000"  ]
[tb_ptext_hide  time="1000"  ]
[bg  time="1000"  method="crossfade"  storage="intro/intro3.jpg"  ]
[tb_ptext_show  x="399"  y="17"  size="30"  color="0x333333"  time="1000"  text="Nuevo&nbsp;Concurso"  face="Tahoma"  edge="undefined"  shadow="0xcccccc"  anim="false"  fadeout="true"  wait="false"  in_effect="bounceIn"  out_effect="fadeOut"  ]
[tb_ptext_show  x="223"  y="572"  size="30"  color="0x333333"  time="1000"  text="Responde&nbsp;preguntas&nbsp;y&nbsp;Gana&nbsp;Chauchas"  face="Tahoma"  edge="undefined"  shadow="0xcccccc"  anim="false"  fadeout="true"  wait="true"  in_effect="bounceIn"  out_effect="fadeOut"  ]
[wait  time="2000"  ]
[tb_ptext_hide  time="1000"  ]
[bg  time="1000"  method="crossfade"  storage="intro/intro4.jpg"  ]
[tb_ptext_show  x="214"  y="35"  size="30"  color="0xffffff"  time="1000"  text="¡&nbsp;Quirquincho&nbsp;Ganará&nbsp;Esas&nbsp;Chauchas&nbsp;!"  anim="true"  face="undefined"  edge="undefined"  shadow="0x333333"  fadeout="false"  wait="true"  in_effect="wobble"  out_effect="fadeOut"  ]
[wait  time="2000"  ]
*next

[tb_ptext_hide  time="1000"  ]
[jump  storage="scene1.ks"  target="*start"  ]
