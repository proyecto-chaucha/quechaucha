[_tb_system_call storage=system/_title_screen.ks]

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
[bg  time="1000"  method="crossfade"  storage="menu.jpg"  ]
[playbgm  volume="100"  time="1000"  loop="true"  storage="spectacle_carousel_Loop.ogg"  ]
*title

[tb_ptext_show  x="6"  y="620"  size="12"  color="0xffffff"  time="1000"  text="Chaucha&nbsp;2018&nbsp;-&nbsp;Code&nbsp;by&nbsp;@CLSource&nbsp;Art&nbsp;by&nbsp;@Leo8bits&nbsp;Músic&nbsp;by&nbsp;https://opengameart.org/users/pant0don"  anim="false"  face="undefined"  edge="undefined"  shadow="undefined"  ]
[glink  text="Comenzar"  x="176"  y="474"  target="*start"  color="blue"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*start

[cm  ]
[tb_keyconfig  flag="1"  ]
[tb_hide_message_window  ]
[jump  storage="intro.ks"  target=""  ]
[s  ]
*load

[cm  ]
[showload]

[jump  target="*title"  storage=""  ]
[s  ]
