;ビルダーでシナリオごとに必ず呼び出されるシステム系のKSファイル

;メッセージウィンドウを非表示にする
[macro name="tb_show_message_window"]
	[layopt  layer="message0"  visible="true"  ]
	[layopt  layer="fixlayer"  visible="true"  ]
[endmacro]

;メッセージウィンドウを表示する
[macro name="tb_hide_message_window"]
	[layopt  layer="message0"  visible="false"  ]
	[layopt  layer="fixlayer"  visible="false"  ]
[endmacro]

[macro name="_tb_system_call"]
	[call storage=%storage ]
[endmacro]

[macro name="tb_image_show"]
	[image storage=%storage layer=1 page=fore visible=true y=%y x=%x width=%width height=%height time=%time ]	
[endmacro]
	
[macro name="tb_image_hide"]
	[freeimage layer=1 page=fore time=%time]	
[endmacro]

[macro name="tb_ptext_show"]

[if exp="mp.anim=='true'" ]
	[mtext layer=2 text="%text" y=%y x=%x size=%size face=%face color=%color name=%name bold=%bold time=%time fadeout=%fadeout wait=%wait in_effect=%in_effect out_effect=%out_effect edge=%edge shadow=%shadow ]
[else]	
	[ptext layer=2 text="%text" y=%y x=%x size=%size face=%face color=%color name=%name bold=%bold time=%time edge=%edge shadow=%shadow  ]
[endif]

[endmacro]
	
[macro name="tb_ptext_hide"]
	[freeimage layer=2 time=%time ]
[endmacro]

[macro name="tb_eval"]
	[eval exp=%exp ]	
[endmacro]

[macro name="tb_keyconfig"]

[if exp="mp.flag=='1'" ]
    [start_keyconfig]
[else]	
    [stop_keyconfig]
[endif]

[endmacro]


;生ティラノ用のマーカー
[macro name="tb_start_tyrano_code"]
[endmacro]

[macro name="_tb_end_tyrano_code"]
[endmacro]

[macro name="tb_start_text"]
[endmacro]

[macro name="_tb_end_text"]
[endmacro]


[macro name="lr"]
[l][r]
[endmacro]

;キャラクター揺らす
[macro name="tb_chara_shake"]

[iscript]

tf.swing_1 = mp.swing;
tf.swing_2 = mp.swing*2*-1;

[endscript]

[keyframe name="shake"]

[if exp="mp.direction=='x'"]
[frame p=0% x="0" ]
[frame p=50% x="&tf.swing_1" ]
[frame p=100% x="0" ]
[else]
[frame p=0% y="0" ]
[frame p=50% y="&tf.swing_1" ]
[frame p=100% y="0" ]
[endif]

[endkeyframe]

[kanim name="%name" keyframe="shake" count=%count|5 time=%time|500]

[endmacro]



