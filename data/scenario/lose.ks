[_tb_system_call storage=system/_lose.ks]

*start

[cm  ]
[tb_hide_message_window  ]
[playbgm  volume="100"  time="1000"  loop="true"  storage="Small_Things.ogg"  click="true"  fadein="true"  ]
[bg  time="3000"  method="fadeIn"  storage="gamebg.jpg"  ]
[chara_show  name="don_chaucha"  time="1000"  wait="false"  left="-8"  top="226"  width="481"  height="417"  reflect="false"  ]
[chara_show  name="quirquincho_sad"  time="1000"  wait="true"  left="580"  top="225"  width="373"  height="420"  reflect="true"  ]
[tb_show_message_window  ]
[tb_start_text mode=1 ]
# Don Chauchisco
Lo lamento Quirquincho.[p]
Se han acabado todas tus oportunidades.[p]
[_tb_end_text]

[tb_start_text mode=1 ]
No estes triste.[p]
Siempre puedes volver a intentarlo.[p]
[_tb_end_text]

[tb_hide_message_window  ]
[chara_hide_all  time="1000"  wait="true"  ]
[cm  ]
[jump  storage="title_screen.ks"  target=""  ]
