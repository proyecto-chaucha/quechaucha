[_tb_system_call storage=system/_questions.ks]

*start

[cm  ]
[tb_start_tyrano_code]
[hidemenubutton]
[macro name="checkGameover"]
[iscript]
if(f.availableScenes.length < 0  || f.answered >= f.maxQuestions)
{
f.gameover = true;
f.won = false;
}

if(f.answered >= f.maxQuestions  && f.lives > 0 && f.correctAnswers > (f.maxQuestions - 3))
{
f.won = true;
}

if(f.lives >= 3)
{
f.lives = 3;
}

if(f.lives <= 0) {
f.gameover = true;
f.lives = 0;
f.lost = true;
f.won = false;
}

[endscript]
[endmacro]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[macro name="selectNewQuestion"]
[iscript]

while(f.availableScenes.length > 0 && f.availableScenes.indexOf(f.nextScene) < 0)
{
f.nextScene = Math.floor(Math.random() * f.total) + 1;
}

f.availableScenes.splice(f.availableScenes.indexOf(f.nextScene) , 1);
f.usedScenes.push(f.nextScene);

[endscript]
[endmacro]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[macro name="traceVars"]
[trace exp="f.lives"]
[trace exp="f.anwered"]
[trace exp="f.gameover"]
[trace exp="f.lost"]
[trace exp="f.won"]
[trace exp="f.nextScene"]
[trace exp="f.label"]
[trace exp="JSON.stringify(f.availableScenes)"]
[trace exp="JSON.stringify(f.usedScenes)"]
[endmacro]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[macro name="nextScene"]
[if exp="f.gameover!=true"]
[eval exp="f.label='*question' + f.nextScene"]
[jump storage=questions.ks target=&f.label]
[else]
[if exp="f.won==true"]
[jump storage=win.ks target=*start]
[else]
[jump storage=lose.ks target=*start]
[endif]
[endif]
[endmacro]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
; Begin the Game
[selectNewQuestion]
[traceVars]
[nextScene]
[_tb_end_tyrano_code]

[s  ]
*wrongAnswer

[tb_eval  exp="f.answered+=1"  name="answered"  cmd="+="  op="t"  val="1"  val_2="undefined"  ]
[tb_eval  exp="f.lives-=1"  name="lives"  cmd="-="  op="t"  val="1"  val_2="undefined"  ]
[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[quake  time="300"  count="3"  hmax="10"  wait="true"  ]
[playse  volume="100"  time="1000"  buf="2"  storage="Explosion141.ogg"  clear="false"  ]
[chara_show  name="quirquincho_sad"  time="500"  wait="true"  left="191"  top="52"  width="531"  height="598"  reflect="false"  ]
[tb_start_text mode=4 ]
¡Respuesta Errónea!.<br>
[if exp="f.gameover == true"]Juego Terminado.<br>[else]
[_tb_end_text]

[tb_start_text mode=1 ]
Te quedan [emb exp="f.lives"] oportunidades.<br>[endif][p]
[_tb_end_text]

[chara_hide  name="quirquincho_sad"  time="500"  wait="true"  pos_mode="true"  ]
[tb_start_tyrano_code]
[checkGameover]
[selectNewQuestion]
[traceVars]
[nextScene]
[_tb_end_tyrano_code]

[s  ]
*correctAnswer

[tb_eval  exp="f.answered+=1"  name="answered"  cmd="+="  op="t"  val="1"  val_2="undefined"  ]
[tb_eval  exp="f.correctAnswers+=1"  name="correctAnswers"  cmd="+="  op="t"  val="1"  val_2="undefined"  ]
[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[playse  volume="100"  time="1000"  buf="1"  storage="Pickup_Coin177.ogg"  clear="false"  ]
[tb_start_tyrano_code]
; Fix the weird volume down after the sound effect
[bgmopt volume=100]
[_tb_end_tyrano_code]

[chara_show  name="quirquincho"  time="500"  wait="true"  left="191"  top="52"  width="531"  height="598"  reflect="false"  ]
[tb_start_text mode=4 ]
¡Respuesta Correcta!<br>
[if exp="f.gameover == true"]Juego Terminado.[endif]
[_tb_end_text]

[chara_hide  name="quirquincho"  time="500"  wait="true"  pos_mode="true"  ]
[tb_start_tyrano_code]
[checkGameover]
[selectNewQuestion]
[traceVars]
[nextScene]
[_tb_end_tyrano_code]

[s  ]
*question1

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿En qué año se inventó Bitcoin?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="1998"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="2008"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="2007"  x="177"  y="219"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="2009"  target="*correctAnswer"  x="178"  y="278"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question2

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Quién Inventó Bitcoin?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Chatoshi&nbsp;Sakamoto"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Satoshi&nbsp;Sakamoto"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Satoshi&nbsp;Sakuragi"  x="177"  y="219"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="Satoshi&nbsp;Nakamoto"  target="*correctAnswer"  x="178"  y="278"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question3

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
En promedio. ¿Cúantos Bitcoins se creaban cada 10 minutos en el año 2010?.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="50"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="10"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="25"  x="177"  y="219"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="12.5"  target="*wrongAnswer"  x="178"  y="278"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question4

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Para confirmar la autenticidad de un mensaje. [r]
¿Chaucha utiliza un sistema de criptografía asimétrica?.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question5

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Para los comercios que aceptan Chaucha.[r]
¿Cúal de las siguientes afirmaciones es falsa?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Los&nbsp;comercios&nbsp;deben&nbsp;adecuar&nbsp;sus&nbsp;precios&nbsp;diariamente.<br>&nbsp;Para&nbsp;estar&nbsp;a&nbsp;la&nbsp;par&nbsp;con&nbsp;las&nbsp;fluctuaciones&nbsp;del&nbsp;valor&nbsp;de&nbsp;la&nbsp;<br>&nbsp;Chaucha."  x="178"  y="19"  width="500"  height="70"  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Los&nbsp;comercios&nbsp;pueden&nbsp;ahorrar&nbsp;mucho&nbsp;en&nbsp;comisiones.&nbsp;<br>&nbsp;En&nbsp;vez&nbsp;de&nbsp;pagarlas&nbsp;a&nbsp;pasarelas&nbsp;de&nbsp;pago&nbsp;de&nbsp;terceros."  x="177"  y="121"  width="500"  height="70"  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Los&nbsp;comercios&nbsp;pueden&nbsp;aceptar&nbsp;chauchas&nbsp;directamente.&nbsp;<br>&nbsp;Sin&nbsp;necesidad&nbsp;de&nbsp;utilizar&nbsp;una&nbsp;pasarela&nbsp;de&nbsp;pagos&nbsp;de&nbsp;terceros."  x="178"  y="220"  width="500"  height="70"  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="Los&nbsp;comercios&nbsp;pueden&nbsp;utilizar&nbsp;<br>&nbsp;pasarelas&nbsp;de&nbsp;pago&nbsp;de&nbsp;Chaucha.&nbsp;<br>&nbsp;&nbsp;Que&nbsp;les&nbsp;permitirá&nbsp;recibir&nbsp;cualquier&nbsp;fracción&nbsp;<br>&nbsp;de&nbsp;moneda&nbsp;local&nbsp;o&nbsp;Chaucha."  target="*wrongAnswer"  x="177"  y="319"  width="500"  height="70"  _clickable_img=""  ]
[s  ]
*question6

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Satoshi inventó una forma de obtener un Consenso Decentralizado?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question7

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
<b>Todas</b> las wallet Multi-Sig requieren 2 de 3 firmas para autorizar el envío de chauchas.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question8

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
En un <b>Hard Fork</b>[r]
¿Qué cosa no se puede cambiar?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Cualquier&nbsp;cosa&nbsp;puede&nbsp;ser&nbsp;cambiada&nbsp;en&nbsp;un&nbsp;Hard&nbsp;Fork"  x="178"  y="19"  width="500"  height="20"  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="El&nbsp;límite&nbsp;de&nbsp;Chauchas&nbsp;posibles"  x="177"  y="80"  width="500"  height="20"  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Que&nbsp;cualquiera&nbsp;pueda&nbsp;unirse&nbsp;a&nbsp;la&nbsp;red&nbsp;de&nbsp;Chaucha."  x="176"  y="140"  width="500"  height="20"  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="El&nbsp;algoritmo&nbsp;de&nbsp;Proof&nbsp;of&nbsp;Work"  target="*wrongAnswer"  x="177"  y="200"  width="500"  height="20"  _clickable_img=""  ]
[s  ]
*question9

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Un algoritmo de desencriptación transforma un texto plano en un texto cifrado utilizando una llave.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question10

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Cuál de los siguientes <b>no es</b> un activo con un sistema centralizado de contabilidad?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Oro"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Kilómetros&nbsp;de&nbsp;Aerolíneas"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Monedas&nbsp;de&nbsp;Videojuegos"  x="177"  y="219"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="Créditos&nbsp;de&nbsp;Facebook"  target="*wrongAnswer"  x="178"  y="278"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question11

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Los mineros de Chaucha ayudan a la red encriptando las transacciones.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question12

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Solamente los desarrolladores autorizados por la fundación Bitcoin pueden enviar BIPs.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question13

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Por qué la red de chaucha se considera más segura cuando se añade más poder de procesamiento?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="La&nbsp;red&nbsp;es&nbsp;menos&nbsp;segura.&nbsp;<br>Ya&nbsp;que&nbsp;eso&nbsp;aumentaría&nbsp;el&nbsp;nivel&nbsp;de&nbsp;dificultad."  x="178"  y="19"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Por&nbsp;que&nbsp;aumenta&nbsp;la&nbsp;redundancia&nbsp;de&nbsp;datos&nbsp;<br>al&nbsp;distribuir&nbsp;la&nbsp;carga&nbsp;en&nbsp;varios&nbsp;computadores."  x="177"  y="100"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Por&nbsp;que&nbsp;aumenta&nbsp;el&nbsp;costo&nbsp;necesario&nbsp;<br>para&nbsp;alcanzar&nbsp;sobre&nbsp;el&nbsp;50%&nbsp;del&nbsp;poder&nbsp;de&nbsp;procesamiento."  x="178"  y="179"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="Por&nbsp;que&nbsp;a&nbsp;mayor&nbsp;poder&nbsp;de&nbsp;procesamiento,&nbsp;<br>más&nbsp;chauchas&nbsp;entran&nbsp;al&nbsp;mercado&nbsp;lo&nbsp;que&nbsp;<br>reduce&nbsp;su&nbsp;poder&nbsp;adquisitivo."  target="*wrongAnswer"  x="178"  y="260"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question14

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Las billeteras determinísticas (HD Wallets) requieren el uso de una determinada frase clave para la encriptación.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question15

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Cuál de las siguientes características no aplica a la red Chaucha?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Transacciones&nbsp;sin&nbsp;trazabilidad"  x="178"  y="19"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Un&nbsp;libro&nbsp;contable&nbsp;público"  x="177"  y="100"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Un&nbsp;modelo&nbsp;de&nbsp;generación&nbsp;de&nbsp;divisas&nbsp;determinista"  x="178"  y="179"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="Comunicación&nbsp;P2P"  target="*wrongAnswer"  x="178"  y="260"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question16

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Qué partes de la red Chaucha está más regulada por el Gobierno?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Cambio&nbsp;de&nbsp;chaucha&nbsp;a&nbsp;dinero&nbsp;tradicional."  x="178"  y="19"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Bibliotecas&nbsp;y&nbsp;herramientas&nbsp;de&nbsp;Software."  x="177"  y="100"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Minería&nbsp;de&nbsp;Chaucha."  x="178"  y="179"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="Creación&nbsp;de&nbsp;Software&nbsp;con&nbsp;Wallets."  target="*wrongAnswer"  x="178"  y="260"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question17

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
La encriptación simétrica es aquella que utiliza la misma llave para encriptar y desencriptar.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question18

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
<b>Todos</b> los exchanges permiten convertir criptomonedas a cualquier divisa tradicional.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question19

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Las pasarelas de pago ofrecen una forma de que los comercios acepten criptomonedas sin la necesidad de que ellos tengan que lidear con criptomonedas.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question20

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Para poder recibir criptomonedas siempre debes tener acceso a internet.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question21

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Las billeteras encriptadas con frases (passphrase) son una forma de identificación de dos pasos (two-factor authentication). (Algo que tienes y algo que sabes)[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question22

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
La cantidad de Chauchas no tiene límites.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question23

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
No debes entregar tu dirección pública de criptomonedas ya que podrán utilizar los fondos.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question24

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Solamente la fundación Bitcoin decide sobre las actualizaciones del protocolo de Bitcoin.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question25

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Siempre puedes revertir las transacciones y recuperar tus chauchas.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question26

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Si alguien crea una dirección de chaucha por segundo. ¿Cuánto tardaría en encontrar que otra persona generó la misma dirección?.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Unos&nbsp;días."  x="178"  y="19"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="2140&nbsp;años"  x="177"  y="100"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="24100&nbsp;años"  x="178"  y="179"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="Más&nbsp;que&nbsp;la&nbsp;edad&nbsp;estimada&nbsp;del&nbsp;Universo."  target="*correctAnswer"  x="178"  y="260"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question27

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Las comisiones de una transacción son pagadas por quien recibe.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question28

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Las divisas deben ser emitidas por un gobierno, reino o comunidad para ser usadas.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question29

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Cuál es el tamaño máximo de cada bloque de Chaucha?.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="1&nbsp;MB"  x="178"  y="19"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="100&nbsp;MB"  x="177"  y="100"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="80&nbsp;Bytes"  x="178"  y="179"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="10&nbsp;MB"  target="*wrongAnswer"  x="178"  y="260"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question30

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
El cliente de chauchad (bitcoind) es un cliente completo.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question31

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Si pierdes la contraseña de tu billetera y no tienes un respaldo. Profesionales de la computación o hackers <b>siempre<b> pueden recuperarla.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question32

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Un cliente bitcoin que soporta SPV puede recibir pagos sin descargar el blockchain completo.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question33

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Las mining pools permiten a los mineros compartir recursos para resolver un bloque y distribuir la recompensa entre ellos.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question34

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
El Protocolo de Pagos Seguro (SPV) provee un mecanismo para solicitar un reembolso sin tener que contactar al soporte al cliente.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question35

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
El ajuste de dificultad es realizado cada vez por los desarrolladores de Chaucha.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question36

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Respaldar las llaves privadas en un lugar seguro permite restaurar una billetera si esta se pierde o es dañada.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question37

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
La fundación Bitcoin fija las tazas de interés como lo haría un banco central.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question38

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Cuál es el problema que el Blockchain de Bitcoin ha resuelto?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Prevención&nbsp;de&nbsp;SPAM."  x="178"  y="19"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Consenso&nbsp;Descentralizado."  x="177"  y="100"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Pagos&nbsp;en&nbsp;línea."  x="178"  y="179"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="Criptografía&nbsp;con&nbsp;llave&nbsp;pública."  target="*wrongAnswer"  x="178"  y="260"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question39

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿La única forma de obtener chauchas es minándolas?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question40

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Cuál de las siguientes propiedades de las llaves privadas es falsa?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Las&nbsp;llaves&nbsp;privadas&nbsp;pueden&nbsp;ser&nbsp;importadas&nbsp;a&nbsp;<br>múltiples&nbsp;billeteras."  x="178"  y="19"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Una&nbsp;llave&nbsp;privada&nbsp;no&nbsp;puede&nbsp;ser&nbsp;<br>obtenida&nbsp;desde&nbsp;una&nbsp;llave&nbsp;pública."  x="177"  y="100"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Puedes&nbsp;cambiar&nbsp;de&nbsp;un&nbsp;formato&nbsp;a&nbsp;otro."  x="178"  y="179"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="Puedes&nbsp;recuperar&nbsp;una&nbsp;<br>llave&nbsp;privada&nbsp;desde&nbsp;la&nbsp;billetera&nbsp;si&nbsp;es&nbsp;extraviada."  target="*wrongAnswer"  x="178"  y="239"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question41

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Siempre se puede cancelar una transacción desde el cliente oficial.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question42

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Por qué los ASICs son mejores en la minería que GPUs o CPUs?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Porque&nbsp;son&nbsp;más&nbsp;grandes."  x="178"  y="19"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Porque&nbsp;son&nbsp;más&nbsp;baratos."  x="177"  y="100"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Porque&nbsp;están&nbsp;diseñados&nbsp;específicamente&nbsp;para&nbsp;la&nbsp;minería."  x="178"  y="179"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="Por&nbsp;que&nbsp;permiten&nbsp;calcular&nbsp;hashes&nbsp;más&nbsp;rápido<br>&nbsp;gracias&nbsp;a&nbsp;la&nbsp;densidad&nbsp;criptográfica&nbsp;del&nbsp;silicio."  target="*wrongAnswer"  x="179"  y="259"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question43

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Cuál de las siguientes afirmaciones es verdad sobre las llaves presentes en los algorítmos de encriptación asimétrica?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Si&nbsp;son&nbsp;sumadas,&nbsp;la&nbsp;llave&nbsp;pública&nbsp;+&nbsp;llave&nbsp;privada<br>dará&nbsp;como&nbsp;resultado&nbsp;cero&nbsp;(0)"  x="178"  y="19"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="La&nbsp;llave&nbsp;privada&nbsp;contiene&nbsp;la&nbsp;llave&nbsp;pública<br>e&nbsp;información&nbsp;privada&nbsp;adicional."  x="177"  y="100"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Si&nbsp;son&nbsp;multiplicadas,&nbsp;la&nbsp;llave&nbsp;privada&nbsp;y&nbsp;la&nbsp;llave&nbsp;pública&nbsp;<br>dará&nbsp;como&nbsp;resultado&nbsp;cero&nbsp;(0)."  x="178"  y="179"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="La&nbsp;llave&nbsp;privada&nbsp;es&nbsp;un&nbsp;recíproco&nbsp;matemático<br>&nbsp;de&nbsp;la&nbsp;llave&nbsp;pública."  target="*correctAnswer"  x="179"  y="259"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question44

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Las firmas digitales pueden ser creadas por cualquiera que conozca la dirección pública de Chaucha.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question45

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
La única forma de aceptar criptomonedas en los comercios es utilizando procesadores de pago creados por terceros.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question46

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Qué es un hash criptográfico?[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Un&nbsp;resumen&nbsp;criptográfico&nbsp;de&nbsp;información."  x="178"  y="19"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Una&nbsp;forma&nbsp;reversible&nbsp;de&nbsp;encriptación."  x="177"  y="100"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Un&nbsp;contador&nbsp;incremental&nbsp;<br>incluido&nbsp;en&nbsp;un&nbsp;bloque&nbsp;de&nbsp;Chaucha."  x="178"  y="179"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="Una&nbsp;firma&nbsp;generada&nbsp;desde&nbsp;una&nbsp;<br>&nbsp;llave&nbsp;privada."  target="*wrongAnswer"  x="179"  y="259"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question47

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
La dificultad de Chaucha es ajustada períodicamente para permitir que se encuentre 1 bloque cada.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Minuto"  x="178"  y="19"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="10&nbsp;Minutos"  x="177"  y="100"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="2.5&nbsp;Minutos"  x="178"  y="179"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  text="5&nbsp;Minutos."  target="*wrongAnswer"  x="179"  y="259"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question48

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Las billeteras en "caliente" son menos seguras que las "en frío" por que las llaves privadas están almacenadas en un dispositivo conectado a internet.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question49

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Una billetera encriptada por una clave (passphrase) permite llaves y direcciones de jerarquía deterministica (HD)[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question50

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Los algoritmos de encriptación transforman el texto plano en un texto crifrado utilizando una llave.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question51

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Un hash criptográfico es una función matemática de una sola via. (one-way)[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question52

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Las direcciones y llaves que son creadas con una aplicación de Bitcoin no pueden ser exportadas o importadas por otra aplicación de Bitcoin.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question53

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Hasta la fecha el protocolo de Bitcoin no ha sido hackeado o comprometido resultando en una pérdida de bitcoins.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question54

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Los comercios que acepten Chauchas pueden ignorar las leyes locales y las regulaciones ya que no aplican.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question55

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
No hay balances o saldos en el blockchain de Chaucha, solamente salidas de transacción sin utilizar UTXO (unspent transaction outputs).[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question56

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
¿Chaucha es completamente anónima?.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question57

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Luego de 6 confirmaciones el pago se puede considerar como realizado.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question58

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
El dinero tradicional es mantenido por instituciones centralizadas como gobiernos y empresas de tarjetas de crédito.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question59

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
Un nodo siempre re-transmite una transacción. Independiente si esta no es válida.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
*question60

[cm  ]
[tb_hide_message_window  ]
[tb_show_message_window  ]
[chara_show  name="don_chaucha"  time="1000"  wait="true"  left="94"  top="75"  width="684"  height="593"  reflect="false"  ]
[tb_start_text mode=3 ]
Pregunta #[emb exp="f.answered + 1"].[r]
El precio de la chaucha está determinado por la oferta y la demanda.[r]
[_tb_end_text]

[chara_hide  name="don_chaucha"  time="1000"  wait="true"  pos_mode="true"  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*correctAnswer"  text="Verdadero"  x="176"  y="99"  width="500"  height=""  _clickable_img=""  ]
[glink  color="white"  storage="questions.ks"  size="20"  target="*wrongAnswer"  text="Falso"  x="175"  y="159"  width="500"  height=""  _clickable_img=""  ]
[s  ]
