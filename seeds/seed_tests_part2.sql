SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

-- =============================================================
-- SEED PART 2: Big Five + ICE Baron EQ + English Basic/Int/Adv
-- =============================================================

-- =============================================================
-- TEST 3: 5 FACTORES DE PERSONALIDAD - BIG FIVE (25 preguntas, Likert 1-5)
-- Dimensiones: O=Apertura C=Consciencia E=ExtraversiÃ³n A=Amabilidad N=Neuroticismo
-- score= valor Likert (1-5), se invierte para N
-- =============================================================
INSERT IGNORE INTO catalog_questions (id,testId,questionText,type,dimension,orderNum) VALUES
('bf_q1', 'ct_bigfive','Me gusta experimentar con ideas nuevas y poco convencionales.','multiple','O',1),
('bf_q2', 'ct_bigfive','Soy una persona imaginativa y creativa.','multiple','O',2),
('bf_q3', 'ct_bigfive','Disfruto de las artes, la mÃºsica y la literatura.','multiple','O',3),
('bf_q4', 'ct_bigfive','Me interesan los temas filosÃ³ficos y abstractos.','multiple','O',4),
('bf_q5', 'ct_bigfive','Me adapto fÃ¡cilmente a situaciones nuevas.','multiple','O',5),
('bf_q6', 'ct_bigfive','Soy organizado/a y sigo un orden en mis actividades.','multiple','C',6),
('bf_q7', 'ct_bigfive','Termino las tareas que empiezo, aunque sean difÃ­ciles.','multiple','C',7),
('bf_q8', 'ct_bigfive','Soy puntual y cumplo con mis compromisos.','multiple','C',8),
('bf_q9', 'ct_bigfive','Trabajo de manera sistemÃ¡tica y planificada.','multiple','C',9),
('bf_q10','ct_bigfive','Siempre hago el mÃ¡ximo esfuerzo en mis tareas.','multiple','C',10),
('bf_q11','ct_bigfive','Soy muy sociable y disfruto estar con mucha gente.','multiple','E',11),
('bf_q12','ct_bigfive','Me siento lleno/a de energÃ­a y entusiasmo.','multiple','E',12),
('bf_q13','ct_bigfive','En reuniones, suelo ser quien anima el ambiente.','multiple','E',13),
('bf_q14','ct_bigfive','Hablo con facilidad con personas que no conozco.','multiple','E',14),
('bf_q15','ct_bigfive','Disfruto ser el centro de atenciÃ³n en grupos.','multiple','E',15),
('bf_q16','ct_bigfive','Me preocupo sinceramente por el bienestar de los demÃ¡s.','multiple','A',16),
('bf_q17','ct_bigfive','ConfÃ­o en las personas y creo que tienen buenas intenciones.','multiple','A',17),
('bf_q18','ct_bigfive','Evito los conflictos y busco la cooperaciÃ³n.','multiple','A',18),
('bf_q19','ct_bigfive','Soy generoso/a y dispuesto/a a ayudar.','multiple','A',19),
('bf_q20','ct_bigfive','Me resulta fÃ¡cil perdonar a quienes me hacen daÃ±o.','multiple','A',20),
('bf_q21','ct_bigfive','Me pongo nervioso/a con facilidad.','multiple','N',21),
('bf_q22','ct_bigfive','Tengo cambios de humor frecuentes.','multiple','N',22),
('bf_q23','ct_bigfive','Me preocupo mucho por cosas que podrÃ­an salir mal.','multiple','N',23),
('bf_q24','ct_bigfive','Me afecto cuando las cosas no salen como esperaba.','multiple','N',24),
('bf_q25','ct_bigfive','Siento estrÃ©s con frecuencia en mi vida diaria.','multiple','N',25);

INSERT IGNORE INTO catalog_answers (id,questionId,text,score) VALUES
('bf_q1_1','bf_q1','Totalmente en desacuerdo',1),('bf_q1_2','bf_q1','En desacuerdo',2),('bf_q1_3','bf_q1','Neutral',3),('bf_q1_4','bf_q1','De acuerdo',4),('bf_q1_5','bf_q1','Totalmente de acuerdo',5),
('bf_q2_1','bf_q2','Totalmente en desacuerdo',1),('bf_q2_2','bf_q2','En desacuerdo',2),('bf_q2_3','bf_q2','Neutral',3),('bf_q2_4','bf_q2','De acuerdo',4),('bf_q2_5','bf_q2','Totalmente de acuerdo',5),
('bf_q3_1','bf_q3','Totalmente en desacuerdo',1),('bf_q3_2','bf_q3','En desacuerdo',2),('bf_q3_3','bf_q3','Neutral',3),('bf_q3_4','bf_q3','De acuerdo',4),('bf_q3_5','bf_q3','Totalmente de acuerdo',5),
('bf_q4_1','bf_q4','Totalmente en desacuerdo',1),('bf_q4_2','bf_q4','En desacuerdo',2),('bf_q4_3','bf_q4','Neutral',3),('bf_q4_4','bf_q4','De acuerdo',4),('bf_q4_5','bf_q4','Totalmente de acuerdo',5),
('bf_q5_1','bf_q5','Totalmente en desacuerdo',1),('bf_q5_2','bf_q5','En desacuerdo',2),('bf_q5_3','bf_q5','Neutral',3),('bf_q5_4','bf_q5','De acuerdo',4),('bf_q5_5','bf_q5','Totalmente de acuerdo',5),
('bf_q6_1','bf_q6','Totalmente en desacuerdo',1),('bf_q6_2','bf_q6','En desacuerdo',2),('bf_q6_3','bf_q6','Neutral',3),('bf_q6_4','bf_q6','De acuerdo',4),('bf_q6_5','bf_q6','Totalmente de acuerdo',5),
('bf_q7_1','bf_q7','Totalmente en desacuerdo',1),('bf_q7_2','bf_q7','En desacuerdo',2),('bf_q7_3','bf_q7','Neutral',3),('bf_q7_4','bf_q7','De acuerdo',4),('bf_q7_5','bf_q7','Totalmente de acuerdo',5),
('bf_q8_1','bf_q8','Totalmente en desacuerdo',1),('bf_q8_2','bf_q8','En desacuerdo',2),('bf_q8_3','bf_q8','Neutral',3),('bf_q8_4','bf_q8','De acuerdo',4),('bf_q8_5','bf_q8','Totalmente de acuerdo',5),
('bf_q9_1','bf_q9','Totalmente en desacuerdo',1),('bf_q9_2','bf_q9','En desacuerdo',2),('bf_q9_3','bf_q9','Neutral',3),('bf_q9_4','bf_q9','De acuerdo',4),('bf_q9_5','bf_q9','Totalmente de acuerdo',5),
('bf_q10_1','bf_q10','Totalmente en desacuerdo',1),('bf_q10_2','bf_q10','En desacuerdo',2),('bf_q10_3','bf_q10','Neutral',3),('bf_q10_4','bf_q10','De acuerdo',4),('bf_q10_5','bf_q10','Totalmente de acuerdo',5),
('bf_q11_1','bf_q11','Totalmente en desacuerdo',1),('bf_q11_2','bf_q11','En desacuerdo',2),('bf_q11_3','bf_q11','Neutral',3),('bf_q11_4','bf_q11','De acuerdo',4),('bf_q11_5','bf_q11','Totalmente de acuerdo',5),
('bf_q12_1','bf_q12','Totalmente en desacuerdo',1),('bf_q12_2','bf_q12','En desacuerdo',2),('bf_q12_3','bf_q12','Neutral',3),('bf_q12_4','bf_q12','De acuerdo',4),('bf_q12_5','bf_q12','Totalmente de acuerdo',5),
('bf_q13_1','bf_q13','Totalmente en desacuerdo',1),('bf_q13_2','bf_q13','En desacuerdo',2),('bf_q13_3','bf_q13','Neutral',3),('bf_q13_4','bf_q13','De acuerdo',4),('bf_q13_5','bf_q13','Totalmente de acuerdo',5),
('bf_q14_1','bf_q14','Totalmente en desacuerdo',1),('bf_q14_2','bf_q14','En desacuerdo',2),('bf_q14_3','bf_q14','Neutral',3),('bf_q14_4','bf_q14','De acuerdo',4),('bf_q14_5','bf_q14','Totalmente de acuerdo',5),
('bf_q15_1','bf_q15','Totalmente en desacuerdo',1),('bf_q15_2','bf_q15','En desacuerdo',2),('bf_q15_3','bf_q15','Neutral',3),('bf_q15_4','bf_q15','De acuerdo',4),('bf_q15_5','bf_q15','Totalmente de acuerdo',5),
('bf_q16_1','bf_q16','Totalmente en desacuerdo',1),('bf_q16_2','bf_q16','En desacuerdo',2),('bf_q16_3','bf_q16','Neutral',3),('bf_q16_4','bf_q16','De acuerdo',4),('bf_q16_5','bf_q16','Totalmente de acuerdo',5),
('bf_q17_1','bf_q17','Totalmente en desacuerdo',1),('bf_q17_2','bf_q17','En desacuerdo',2),('bf_q17_3','bf_q17','Neutral',3),('bf_q17_4','bf_q17','De acuerdo',4),('bf_q17_5','bf_q17','Totalmente de acuerdo',5),
('bf_q18_1','bf_q18','Totalmente en desacuerdo',1),('bf_q18_2','bf_q18','En desacuerdo',2),('bf_q18_3','bf_q18','Neutral',3),('bf_q18_4','bf_q18','De acuerdo',4),('bf_q18_5','bf_q18','Totalmente de acuerdo',5),
('bf_q19_1','bf_q19','Totalmente en desacuerdo',1),('bf_q19_2','bf_q19','En desacuerdo',2),('bf_q19_3','bf_q19','Neutral',3),('bf_q19_4','bf_q19','De acuerdo',4),('bf_q19_5','bf_q19','Totalmente de acuerdo',5),
('bf_q20_1','bf_q20','Totalmente en desacuerdo',1),('bf_q20_2','bf_q20','En desacuerdo',2),('bf_q20_3','bf_q20','Neutral',3),('bf_q20_4','bf_q20','De acuerdo',4),('bf_q20_5','bf_q20','Totalmente de acuerdo',5),
('bf_q21_1','bf_q21','Totalmente en desacuerdo',1),('bf_q21_2','bf_q21','En desacuerdo',2),('bf_q21_3','bf_q21','Neutral',3),('bf_q21_4','bf_q21','De acuerdo',4),('bf_q21_5','bf_q21','Totalmente de acuerdo',5),
('bf_q22_1','bf_q22','Totalmente en desacuerdo',1),('bf_q22_2','bf_q22','En desacuerdo',2),('bf_q22_3','bf_q22','Neutral',3),('bf_q22_4','bf_q22','De acuerdo',4),('bf_q22_5','bf_q22','Totalmente de acuerdo',5),
('bf_q23_1','bf_q23','Totalmente en desacuerdo',1),('bf_q23_2','bf_q23','En desacuerdo',2),('bf_q23_3','bf_q23','Neutral',3),('bf_q23_4','bf_q23','De acuerdo',4),('bf_q23_5','bf_q23','Totalmente de acuerdo',5),
('bf_q24_1','bf_q24','Totalmente en desacuerdo',1),('bf_q24_2','bf_q24','En desacuerdo',2),('bf_q24_3','bf_q24','Neutral',3),('bf_q24_4','bf_q24','De acuerdo',4),('bf_q24_5','bf_q24','Totalmente de acuerdo',5),
('bf_q25_1','bf_q25','Totalmente en desacuerdo',1),('bf_q25_2','bf_q25','En desacuerdo',2),('bf_q25_3','bf_q25','Neutral',3),('bf_q25_4','bf_q25','De acuerdo',4),('bf_q25_5','bf_q25','Totalmente de acuerdo',5);

-- =============================================================
-- TEST 4: COCIENTE EMOCIONAL â€“ ICE Baron (25 preguntas, Likert 1-4)
-- Dimensiones: IA=Intrapersonal IE=Interpersonal AD=AdaptaciÃ³n
--              MG=Manejo EstrÃ©s EA=Estado Ãnimo General
-- =============================================================
INSERT IGNORE INTO catalog_questions (id,testId,questionText,type,dimension,orderNum) VALUES
('eq_q1', 'ct_eq','Soy consciente de mis propias emociones cuando las experimento.','multiple','IA',1),
('eq_q2', 'ct_eq','Puedo describir con precisiÃ³n cÃ³mo me siento en cada momento.','multiple','IA',2),
('eq_q3', 'ct_eq','Me respeto a mÃ­ mismo/a y confÃ­o en mis capacidades.','multiple','IA',3),
('eq_q4', 'ct_eq','ActÃºo segÃºn mis propios valores, aun bajo presiÃ³n.','multiple','IA',4),
('eq_q5', 'ct_eq','Reconozco cuando necesito ayuda y la pido sin dificultad.','multiple','IA',5),
('eq_q6', 'ct_eq','Soy capaz de percibir cÃ³mo se sienten otros sin que me lo digan.','multiple','IE',6),
('eq_q7', 'ct_eq','Mantengo relaciones positivas a largo plazo con facilidad.','multiple','IE',7),
('eq_q8', 'ct_eq','Escucho activamente antes de responder.','multiple','IE',8),
('eq_q9', 'ct_eq','Cuando alguien estÃ¡ triste, sÃ© cÃ³mo apoyarlo/a.','multiple','IE',9),
('eq_q10','ct_eq','Manejo los conflictos de manera constructiva.','multiple','IE',10),
('eq_q11','ct_eq','Me adapto fÃ¡cilmente cuando los planes cambian.','multiple','AD',11),
('eq_q12','ct_eq','Busco soluciones creativas cuando enfrento problemas.','multiple','AD',12),
('eq_q13','ct_eq','Pruebo distintas estrategias si la primera no funciona.','multiple','AD',13),
('eq_q14','ct_eq','Acepto la crÃ­tica y la uso para mejorar.','multiple','AD',14),
('eq_q15','ct_eq','Tolero bien la ambigÃ¼edad y la incertidumbre.','multiple','AD',15),
('eq_q16','ct_eq','Bajo presiÃ³n excesiva, mantengo el control de mis emociones.','multiple','MG',16),
('eq_q17','ct_eq','No exploto fÃ¡cilmente aunque me frustre.','multiple','MG',17),
('eq_q18','ct_eq','Puedo trabajar eficientemente incluso en situaciones tensas.','multiple','MG',18),
('eq_q19','ct_eq','Paso pÃ¡gina rÃ¡pido cuando algo sale mal.','multiple','MG',19),
('eq_q20','ct_eq','Evito que mis emociones negativas afecten mi trato con otros.','multiple','MG',20),
('eq_q21','ct_eq','En general, soy una persona alegre y optimista.','multiple','EA',21),
('eq_q22','ct_eq','Tengo una actitud positiva hacia mi futuro.','multiple','EA',22),
('eq_q23','ct_eq','Encuentro significado y propÃ³sito en mi trabajo.','multiple','EA',23),
('eq_q24','ct_eq','Disfruto de lo que hago a diario.','multiple','EA',24),
('eq_q25','ct_eq','Transmito energÃ­a positiva a las personas a mi alrededor.','multiple','EA',25);

INSERT IGNORE INTO catalog_answers (id,questionId,text,score) VALUES
('eq_q1_1','eq_q1','Rara vez',1),('eq_q1_2','eq_q1','A veces',2),('eq_q1_3','eq_q1','Frecuentemente',3),('eq_q1_4','eq_q1','Siempre',4),
('eq_q2_1','eq_q2','Rara vez',1),('eq_q2_2','eq_q2','A veces',2),('eq_q2_3','eq_q2','Frecuentemente',3),('eq_q2_4','eq_q2','Siempre',4),
('eq_q3_1','eq_q3','Rara vez',1),('eq_q3_2','eq_q3','A veces',2),('eq_q3_3','eq_q3','Frecuentemente',3),('eq_q3_4','eq_q3','Siempre',4),
('eq_q4_1','eq_q4','Rara vez',1),('eq_q4_2','eq_q4','A veces',2),('eq_q4_3','eq_q4','Frecuentemente',3),('eq_q4_4','eq_q4','Siempre',4),
('eq_q5_1','eq_q5','Rara vez',1),('eq_q5_2','eq_q5','A veces',2),('eq_q5_3','eq_q5','Frecuentemente',3),('eq_q5_4','eq_q5','Siempre',4),
('eq_q6_1','eq_q6','Rara vez',1),('eq_q6_2','eq_q6','A veces',2),('eq_q6_3','eq_q6','Frecuentemente',3),('eq_q6_4','eq_q6','Siempre',4),
('eq_q7_1','eq_q7','Rara vez',1),('eq_q7_2','eq_q7','A veces',2),('eq_q7_3','eq_q7','Frecuentemente',3),('eq_q7_4','eq_q7','Siempre',4),
('eq_q8_1','eq_q8','Rara vez',1),('eq_q8_2','eq_q8','A veces',2),('eq_q8_3','eq_q8','Frecuentemente',3),('eq_q8_4','eq_q8','Siempre',4),
('eq_q9_1','eq_q9','Rara vez',1),('eq_q9_2','eq_q9','A veces',2),('eq_q9_3','eq_q9','Frecuentemente',3),('eq_q9_4','eq_q9','Siempre',4),
('eq_q10_1','eq_q10','Rara vez',1),('eq_q10_2','eq_q10','A veces',2),('eq_q10_3','eq_q10','Frecuentemente',3),('eq_q10_4','eq_q10','Siempre',4),
('eq_q11_1','eq_q11','Rara vez',1),('eq_q11_2','eq_q11','A veces',2),('eq_q11_3','eq_q11','Frecuentemente',3),('eq_q11_4','eq_q11','Siempre',4),
('eq_q12_1','eq_q12','Rara vez',1),('eq_q12_2','eq_q12','A veces',2),('eq_q12_3','eq_q12','Frecuentemente',3),('eq_q12_4','eq_q12','Siempre',4),
('eq_q13_1','eq_q13','Rara vez',1),('eq_q13_2','eq_q13','A veces',2),('eq_q13_3','eq_q13','Frecuentemente',3),('eq_q13_4','eq_q13','Siempre',4),
('eq_q14_1','eq_q14','Rara vez',1),('eq_q14_2','eq_q14','A veces',2),('eq_q14_3','eq_q14','Frecuentemente',3),('eq_q14_4','eq_q14','Siempre',4),
('eq_q15_1','eq_q15','Rara vez',1),('eq_q15_2','eq_q15','A veces',2),('eq_q15_3','eq_q15','Frecuentemente',3),('eq_q15_4','eq_q15','Siempre',4),
('eq_q16_1','eq_q16','Rara vez',1),('eq_q16_2','eq_q16','A veces',2),('eq_q16_3','eq_q16','Frecuentemente',3),('eq_q16_4','eq_q16','Siempre',4),
('eq_q17_1','eq_q17','Rara vez',1),('eq_q17_2','eq_q17','A veces',2),('eq_q17_3','eq_q17','Frecuentemente',3),('eq_q17_4','eq_q17','Siempre',4),
('eq_q18_1','eq_q18','Rara vez',1),('eq_q18_2','eq_q18','A veces',2),('eq_q18_3','eq_q18','Frecuentemente',3),('eq_q18_4','eq_q18','Siempre',4),
('eq_q19_1','eq_q19','Rara vez',1),('eq_q19_2','eq_q19','A veces',2),('eq_q19_3','eq_q19','Frecuentemente',3),('eq_q19_4','eq_q19','Siempre',4),
('eq_q20_1','eq_q20','Rara vez',1),('eq_q20_2','eq_q20','A veces',2),('eq_q20_3','eq_q20','Frecuentemente',3),('eq_q20_4','eq_q20','Siempre',4),
('eq_q21_1','eq_q21','Rara vez',1),('eq_q21_2','eq_q21','A veces',2),('eq_q21_3','eq_q21','Frecuentemente',3),('eq_q21_4','eq_q21','Siempre',4),
('eq_q22_1','eq_q22','Rara vez',1),('eq_q22_2','eq_q22','A veces',2),('eq_q22_3','eq_q22','Frecuentemente',3),('eq_q22_4','eq_q22','Siempre',4),
('eq_q23_1','eq_q23','Rara vez',1),('eq_q23_2','eq_q23','A veces',2),('eq_q23_3','eq_q23','Frecuentemente',3),('eq_q23_4','eq_q23','Siempre',4),
('eq_q24_1','eq_q24','Rara vez',1),('eq_q24_2','eq_q24','A veces',2),('eq_q24_3','eq_q24','Frecuentemente',3),('eq_q24_4','eq_q24','Siempre',4),
('eq_q25_1','eq_q25','Rara vez',1),('eq_q25_2','eq_q25','A veces',2),('eq_q25_3','eq_q25','Frecuentemente',3),('eq_q25_4','eq_q25','Siempre',4);

-- =============================================================
-- TEST 5: INGLÃ‰S BÃSICO A1-A2 (20 preguntas, score=1 correcto)
-- =============================================================
INSERT IGNORE INTO catalog_questions (id,testId,questionText,type,dimension,orderNum) VALUES
('en1_q1', 'ct_eng_bas','___ is your name?','multiple','GRAM',1),
('en1_q2', 'ct_eng_bas','She ___ a teacher.','multiple','GRAM',2),
('en1_q3', 'ct_eng_bas','How many ___ are there? (apple / apples)','multiple','VOC',3),
('en1_q4', 'ct_eng_bas','I ___ to the store yesterday.','multiple','GRAM',4),
('en1_q5', 'ct_eng_bas','The opposite of "big" is:','multiple','VOC',5),
('en1_q6', 'ct_eng_bas','What color is the sky?','multiple','VOC',6),
('en1_q7', 'ct_eng_bas','___ you like coffee?','multiple','GRAM',7),
('en1_q8', 'ct_eng_bas','They ___ playing football now.','multiple','GRAM',8),
('en1_q9', 'ct_eng_bas','Which is a greeting?','multiple','VOC',9),
('en1_q10','ct_eng_bas','My brother ___ 10 years old.','multiple','GRAM',10),
('en1_q11','ct_eng_bas','Choose the correct sentence:','multiple','GRAM',11),
('en1_q12','ct_eng_bas','What is the plural of "child"?','multiple','VOC',12),
('en1_q13','ct_eng_bas','___ there any milk in the fridge?','multiple','GRAM',13),
('en1_q14','ct_eng_bas','I have ___ apple and ___ orange.','multiple','GRAM',14),
('en1_q15','ct_eng_bas','She wakes up ___ 7 o\'clock every morning.','multiple','GRAM',15),
('en1_q16','ct_eng_bas','Which word means "amigo"?','multiple','VOC',16),
('en1_q17','ct_eng_bas','What does "expensive" mean?','multiple','VOC',17),
('en1_q18','ct_eng_bas','___ is the supermarket? â€“ It\'s on Main Street.','multiple','COMP',18),
('en1_q19','ct_eng_bas','How ___ does this cost?','multiple','GRAM',19),
('en1_q20','ct_eng_bas','I ___ never been to Paris.','multiple','GRAM',20);

INSERT IGNORE INTO catalog_answers (id,questionId,text,score) VALUES
('en1_q1a','en1_q1','What',1),('en1_q1b','en1_q1','Where',0),('en1_q1c','en1_q1','Who',0),('en1_q1d','en1_q1','Which',0),
('en1_q2a','en1_q2','am',0),('en1_q2b','en1_q2','is',1),('en1_q2c','en1_q2','are',0),('en1_q2d','en1_q2','be',0),
('en1_q3a','en1_q3','apple',0),('en1_q3b','en1_q3','apples',1),('en1_q3c','en1_q3','applees',0),('en1_q3d','en1_q3','appleies',0),
('en1_q4a','en1_q4','go',0),('en1_q4b','en1_q4','goes',0),('en1_q4c','en1_q4','went',1),('en1_q4d','en1_q4','going',0),
('en1_q5a','en1_q5','small',1),('en1_q5b','en1_q5','tall',0),('en1_q5c','en1_q5','heavy',0),('en1_q5d','en1_q5','fast',0),
('en1_q6a','en1_q6','Green',0),('en1_q6b','en1_q6','Blue',1),('en1_q6c','en1_q6','Red',0),('en1_q6d','en1_q6','White',0),
('en1_q7a','en1_q7','Does',1),('en1_q7b','en1_q7','Do',0),('en1_q7c','en1_q7','Are',0),('en1_q7d','en1_q7','Have',0),
('en1_q8a','en1_q8','is',0),('en1_q8b','en1_q8','was',0),('en1_q8c','en1_q8','are',1),('en1_q8d','en1_q8','were',0),
('en1_q9a','en1_q9','Goodbye',0),('en1_q9b','en1_q9','Hello',1),('en1_q9c','en1_q9','Sorry',0),('en1_q9d','en1_q9','Please',0),
('en1_q10a','en1_q10','am',0),('en1_q10b','en1_q10','are',0),('en1_q10c','en1_q10','is',1),('en1_q10d','en1_q10','be',0),
('en1_q11a','en1_q11','She don\'t like pizza',0),('en1_q11b','en1_q11','He doesn\'t likes pizza',0),('en1_q11c','en1_q11','They doesn\'t like pizza',0),('en1_q11d','en1_q11','He doesn\'t like pizza',1),
('en1_q12a','en1_q12','childs',0),('en1_q12b','en1_q12','childes',0),('en1_q12c','en1_q12','children',1),('en1_q12d','en1_q12','childrens',0),
('en1_q13a','en1_q13','Are',0),('en1_q13b','en1_q13','Is',1),('en1_q13c','en1_q13','Does',0),('en1_q13d','en1_q13','Have',0),
('en1_q14a','en1_q14','a / a',0),('en1_q14b','en1_q14','an / a',1),('en1_q14c','en1_q14','a / an',0),('en1_q14d','en1_q14','an / an',0),
('en1_q15a','en1_q15','in',0),('en1_q15b','en1_q15','on',0),('en1_q15c','en1_q15','at',1),('en1_q15d','en1_q15','by',0),
('en1_q16a','en1_q16','enemy',0),('en1_q16b','en1_q16','friend',1),('en1_q16c','en1_q16','family',0),('en1_q16d','en1_q16','brother',0),
('en1_q17a','en1_q17','barato',0),('en1_q17b','en1_q17','rÃ¡pido',0),('en1_q17c','en1_q17','caro',1),('en1_q17d','en1_q17','lento',0),
('en1_q18a','en1_q18','What',0),('en1_q18b','en1_q18','Where',1),('en1_q18c','en1_q18','When',0),('en1_q18d','en1_q18','Why',0),
('en1_q19a','en1_q19','many',0),('en1_q19b','en1_q19','much',1),('en1_q19c','en1_q19','more',0),('en1_q19d','en1_q19','most',0),
('en1_q20a','en1_q20','have',1),('en1_q20b','en1_q20','has',0),('en1_q20c','en1_q20','had',0),('en1_q20d','en1_q20','having',0);

-- =============================================================
-- TEST 6: INGLÃ‰S INTERMEDIO B1-B2 (20 preguntas)
-- =============================================================
INSERT IGNORE INTO catalog_questions (id,testId,questionText,type,dimension,orderNum) VALUES
('en2_q1', 'ct_eng_int','If I ___ you, I would study more.','multiple','GRAM',1),
('en2_q2', 'ct_eng_int','She suggested ___ the meeting to next week.','multiple','GRAM',2),
('en2_q3', 'ct_eng_int','The report ___ already been sent to the manager.','multiple','GRAM',3),
('en2_q4', 'ct_eng_int','He is looking forward ___ the promotion.','multiple','GRAM',4),
('en2_q5', 'ct_eng_int','What does "to put off" mean?','multiple','VOC',5),
('en2_q6', 'ct_eng_int','By the time she arrived, the meeting ___.','multiple','GRAM',6),
('en2_q7', 'ct_eng_int','Choose the correct passive sentence:','multiple','GRAM',7),
('en2_q8', 'ct_eng_int','Which sentence uses reported speech correctly?','multiple','GRAM',8),
('en2_q9', 'ct_eng_int','What is a synonym of "persistent"?','multiple','VOC',9),
('en2_q10','ct_eng_int','Despite ___ tired, she kept working.','multiple','GRAM',10),
('en2_q11','ct_eng_int','The company ___ for 20 years when it was sold.','multiple','GRAM',11),
('en2_q12','ct_eng_int','What does "run into" mean?','multiple','VOC',12),
('en2_q13','ct_eng_int','This is the project ___ we have been working on.','multiple','GRAM',13),
('en2_q14','ct_eng_int','I wish I ___ more time to travel.','multiple','GRAM',14),
('en2_q15','ct_eng_int','Choose the most formal alternative to "get":','multiple','VOC',15),
('en2_q16','ct_eng_int','She ___ promoted if she had worked harder.','multiple','GRAM',16),
('en2_q17','ct_eng_int','What is the meaning of "ambiguous"?','multiple','VOC',17),
('en2_q18','ct_eng_int','___ the bad weather, the event was a success.','multiple','GRAM',18),
('en2_q19','ct_eng_int','The negotiations are ___ progress at the moment.','multiple','GRAM',19),
('en2_q20','ct_eng_int','Choose the correct word: The CEO gave a very ___ speech.','multiple','VOC',20);

INSERT IGNORE INTO catalog_answers (id,questionId,text,score) VALUES
('en2_q1a','en2_q1','am',0),('en2_q1b','en2_q1','was',0),('en2_q1c','en2_q1','were',1),('en2_q1d','en2_q1','would be',0),
('en2_q2a','en2_q2','postpone',0),('en2_q2b','en2_q2','postponing',1),('en2_q2c','en2_q2','to postpone',0),('en2_q2d','en2_q2','postponed',0),
('en2_q3a','en2_q3','had',0),('en2_q3b','en2_q3','has',1),('en2_q3c','en2_q3','have',0),('en2_q3d','en2_q3','was',0),
('en2_q4a','en2_q4','to get',0),('en2_q4b','en2_q4','get',0),('en2_q4c','en2_q4','getting',1),('en2_q4d','en2_q4','got',0),
('en2_q5a','en2_q5','to postpone',1),('en2_q5b','en2_q5','to hurry',0),('en2_q5c','en2_q5','to cancel',0),('en2_q5d','en2_q5','to begin',0),
('en2_q6a','en2_q6','already ended',0),('en2_q6b','en2_q6','has ended',0),('en2_q6c','en2_q6','had already ended',1),('en2_q6d','en2_q6','already ends',0),
('en2_q7a','en2_q7','The letter written by John.',0),('en2_q7b','en2_q7','The letter was written by John.',1),('en2_q7c','en2_q7','John writing the letter.',0),('en2_q7d','en2_q7','The letter write by John.',0),
('en2_q8a','en2_q8','He said he is happy.',0),('en2_q8b','en2_q8','He told that he was happy.',0),('en2_q8c','en2_q8','He said that he was happy.',1),('en2_q8d','en2_q8','He said that he is been happy.',0),
('en2_q9a','en2_q9','inconsistent',0),('en2_q9b','en2_q9','stubborn',0),('en2_q9c','en2_q9','determined',1),('en2_q9d','en2_q9','fragile',0),
('en2_q10a','en2_q10','been',0),('en2_q10b','en2_q10','being',1),('en2_q10c','en2_q10','be',0),('en2_q10d','en2_q10','was',0),
('en2_q11a','en2_q11','was operating',0),('en2_q11b','en2_q11','has been operating',0),('en2_q11c','en2_q11','had been operating',1),('en2_q11d','en2_q11','operated',0),
('en2_q12a','en2_q12','to avoid someone',0),('en2_q12b','en2_q12','to run quickly',0),('en2_q12c','en2_q12','to meet someone by chance',1),('en2_q12d','en2_q12','to be late',0),
('en2_q13a','en2_q13','which',0),('en2_q13b','en2_q13','who',0),('en2_q13c','en2_q13','that',1),('en2_q13d','en2_q13','what',0),
('en2_q14a','en2_q14','have',0),('en2_q14b','en2_q14','had',1),('en2_q14c','en2_q14','has',0),('en2_q14d','en2_q14','having',0),
('en2_q15a','en2_q15','obtain',1),('en2_q15b','en2_q15','grab',0),('en2_q15c','en2_q15','pick up',0),('en2_q15d','en2_q15','fetch',0),
('en2_q16a','en2_q16','would be',0),('en2_q16b','en2_q16','will be',0),('en2_q16c','en2_q16','would have been',1),('en2_q16d','en2_q16','had been',0),
('en2_q17a','en2_q17','very clear',0),('en2_q17b','en2_q17','open to multiple interpretations',1),('en2_q17c','en2_q17','very aggressive',0),('en2_q17d','en2_q17','extremely simple',0),
('en2_q18a','en2_q18','Although',0),('en2_q18b','en2_q18','Despite',1),('en2_q18c','en2_q18','However',0),('en2_q18d','en2_q18','Even though',0),
('en2_q19a','en2_q19','in',1),('en2_q19b','en2_q19','on',0),('en2_q19c','en2_q19','at',0),('en2_q19d','en2_q19','under',0),
('en2_q20a','en2_q20','compelling',1),('en2_q20b','en2_q20','compelled',0),('en2_q20c','en2_q20','compel',0),('en2_q20d','en2_q20','compellingly',0);

-- =============================================================
-- TEST 7: INGLÃ‰S AVANZADO C1-C2 (20 preguntas)
-- =============================================================
INSERT IGNORE INTO catalog_questions (id,testId,questionText,type,dimension,orderNum) VALUES
('en3_q1', 'ct_eng_adv','Had she known about the issue, she ___ intervened sooner.','multiple','GRAM',1),
('en3_q2', 'ct_eng_adv','The board is unlikely ___ any further expansion.','multiple','GRAM',2),
('en3_q3', 'ct_eng_adv','What does "to bear the brunt of" mean?','multiple','IDM',3),
('en3_q4', 'ct_eng_adv','Choose the sentence with the correct subjunctive:','multiple','GRAM',4),
('en3_q5', 'ct_eng_adv','The findings ___ the team to reconsider its strategy.','multiple','GRAM',5),
('en3_q6', 'ct_eng_adv','The phrase "notwithstanding the above" means:','multiple','VOC',6),
('en3_q7', 'ct_eng_adv','___ is required, the project manager will escalate the issue.','multiple','GRAM',7),
('en3_q8', 'ct_eng_adv','The data is ___ to suggest a clear correlation.','multiple','VOC',8),
('en3_q9', 'ct_eng_adv','What is a correct inversion structure?','multiple','GRAM',9),
('en3_q10','ct_eng_adv','The acquisition was completed ___ regulatory approval.','multiple','GRAM',10),
('en3_q11','ct_eng_adv','What does "to hedge one\'s bets" mean?','multiple','IDM',11),
('en3_q12','ct_eng_adv','Choose the word that best completes: "The policy has ___ criticism."','multiple','VOC',12),
('en3_q13','ct_eng_adv','Which sentence correctly uses a cleft structure?','multiple','GRAM',13),
('en3_q14','ct_eng_adv','The audit ___ that irregularities existed long before the crisis.','multiple','GRAM',14),
('en3_q15','ct_eng_adv','What is the meaning of "ostensibly"?','multiple','VOC',15),
('en3_q16','ct_eng_adv','Not only ___ the merger approved, but it also tripled revenues.','multiple','GRAM',16),
('en3_q17','ct_eng_adv','Which word is closest in meaning to "obfuscate"?','multiple','VOC',17),
('en3_q18','ct_eng_adv','___ to arrive early, she nevertheless missed the opening session.','multiple','GRAM',18),
('en3_q19','ct_eng_adv','The clause "provided that" introduces a:','multiple','GRAM',19),
('en3_q20','ct_eng_adv','Choose the most precise paraphrase of "The market has plateaued":','multiple','VOC',20);

INSERT IGNORE INTO catalog_answers (id,questionId,text,score) VALUES
('en3_q1a','en3_q1','would have',1),('en3_q1b','en3_q1','would',0),('en3_q1c','en3_q1','will have',0),('en3_q1d','en3_q1','had',0),
('en3_q2a','en3_q2','approve',0),('en3_q2b','en3_q2','approving',0),('en3_q2c','en3_q2','to approve',1),('en3_q2d','en3_q2','approved',0),
('en3_q3a','en3_q3','to celebrate success',0),('en3_q3b','en3_q3','to bear the worst impact of something',1),('en3_q3c','en3_q3','to hold a grudge',0),('en3_q3d','en3_q3','to take responsibility unfairly',0),
('en3_q4a','en3_q4','It is essential that he completes the task.',0),('en3_q4b','en3_q4','It is essential that he complete the task.',1),('en3_q4c','en3_q4','It is essential that he will complete the task.',0),('en3_q4d','en3_q4','It is essential that he completing the task.',0),
('en3_q5a','en3_q5','prompted',1),('en3_q5b','en3_q5','prompted to',0),('en3_q5c','en3_q5','had prompted',0),('en3_q5d','en3_q5','was prompting',0),
('en3_q6a','en3_q6','in addition to what was stated above',0),('en3_q6b','en3_q6','despite what was stated above',1),('en3_q6c','en3_q6','because of the above',0),('en3_q6d','en3_q6','according to the above',0),
('en3_q7a','en3_q7','Should it be',1),('en3_q7b','en3_q7','If it would be',0),('en3_q7c','en3_q7','If being',0),('en3_q7d','en3_q7','Was it to be',0),
('en3_q8a','en3_q8','insufficient',1),('en3_q8b','en3_q8','too sufficient',0),('en3_q8c','en3_q8','barely accurate',0),('en3_q8d','en3_q8','not conclusive enough',0),
('en3_q9a','en3_q9','Not until he saw the evidence, he believed it.',0),('en3_q9b','en3_q9','Rarely does she arrive late.',1),('en3_q9c','en3_q9','Only if he will try, he will succeed.',0),('en3_q9d','en3_q9','Seldom he makes mistakes.',0),
('en3_q10a','en3_q10','pending',1),('en3_q10b','en3_q10','despite',0),('en3_q10c','en3_q10','unless',0),('en3_q10d','en3_q10','whereas',0),
('en3_q11a','en3_q11','to make a safe bet',0),('en3_q11b','en3_q11','to avoid all risks',0),('en3_q11c','en3_q11','to reduce risk by taking multiple options',1),('en3_q11d','en3_q11','to refuse to make a decision',0),
('en3_q12a','en3_q12','elicited',1),('en3_q12b','en3_q12','illicited',0),('en3_q12c','en3_q12','arised',0),('en3_q12d','en3_q12','risen',0),
('en3_q13a','en3_q13','What she did was resign.',1),('en3_q13b','en3_q13','It was her resigned.',0),('en3_q13c','en3_q13','She what resigned.',0),('en3_q13d','en3_q13','That she resigned what happened.',0),
('en3_q14a','en3_q14','revealed',1),('en3_q14b','en3_q14','had revealed',0),('en3_q14c','en3_q14','has revealed',0),('en3_q14d','en3_q14','was revealing',0),
('en3_q15a','en3_q15','remarkably',0),('en3_q15b','en3_q15','apparently or on the surface',1),('en3_q15c','en3_q15','obviously',0),('en3_q15d','en3_q15','secretly',0),
('en3_q16a','en3_q16','was it',1),('en3_q16b','en3_q16','it was',0),('en3_q16c','en3_q16','it has been',0),('en3_q16d','en3_q16','has it been',0),
('en3_q17a','en3_q17','to clarify',0),('en3_q17b','en3_q17','to confuse or conceal',1),('en3_q17c','en3_q17','to exaggerate',0),('en3_q17d','en3_q17','to illuminate',0),
('en3_q18a','en3_q18','Intending',0),('en3_q18b','en3_q18','Having intended',1),('en3_q18c','en3_q18','Being intended',0),('en3_q18d','en3_q18','To intend',0),
('en3_q19a','en3_q19','contrasting clause',0),('en3_q19b','en3_q19','conditional clause',1),('en3_q19c','en3_q19','concessive clause',0),('en3_q19d','en3_q19','causal clause',0),
('en3_q20a','en3_q20','Market growth has stopped',1),('en3_q20b','en3_q20','Market prices have increased',0),('en3_q20c','en3_q20','Market competition has declined',0),('en3_q20d','en3_q20','Market demand is uncertain',0);

SET FOREIGN_KEY_CHECKS=1;

