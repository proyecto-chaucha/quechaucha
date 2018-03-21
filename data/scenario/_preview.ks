[_tb_system_call storage=system/_preview.ks ]

[mask time=10]
[mask_off time=10]
[cm  ]
[stopbgm  time="1000"  fadeout="true"  ]
[hidemenubutton]

[tb_keyconfig  flag="0"  ]
[tb_hide_message_window  ]
[bg  storage="splash/splash1.jpg"  time="1000"  ]
[wait  time="1000"  ]
[bg  time="2000"  method="crossfade"  storage="splash/splash2.jpg"  ]
[wait  time="500"  ]
[bg  time="2000"  method="crossfade"  storage="splash/splash3.jpg"  ]
[wait  time="500"  ]
[tb_show_message_window  ]
[tb_ptext_show  x="10"  y="563"  size="12"  color="0xffffff"  time="1000"  text="Músic&nbsp;by&nbsp;https://opengameart.org/users/pant0don"  anim="false"  face="undefined"  edge="undefined"  shadow="undefined"  ]
[bg  time="1000"  method="crossfade"  storage="menu.jpg"  ]
[playbgm  volume="100"  time="1000"  loop="true"  storage="spectacle_carousel_Loop.ogg"  ]
*title

[glink  text="Juego&nbsp;Nuevo"  x="600"  y="370"  target="*start"  color="blue"  width="200"  height=""  _clickable_img=""  ]
[s  ]
*start

[cm  ]
[tb_keyconfig  flag="1"  ]
[jump  storage="intro.ks"  target=""  ]
[s  ]
*load

[cm  ]
[showload]

[jump  target="*title"  storage=""  ]
[s  ]
