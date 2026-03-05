-- =============================================================
-- SEED PART 3: 5 Existing tests completed
-- Estilo de Venta, Liderazgo, 16PF, Estabilidad Laboral, Integridad
-- =============================================================

-- STEP 1: Ensure the 5 parent catalog_tests rows exist (must run BEFORE questions)
-- If they already exist, INSERT IGNORE skips them safely.
INSERT IGNORE INTO catalog_tests (id, `key`, name, category, description, durationMins, isActive, updatedAt) VALUES
('ct_venta',   'VENTAS',     'Estilo de Venta',             'Habilidades',  'Identifica el estilo de venta predominante y competencias comerciales del candidato.', 20, 1, NOW()),
('ct_lider',   'LIDERAZGO',  'Liderazgo',                   'Competencias', 'Diagnostica el estilo de liderazgo y habilidades directivas del candidato.', 20, 1, NOW()),
('ct_16pf',    '16PF',       '16 Factores de Personalidad', 'Personalidad', 'Perfil profundo de personalidad con 16 dimensiones de Cattell.', 40, 1, NOW()),
('ct_estab',   'ESTABILIDAD','Estabilidad Laboral',         'Competencias', 'Mide la estabilidad, compromiso y retension del candidato en relaciones laborales.', 15, 1, NOW()),
('ct_integ',   'INTEGRIDAD', 'Integridad',                  'Competencias', 'Evalua honestidad, etica y confiabilidad del candidato en el entorno laboral.', 15, 1, NOW());

-- STEP 2: Now insert questions and answers (parents guaranteed to exist above)

-- =============================================================
-- TEST 8: ESTILO DE VENTA (20 preguntas, Likert 1-5)
-- Dimensiones: CD=Consultivo, RE=Relacional, AG=Agresivo/Directo, TN=TÃ©cnico
-- =============================================================
INSERT IGNORE INTO catalog_questions (id,testId,questionText,type,dimension,orderNum) VALUES
('vt_q1', 'ct_venta','Cuando visito un cliente, mi primera pregunta es sobre sus necesidades reales.','multiple','CD',1),
('vt_q2', 'ct_venta','Construir relaciones a largo plazo es mÃ¡s importante que cerrar la venta hoy.','multiple','RE',2),
('vt_q3', 'ct_venta','SÃ© exactamente el precio y condiciÃ³n mÃ­nima que puedo ofrecer antes de negociar.','multiple','TN',3),
('vt_q4', 'ct_venta','Presiono al cliente para que tome una decisiÃ³n en la misma visita.','multiple','AG',4),
('vt_q5', 'ct_venta','Preparo propuestas tÃ©cnicas detalladas con datos y comparativas.','multiple','TN',5),
('vt_q6', 'ct_venta','Cuando un cliente dice "no", busco entender el motivo antes de responder.','multiple','CD',6),
('vt_q7', 'ct_venta','Recuerdo datos personales de mis clientes (cumpleaÃ±os, proyectos, familia).','multiple','RE',7),
('vt_q8', 'ct_venta','Mi objetivo es superar mi meta de ventas mensual, sin importar cÃ³mo.','multiple','AG',8),
('vt_q9', 'ct_venta','Adapto mi soluciÃ³n segÃºn el problema especÃ­fico del cliente.','multiple','CD',9),
('vt_q10','ct_venta','Hago seguimiento constante para fortalecer la relaciÃ³n, no solo para vender.','multiple','RE',10),
('vt_q11','ct_venta','Domino los aspectos tÃ©cnicos de mi producto mejor que la competencia.','multiple','TN',11),
('vt_q12','ct_venta','Cuando siento que el cliente duda, aumento la urgencia de la oferta.','multiple','AG',12),
('vt_q13','ct_venta','Hago preguntas abiertas para descubrir necesidades que el cliente no menciona.','multiple','CD',13),
('vt_q14','ct_venta','Trato a mis clientes como amigos, no solo como cuentas.','multiple','RE',14),
('vt_q15','ct_venta','Uso comparativas de ROI y costos para respaldar mi propuesta.','multiple','TN',15),
('vt_q16','ct_venta','No me rindo fÃ¡cilmente ante objeciones; insisto hasta el cierre.','multiple','AG',16),
('vt_q17','ct_venta','Escucho mÃ¡s de lo que hablo durante una visita de ventas.','multiple','CD',17),
('vt_q18','ct_venta','Mis clientes me refieren a otros porque confÃ­an en mÃ­ como persona.','multiple','RE',18),
('vt_q19','ct_venta','Me mantengo actualizado/a en tendencias del mercado y del producto.','multiple','TN',19),
('vt_q20','ct_venta','Uso tÃ©cnicas de cierre (urgencia, escasez, descuento limitado) de forma deliberada.','multiple','AG',20);

INSERT IGNORE INTO catalog_answers (id,questionId,text,score) VALUES
('vt_q1_1','vt_q1','Nunca',1),('vt_q1_2','vt_q1','Pocas veces',2),('vt_q1_3','vt_q1','A veces',3),('vt_q1_4','vt_q1','Frecuentemente',4),('vt_q1_5','vt_q1','Siempre',5),
('vt_q2_1','vt_q2','Nunca',1),('vt_q2_2','vt_q2','Pocas veces',2),('vt_q2_3','vt_q2','A veces',3),('vt_q2_4','vt_q2','Frecuentemente',4),('vt_q2_5','vt_q2','Siempre',5),
('vt_q3_1','vt_q3','Nunca',1),('vt_q3_2','vt_q3','Pocas veces',2),('vt_q3_3','vt_q3','A veces',3),('vt_q3_4','vt_q3','Frecuentemente',4),('vt_q3_5','vt_q3','Siempre',5),
('vt_q4_1','vt_q4','Nunca',1),('vt_q4_2','vt_q4','Pocas veces',2),('vt_q4_3','vt_q4','A veces',3),('vt_q4_4','vt_q4','Frecuentemente',4),('vt_q4_5','vt_q4','Siempre',5),
('vt_q5_1','vt_q5','Nunca',1),('vt_q5_2','vt_q5','Pocas veces',2),('vt_q5_3','vt_q5','A veces',3),('vt_q5_4','vt_q5','Frecuentemente',4),('vt_q5_5','vt_q5','Siempre',5),
('vt_q6_1','vt_q6','Nunca',1),('vt_q6_2','vt_q6','Pocas veces',2),('vt_q6_3','vt_q6','A veces',3),('vt_q6_4','vt_q6','Frecuentemente',4),('vt_q6_5','vt_q6','Siempre',5),
('vt_q7_1','vt_q7','Nunca',1),('vt_q7_2','vt_q7','Pocas veces',2),('vt_q7_3','vt_q7','A veces',3),('vt_q7_4','vt_q7','Frecuentemente',4),('vt_q7_5','vt_q7','Siempre',5),
('vt_q8_1','vt_q8','Nunca',1),('vt_q8_2','vt_q8','Pocas veces',2),('vt_q8_3','vt_q8','A veces',3),('vt_q8_4','vt_q8','Frecuentemente',4),('vt_q8_5','vt_q8','Siempre',5),
('vt_q9_1','vt_q9','Nunca',1),('vt_q9_2','vt_q9','Pocas veces',2),('vt_q9_3','vt_q9','A veces',3),('vt_q9_4','vt_q9','Frecuentemente',4),('vt_q9_5','vt_q9','Siempre',5),
('vt_q10_1','vt_q10','Nunca',1),('vt_q10_2','vt_q10','Pocas veces',2),('vt_q10_3','vt_q10','A veces',3),('vt_q10_4','vt_q10','Frecuentemente',4),('vt_q10_5','vt_q10','Siempre',5),
('vt_q11_1','vt_q11','Nunca',1),('vt_q11_2','vt_q11','Pocas veces',2),('vt_q11_3','vt_q11','A veces',3),('vt_q11_4','vt_q11','Frecuentemente',4),('vt_q11_5','vt_q11','Siempre',5),
('vt_q12_1','vt_q12','Nunca',1),('vt_q12_2','vt_q12','Pocas veces',2),('vt_q12_3','vt_q12','A veces',3),('vt_q12_4','vt_q12','Frecuentemente',4),('vt_q12_5','vt_q12','Siempre',5),
('vt_q13_1','vt_q13','Nunca',1),('vt_q13_2','vt_q13','Pocas veces',2),('vt_q13_3','vt_q13','A veces',3),('vt_q13_4','vt_q13','Frecuentemente',4),('vt_q13_5','vt_q13','Siempre',5),
('vt_q14_1','vt_q14','Nunca',1),('vt_q14_2','vt_q14','Pocas veces',2),('vt_q14_3','vt_q14','A veces',3),('vt_q14_4','vt_q14','Frecuentemente',4),('vt_q14_5','vt_q14','Siempre',5),
('vt_q15_1','vt_q15','Nunca',1),('vt_q15_2','vt_q15','Pocas veces',2),('vt_q15_3','vt_q15','A veces',3),('vt_q15_4','vt_q15','Frecuentemente',4),('vt_q15_5','vt_q15','Siempre',5),
('vt_q16_1','vt_q16','Nunca',1),('vt_q16_2','vt_q16','Pocas veces',2),('vt_q16_3','vt_q16','A veces',3),('vt_q16_4','vt_q16','Frecuentemente',4),('vt_q16_5','vt_q16','Siempre',5),
('vt_q17_1','vt_q17','Nunca',1),('vt_q17_2','vt_q17','Pocas veces',2),('vt_q17_3','vt_q17','A veces',3),('vt_q17_4','vt_q17','Frecuentemente',4),('vt_q17_5','vt_q17','Siempre',5),
('vt_q18_1','vt_q18','Nunca',1),('vt_q18_2','vt_q18','Pocas veces',2),('vt_q18_3','vt_q18','A veces',3),('vt_q18_4','vt_q18','Frecuentemente',4),('vt_q18_5','vt_q18','Siempre',5),
('vt_q19_1','vt_q19','Nunca',1),('vt_q19_2','vt_q19','Pocas veces',2),('vt_q19_3','vt_q19','A veces',3),('vt_q19_4','vt_q19','Frecuentemente',4),('vt_q19_5','vt_q19','Siempre',5),
('vt_q20_1','vt_q20','Nunca',1),('vt_q20_2','vt_q20','Pocas veces',2),('vt_q20_3','vt_q20','A veces',3),('vt_q20_4','vt_q20','Frecuentemente',4),('vt_q20_5','vt_q20','Siempre',5);

-- =============================================================
-- TEST 9: LIDERAZGO (20 preguntas, Likert 1-5)
-- Dimensiones: TR=Transformacional, TX=Transaccional, SV=Servidor, ST=Situacional
-- =============================================================
INSERT IGNORE INTO catalog_questions (id,testId,questionText,type,dimension,orderNum) VALUES
('ld_q1', 'ct_lider','Inspiro a mi equipo con una visiÃ³n clara del futuro.','multiple','TR',1),
('ld_q2', 'ct_lider','Establezco objetivos y recompensas claras para motivar al equipo.','multiple','TX',2),
('ld_q3', 'ct_lider','Mi prioridad es eliminar los obstÃ¡culos que frenan a mi equipo.','multiple','SV',3),
('ld_q4', 'ct_lider','Adapto mi estilo de liderazgo segÃºn la madurez de cada colaborador.','multiple','ST',4),
('ld_q5', 'ct_lider','Fomento que mi equipo cuestione supuestos y busque nuevas soluciones.','multiple','TR',5),
('ld_q6', 'ct_lider','Hago seguimiento constante del cumplimiento de metas y corrijo desviaciones.','multiple','TX',6),
('ld_q7', 'ct_lider','Pregunto regularmente a mi equipo quÃ© necesita de mÃ­ para ser mÃ¡s efectivo.','multiple','SV',7),
('ld_q8', 'ct_lider','Cuando alguien del equipo es nuevo, le dirijo paso a paso hasta que gane confianza.','multiple','ST',8),
('ld_q9', 'ct_lider','Contagio mi entusiasmo y energÃ­a a las personas que trabajo.','multiple','TR',9),
('ld_q10','ct_lider','Reconozco y recompenso pÃºblicamente el buen desempeÃ±o.','multiple','TX',10),
('ld_q11','ct_lider','Pongo el bienestar y el desarrollo de mi equipo antes que mis logros personales.','multiple','SV',11),
('ld_q12','ct_lider','Delego mÃ¡s autonomÃ­a a colaboradores con experiencia y compromiso.','multiple','ST',12),
('ld_q13','ct_lider','Articulo valores y propÃ³sito que van mÃ¡s allÃ¡ del trabajo diario.','multiple','TR',13),
('ld_q14','ct_lider','Monitoreo indicadores clave para asegurar el cumplimiento de expectativas.','multiple','TX',14),
('ld_q15','ct_lider','Me preocupo genuinamente por el crecimiento profesional de cada miembro.','multiple','SV',15),
('ld_q16','ct_lider','En situaciones de crisis, cambio mi intervenciÃ³n segÃºn lo que la situaciÃ³n requiere.','multiple','ST',16),
('ld_q17','ct_lider','Ayudo a mi equipo a ver cÃ³mo su trabajo contribuye a un objetivo mayor.','multiple','TR',17),
('ld_q18','ct_lider','Defino consecuencias claras cuando no se cumplen los acuerdos.','multiple','TX',18),
('ld_q19','ct_lider','Escucho con empatÃ­a y actÃºo para resolver los problemas de mi equipo.','multiple','SV',19),
('ld_q20','ct_lider','EvalÃºo el nivel de habilidad y motivaciÃ³n de cada persona antes de asignarle tareas.','multiple','ST',20);

INSERT IGNORE INTO catalog_answers (id,questionId,text,score) VALUES
('ld_q1_1','ld_q1','Nunca',1),('ld_q1_2','ld_q1','Pocas veces',2),('ld_q1_3','ld_q1','A veces',3),('ld_q1_4','ld_q1','Frecuentemente',4),('ld_q1_5','ld_q1','Siempre',5),
('ld_q2_1','ld_q2','Nunca',1),('ld_q2_2','ld_q2','Pocas veces',2),('ld_q2_3','ld_q2','A veces',3),('ld_q2_4','ld_q2','Frecuentemente',4),('ld_q2_5','ld_q2','Siempre',5),
('ld_q3_1','ld_q3','Nunca',1),('ld_q3_2','ld_q3','Pocas veces',2),('ld_q3_3','ld_q3','A veces',3),('ld_q3_4','ld_q3','Frecuentemente',4),('ld_q3_5','ld_q3','Siempre',5),
('ld_q4_1','ld_q4','Nunca',1),('ld_q4_2','ld_q4','Pocas veces',2),('ld_q4_3','ld_q4','A veces',3),('ld_q4_4','ld_q4','Frecuentemente',4),('ld_q4_5','ld_q4','Siempre',5),
('ld_q5_1','ld_q5','Nunca',1),('ld_q5_2','ld_q5','Pocas veces',2),('ld_q5_3','ld_q5','A veces',3),('ld_q5_4','ld_q5','Frecuentemente',4),('ld_q5_5','ld_q5','Siempre',5),
('ld_q6_1','ld_q6','Nunca',1),('ld_q6_2','ld_q6','Pocas veces',2),('ld_q6_3','ld_q6','A veces',3),('ld_q6_4','ld_q6','Frecuentemente',4),('ld_q6_5','ld_q6','Siempre',5),
('ld_q7_1','ld_q7','Nunca',1),('ld_q7_2','ld_q7','Pocas veces',2),('ld_q7_3','ld_q7','A veces',3),('ld_q7_4','ld_q7','Frecuentemente',4),('ld_q7_5','ld_q7','Siempre',5),
('ld_q8_1','ld_q8','Nunca',1),('ld_q8_2','ld_q8','Pocas veces',2),('ld_q8_3','ld_q8','A veces',3),('ld_q8_4','ld_q8','Frecuentemente',4),('ld_q8_5','ld_q8','Siempre',5),
('ld_q9_1','ld_q9','Nunca',1),('ld_q9_2','ld_q9','Pocas veces',2),('ld_q9_3','ld_q9','A veces',3),('ld_q9_4','ld_q9','Frecuentemente',4),('ld_q9_5','ld_q9','Siempre',5),
('ld_q10_1','ld_q10','Nunca',1),('ld_q10_2','ld_q10','Pocas veces',2),('ld_q10_3','ld_q10','A veces',3),('ld_q10_4','ld_q10','Frecuentemente',4),('ld_q10_5','ld_q10','Siempre',5),
('ld_q11_1','ld_q11','Nunca',1),('ld_q11_2','ld_q11','Pocas veces',2),('ld_q11_3','ld_q11','A veces',3),('ld_q11_4','ld_q11','Frecuentemente',4),('ld_q11_5','ld_q11','Siempre',5),
('ld_q12_1','ld_q12','Nunca',1),('ld_q12_2','ld_q12','Pocas veces',2),('ld_q12_3','ld_q12','A veces',3),('ld_q12_4','ld_q12','Frecuentemente',4),('ld_q12_5','ld_q12','Siempre',5),
('ld_q13_1','ld_q13','Nunca',1),('ld_q13_2','ld_q13','Pocas veces',2),('ld_q13_3','ld_q13','A veces',3),('ld_q13_4','ld_q13','Frecuentemente',4),('ld_q13_5','ld_q13','Siempre',5),
('ld_q14_1','ld_q14','Nunca',1),('ld_q14_2','ld_q14','Pocas veces',2),('ld_q14_3','ld_q14','A veces',3),('ld_q14_4','ld_q14','Frecuentemente',4),('ld_q14_5','ld_q14','Siempre',5),
('ld_q15_1','ld_q15','Nunca',1),('ld_q15_2','ld_q15','Pocas veces',2),('ld_q15_3','ld_q15','A veces',3),('ld_q15_4','ld_q15','Frecuentemente',4),('ld_q15_5','ld_q15','Siempre',5),
('ld_q16_1','ld_q16','Nunca',1),('ld_q16_2','ld_q16','Pocas veces',2),('ld_q16_3','ld_q16','A veces',3),('ld_q16_4','ld_q16','Frecuentemente',4),('ld_q16_5','ld_q16','Siempre',5),
('ld_q17_1','ld_q17','Nunca',1),('ld_q17_2','ld_q17','Pocas veces',2),('ld_q17_3','ld_q17','A veces',3),('ld_q17_4','ld_q17','Frecuentemente',4),('ld_q17_5','ld_q17','Siempre',5),
('ld_q18_1','ld_q18','Nunca',1),('ld_q18_2','ld_q18','Pocas veces',2),('ld_q18_3','ld_q18','A veces',3),('ld_q18_4','ld_q18','Frecuentemente',4),('ld_q18_5','ld_q18','Siempre',5),
('ld_q19_1','ld_q19','Nunca',1),('ld_q19_2','ld_q19','Pocas veces',2),('ld_q19_3','ld_q19','A veces',3),('ld_q19_4','ld_q19','Frecuentemente',4),('ld_q19_5','ld_q19','Siempre',5),
('ld_q20_1','ld_q20','Nunca',1),('ld_q20_2','ld_q20','Pocas veces',2),('ld_q20_3','ld_q20','A veces',3),('ld_q20_4','ld_q20','Frecuentemente',4),('ld_q20_5','ld_q20','Siempre',5);

-- =============================================================
-- TEST 10: 16PF - 16 FACTORES DE PERSONALIDAD (32 preguntas, A/B/C)
-- 8 factores Ã— 4 preguntas: A=Afabilidad B=Razonamiento C=Estabilidad
-- E=Dominancia F=AnimaciÃ³n G=AtenciÃ³n a normas H=Atrevimiento I=Sensibilidad
-- score: A=1 B=2 C=3 (B suele ser opciÃ³n media/neutral)
-- =============================================================
INSERT IGNORE INTO catalog_questions (id,testId,questionText,type,dimension,orderNum) VALUES
('pf_q1','ct_16pf','Me siento mÃ¡s cÃ³modo/a con personas conocidas que con extraÃ±os.','multiple','A',1),
('pf_q2','ct_16pf','Hablo fÃ¡cilmente con personas que acabo de conocer.','multiple','A',2),
('pf_q3','ct_16pf','Prefiero actividades en grupo frente a actividades en solitario.','multiple','A',3),
('pf_q4','ct_16pf','Me resulta natural iniciar conversaciones con personas nuevas.','multiple','A',4),
('pf_q5','ct_16pf','Antes de decidir, analizo cuidadosamente todas las opciones.','multiple','B',5),
('pf_q6','ct_16pf','Me resultan fÃ¡ciles los problemas de lÃ³gica y razonamiento.','multiple','B',6),
('pf_q7','ct_16pf','Encuentro soluciones originales a problemas complejos.','multiple','B',7),
('pf_q8','ct_16pf','Aprendo rÃ¡pidamente conceptos nuevos y los aplico sin dificultad.','multiple','B',8),
('pf_q9','ct_16pf','Controlo mis emociones aunque las situaciones sean muy estresantes.','multiple','C',9),
('pf_q10','ct_16pf','Me recupero rÃ¡pidamente de los contratiempos emocionales.','multiple','C',10),
('pf_q11','ct_16pf','Mantengo la calma cuando otros pierden el control.','multiple','C',11),
('pf_q12','ct_16pf','Mis emociones no afectan mi capacidad de trabajar eficientemente.','multiple','C',12),
('pf_q13','ct_16pf','Tiendo a tomar el liderazgo cuando hay que organizar un grupo.','multiple','E',13),
('pf_q14','ct_16pf','Defiendo mis opiniones incluso frente a la oposiciÃ³n del grupo.','multiple','E',14),
('pf_q15','ct_16pf','Prefiero dar instrucciones a recibirlas.','multiple','E',15),
('pf_q16','ct_16pf','Me resulta natural asumir autoridad y responsabilidad.','multiple','E',16),
('pf_q17','ct_16pf','Soy una persona alegre y entusiasta en el trabajo.','multiple','F',17),
('pf_q18','ct_16pf','Transmito energÃ­a positiva al ambiente que me rodea.','multiple','F',18),
('pf_q19','ct_16pf','Soy espontÃ¡neo/a y disfruto la variedad en mis actividades.','multiple','F',19),
('pf_q20','ct_16pf','Las personas me describen como animado/a y divertido/a.','multiple','F',20),
('pf_q21','ct_16pf','Sigo las reglas aunque no estÃ© de acuerdo con ellas.','multiple','G',21),
('pf_q22','ct_16pf','Cumplo puntualmente con todas mis obligaciones.','multiple','G',22),
('pf_q23','ct_16pf','Me molesta cuando el trabajo no se hace segÃºn el procedimiento.','multiple','G',23),
('pf_q24','ct_16pf','Valoro la disciplina y el sentido del deber.','multiple','G',24),
('pf_q25','ct_16pf','Asumo riesgos sin pensarlo demasiado cuando la situaciÃ³n lo requiere.','multiple','H',25),
('pf_q26','ct_16pf','Me gustan las situaciones nuevas aunque sean inciertas.','multiple','H',26),
('pf_q27','ct_16pf','No me intimida enfrentar personas o situaciones difÃ­ciles.','multiple','H',27),
('pf_q28','ct_16pf','Me siento cÃ³modo/a siendo el centro de atenciÃ³n.','multiple','H',28),
('pf_q29','ct_16pf','Soy muy sensible a los sentimientos de las personas que me rodean.','multiple','I',29),
('pf_q30','ct_16pf','Me afectan profundamente las historias tristes o de injusticia.','multiple','I',30),
('pf_q31','ct_16pf','Prefiero entornos estÃ©ticos y armoniosos al trabajar.','multiple','I',31),
('pf_q32','ct_16pf','Las personas me describen como una persona emotiva y empÃ¡tica.','multiple','I',32);

INSERT IGNORE INTO catalog_answers (id,questionId,text,score) VALUES
('pf_q1a','pf_q1','Verdadero',3),('pf_q1b','pf_q1','Intermedio',2),('pf_q1c','pf_q1','Falso',1),
('pf_q2a','pf_q2','Verdadero',3),('pf_q2b','pf_q2','Intermedio',2),('pf_q2c','pf_q2','Falso',1),
('pf_q3a','pf_q3','Verdadero',3),('pf_q3b','pf_q3','Intermedio',2),('pf_q3c','pf_q3','Falso',1),
('pf_q4a','pf_q4','Verdadero',3),('pf_q4b','pf_q4','Intermedio',2),('pf_q4c','pf_q4','Falso',1),
('pf_q5a','pf_q5','Verdadero',3),('pf_q5b','pf_q5','Intermedio',2),('pf_q5c','pf_q5','Falso',1),
('pf_q6a','pf_q6','Verdadero',3),('pf_q6b','pf_q6','Intermedio',2),('pf_q6c','pf_q6','Falso',1),
('pf_q7a','pf_q7','Verdadero',3),('pf_q7b','pf_q7','Intermedio',2),('pf_q7c','pf_q7','Falso',1),
('pf_q8a','pf_q8','Verdadero',3),('pf_q8b','pf_q8','Intermedio',2),('pf_q8c','pf_q8','Falso',1),
('pf_q9a','pf_q9','Verdadero',3),('pf_q9b','pf_q9','Intermedio',2),('pf_q9c','pf_q9','Falso',1),
('pf_q10a','pf_q10','Verdadero',3),('pf_q10b','pf_q10','Intermedio',2),('pf_q10c','pf_q10','Falso',1),
('pf_q11a','pf_q11','Verdadero',3),('pf_q11b','pf_q11','Intermedio',2),('pf_q11c','pf_q11','Falso',1),
('pf_q12a','pf_q12','Verdadero',3),('pf_q12b','pf_q12','Intermedio',2),('pf_q12c','pf_q12','Falso',1),
('pf_q13a','pf_q13','Verdadero',3),('pf_q13b','pf_q13','Intermedio',2),('pf_q13c','pf_q13','Falso',1),
('pf_q14a','pf_q14','Verdadero',3),('pf_q14b','pf_q14','Intermedio',2),('pf_q14c','pf_q14','Falso',1),
('pf_q15a','pf_q15','Verdadero',3),('pf_q15b','pf_q15','Intermedio',2),('pf_q15c','pf_q15','Falso',1),
('pf_q16a','pf_q16','Verdadero',3),('pf_q16b','pf_q16','Intermedio',2),('pf_q16c','pf_q16','Falso',1),
('pf_q17a','pf_q17','Verdadero',3),('pf_q17b','pf_q17','Intermedio',2),('pf_q17c','pf_q17','Falso',1),
('pf_q18a','pf_q18','Verdadero',3),('pf_q18b','pf_q18','Intermedio',2),('pf_q18c','pf_q18','Falso',1),
('pf_q19a','pf_q19','Verdadero',3),('pf_q19b','pf_q19','Intermedio',2),('pf_q19c','pf_q19','Falso',1),
('pf_q20a','pf_q20','Verdadero',3),('pf_q20b','pf_q20','Intermedio',2),('pf_q20c','pf_q20','Falso',1),
('pf_q21a','pf_q21','Verdadero',3),('pf_q21b','pf_q21','Intermedio',2),('pf_q21c','pf_q21','Falso',1),
('pf_q22a','pf_q22','Verdadero',3),('pf_q22b','pf_q22','Intermedio',2),('pf_q22c','pf_q22','Falso',1),
('pf_q23a','pf_q23','Verdadero',3),('pf_q23b','pf_q23','Intermedio',2),('pf_q23c','pf_q23','Falso',1),
('pf_q24a','pf_q24','Verdadero',3),('pf_q24b','pf_q24','Intermedio',2),('pf_q24c','pf_q24','Falso',1),
('pf_q25a','pf_q25','Verdadero',3),('pf_q25b','pf_q25','Intermedio',2),('pf_q25c','pf_q25','Falso',1),
('pf_q26a','pf_q26','Verdadero',3),('pf_q26b','pf_q26','Intermedio',2),('pf_q26c','pf_q26','Falso',1),
('pf_q27a','pf_q27','Verdadero',3),('pf_q27b','pf_q27','Intermedio',2),('pf_q27c','pf_q27','Falso',1),
('pf_q28a','pf_q28','Verdadero',3),('pf_q28b','pf_q28','Intermedio',2),('pf_q28c','pf_q28','Falso',1),
('pf_q29a','pf_q29','Verdadero',3),('pf_q29b','pf_q29','Intermedio',2),('pf_q29c','pf_q29','Falso',1),
('pf_q30a','pf_q30','Verdadero',3),('pf_q30b','pf_q30','Intermedio',2),('pf_q30c','pf_q30','Falso',1),
('pf_q31a','pf_q31','Verdadero',3),('pf_q31b','pf_q31','Intermedio',2),('pf_q31c','pf_q31','Falso',1),
('pf_q32a','pf_q32','Verdadero',3),('pf_q32b','pf_q32','Intermedio',2),('pf_q32c','pf_q32','Falso',1);

-- =============================================================
-- TEST 11: ESTABILIDAD LABORAL (20 preguntas, Likert 1-5)
-- Dimensiones: RC=RotaciÃ³n/Compromiso, SG=Seguridad, MD=MotivaciÃ³n, AT=Actitud
-- =============================================================
INSERT IGNORE INTO catalog_questions (id,testId,questionText,type,dimension,orderNum) VALUES
('el_q1', 'ct_estab','He permanecido mÃ¡s de 2 aÃ±os en mis Ãºltimos empleos.','multiple','RC',1),
('el_q2', 'ct_estab','Cuando empiezo un trabajo, planeo quedarme a largo plazo.','multiple','RC',2),
('el_q3', 'ct_estab','Me comprometo con los proyectos aunque sean largos y difÃ­ciles.','multiple','RC',3),
('el_q4', 'ct_estab','Antes de renunciar, agoto todas las opciones de soluciÃ³n.','multiple','RC',4),
('el_q5', 'ct_estab','Me siento seguro/a con contratos estables antes que con trabajos variable.','multiple','SG',5),
('el_q6', 'ct_estab','Necesito estabilidad econÃ³mica para rendir bien en el trabajo.','multiple','SG',6),
('el_q7', 'ct_estab','Prefiero un sueldo fijo predecible a ingresos variables aunque sean mayores.','multiple','SG',7),
('el_q8', 'ct_estab','La incertidumbre laboral me genera mucho estrÃ©s.','multiple','SG',8),
('el_q9', 'ct_estab','Me motiva trabajar en una empresa con buena reputaciÃ³n y futuro.','multiple','MD',9),
('el_q10','ct_estab','El crecimiento profesional es mÃ¡s importante para mÃ­ que el salario.','multiple','MD',10),
('el_q11','ct_estab','Me esfuerzo mÃ¡s cuando sÃ© que hay posibilidades de ascenso.','multiple','MD',11),
('el_q12','ct_estab','Busco aprender algo nuevo en cada trabajo que tengo.','multiple','MD',12),
('el_q13','ct_estab','Soy leal a la empresa mientras ella sea leal conmigo.','multiple','AT',13),
('el_q14','ct_estab','Hablo bien de mi empresa ante personas externas.','multiple','AT',14),
('el_q15','ct_estab','Defiendo las decisiones de mi empresa aunque no estÃ© de acuerdo.','multiple','AT',15),
('el_q16','ct_estab','Pongo el interÃ©s de la organizaciÃ³n por encima del mÃ­o en situaciones difÃ­ciles.','multiple','AT',16),
('el_q17','ct_estab','Mis cambios de trabajo anteriores han sido voluntarios y por mejora.','multiple','RC',17),
('el_q18','ct_estab','Evito irme de una empresa sin antes conseguir otro empleo.','multiple','SG',18),
('el_q19','ct_estab','Me motiva mÃ¡s el propÃ³sito de la empresa que el salario mensual.','multiple','MD',19),
('el_q20','ct_estab','Me identifico con los valores y cultura de las empresas donde trabajo.','multiple','AT',20);

INSERT IGNORE INTO catalog_answers (id,questionId,text,score) VALUES
('el_q1_1','el_q1','Nunca',1),('el_q1_2','el_q1','Pocas veces',2),('el_q1_3','el_q1','A veces',3),('el_q1_4','el_q1','Frecuentemente',4),('el_q1_5','el_q1','Siempre',5),
('el_q2_1','el_q2','Nunca',1),('el_q2_2','el_q2','Pocas veces',2),('el_q2_3','el_q2','A veces',3),('el_q2_4','el_q2','Frecuentemente',4),('el_q2_5','el_q2','Siempre',5),
('el_q3_1','el_q3','Nunca',1),('el_q3_2','el_q3','Pocas veces',2),('el_q3_3','el_q3','A veces',3),('el_q3_4','el_q3','Frecuentemente',4),('el_q3_5','el_q3','Siempre',5),
('el_q4_1','el_q4','Nunca',1),('el_q4_2','el_q4','Pocas veces',2),('el_q4_3','el_q4','A veces',3),('el_q4_4','el_q4','Frecuentemente',4),('el_q4_5','el_q4','Siempre',5),
('el_q5_1','el_q5','Nunca',1),('el_q5_2','el_q5','Pocas veces',2),('el_q5_3','el_q5','A veces',3),('el_q5_4','el_q5','Frecuentemente',4),('el_q5_5','el_q5','Siempre',5),
('el_q6_1','el_q6','Nunca',1),('el_q6_2','el_q6','Pocas veces',2),('el_q6_3','el_q6','A veces',3),('el_q6_4','el_q6','Frecuentemente',4),('el_q6_5','el_q6','Siempre',5),
('el_q7_1','el_q7','Nunca',1),('el_q7_2','el_q7','Pocas veces',2),('el_q7_3','el_q7','A veces',3),('el_q7_4','el_q7','Frecuentemente',4),('el_q7_5','el_q7','Siempre',5),
('el_q8_1','el_q8','Nunca',1),('el_q8_2','el_q8','Pocas veces',2),('el_q8_3','el_q8','A veces',3),('el_q8_4','el_q8','Frecuentemente',4),('el_q8_5','el_q8','Siempre',5),
('el_q9_1','el_q9','Nunca',1),('el_q9_2','el_q9','Pocas veces',2),('el_q9_3','el_q9','A veces',3),('el_q9_4','el_q9','Frecuentemente',4),('el_q9_5','el_q9','Siempre',5),
('el_q10_1','el_q10','Nunca',1),('el_q10_2','el_q10','Pocas veces',2),('el_q10_3','el_q10','A veces',3),('el_q10_4','el_q10','Frecuentemente',4),('el_q10_5','el_q10','Siempre',5),
('el_q11_1','el_q11','Nunca',1),('el_q11_2','el_q11','Pocas veces',2),('el_q11_3','el_q11','A veces',3),('el_q11_4','el_q11','Frecuentemente',4),('el_q11_5','el_q11','Siempre',5),
('el_q12_1','el_q12','Nunca',1),('el_q12_2','el_q12','Pocas veces',2),('el_q12_3','el_q12','A veces',3),('el_q12_4','el_q12','Frecuentemente',4),('el_q12_5','el_q12','Siempre',5),
('el_q13_1','el_q13','Nunca',1),('el_q13_2','el_q13','Pocas veces',2),('el_q13_3','el_q13','A veces',3),('el_q13_4','el_q13','Frecuentemente',4),('el_q13_5','el_q13','Siempre',5),
('el_q14_1','el_q14','Nunca',1),('el_q14_2','el_q14','Pocas veces',2),('el_q14_3','el_q14','A veces',3),('el_q14_4','el_q14','Frecuentemente',4),('el_q14_5','el_q14','Siempre',5),
('el_q15_1','el_q15','Nunca',1),('el_q15_2','el_q15','Pocas veces',2),('el_q15_3','el_q15','A veces',3),('el_q15_4','el_q15','Frecuentemente',4),('el_q15_5','el_q15','Siempre',5),
('el_q16_1','el_q16','Nunca',1),('el_q16_2','el_q16','Pocas veces',2),('el_q16_3','el_q16','A veces',3),('el_q16_4','el_q16','Frecuentemente',4),('el_q16_5','el_q16','Siempre',5),
('el_q17_1','el_q17','Nunca',1),('el_q17_2','el_q17','Pocas veces',2),('el_q17_3','el_q17','A veces',3),('el_q17_4','el_q17','Frecuentemente',4),('el_q17_5','el_q17','Siempre',5),
('el_q18_1','el_q18','Nunca',1),('el_q18_2','el_q18','Pocas veces',2),('el_q18_3','el_q18','A veces',3),('el_q18_4','el_q18','Frecuentemente',4),('el_q18_5','el_q18','Siempre',5),
('el_q19_1','el_q19','Nunca',1),('el_q19_2','el_q19','Pocas veces',2),('el_q19_3','el_q19','A veces',3),('el_q19_4','el_q19','Frecuentemente',4),('el_q19_5','el_q19','Siempre',5),
('el_q20_1','el_q20','Nunca',1),('el_q20_2','el_q20','Pocas veces',2),('el_q20_3','el_q20','A veces',3),('el_q20_4','el_q20','Frecuentemente',4),('el_q20_5','el_q20','Siempre',5);

-- =============================================================
-- TEST 12: INTEGRIDAD (20 preguntas, Likert 1-5)
-- Dimensiones: HN=Honestidad, ET=Ã‰tica, CF=Confiabilidad, RS=Responsabilidad
-- =============================================================
INSERT IGNORE INTO catalog_questions (id,testId,questionText,type,dimension,orderNum) VALUES
('it_q1', 'ct_integ','Digo la verdad incluso cuando puede traerme consecuencias negativas.','multiple','HN',1),
('it_q2', 'ct_integ','Nunca exagero mis habilidades o logros en una entrevista o evaluaciÃ³n.','multiple','HN',2),
('it_q3', 'ct_integ','Si cometo un error, lo reconozco inmediatamente sin intentar ocultarlo.','multiple','HN',3),
('it_q4', 'ct_integ','Soy transparente con mi jefe, aunque las noticias no sean buenas.','multiple','HN',4),
('it_q5', 'ct_integ','RechazarÃ­a una propuesta deshonesta aunque nadie pudiera descubrirla.','multiple','ET',5),
('it_q6', 'ct_integ','Actuar Ã©ticamente es mÃ¡s importante que alcanzar resultados rÃ¡pidamente.','multiple','ET',6),
('it_q7', 'ct_integ','ReportarÃ­a una irregularidad en mi empresa aunque me perjudicara.','multiple','ET',7),
('it_q8', 'ct_integ','Trato a todos los compaÃ±eros con el mismo respeto, sin importar su jerarquÃ­a.','multiple','ET',8),
('it_q9', 'ct_integ','Cumplo mis compromisos aunque me resulte inconveniente.','multiple','CF',9),
('it_q10','ct_integ','Las personas pueden contar conmigo cuando necesitan ayuda urgente.','multiple','CF',10),
('it_q11','ct_integ','Soy puntual y entrego mis trabajos en el tiempo prometido.','multiple','CF',11),
('it_q12','ct_integ','Si prometo guardar algo confidencial, nunca lo comparto con nadie.','multiple','CF',12),
('it_q13','ct_integ','Acepto la responsabilidad de mis decisiones, buenas o malas.','multiple','RS',13),
('it_q14','ct_integ','No culpo a otros cuando algo sale mal bajo mi responsabilidad.','multiple','RS',14),
('it_q15','ct_integ','Me hago cargo de mis tareas sin necesitar que me estÃ©n supervisando.','multiple','RS',15),
('it_q16','ct_integ','Si algo estÃ¡ mal en mi Ã¡rea, tomo la iniciativa para resolverlo.','multiple','RS',16),
('it_q17','ct_integ','Evito usar los recursos de la empresa para fines personales.','multiple','ET',17),
('it_q18','ct_integ','DenunciarÃ­a un fraude aunque implicara a un compaÃ±ero cercano.','multiple','HN',18),
('it_q19','ct_integ','Mantengo la confidencialidad de la informaciÃ³n sensible de la empresa.','multiple','CF',19),
('it_q20','ct_integ','Hago lo correcto incluso cuando no hay nadie mirando.','multiple','RS',20);

INSERT IGNORE INTO catalog_answers (id,questionId,text,score) VALUES
('it_q1_1','it_q1','Nunca',1),('it_q1_2','it_q1','Pocas veces',2),('it_q1_3','it_q1','A veces',3),('it_q1_4','it_q1','Frecuentemente',4),('it_q1_5','it_q1','Siempre',5),
('it_q2_1','it_q2','Nunca',1),('it_q2_2','it_q2','Pocas veces',2),('it_q2_3','it_q2','A veces',3),('it_q2_4','it_q2','Frecuentemente',4),('it_q2_5','it_q2','Siempre',5),
('it_q3_1','it_q3','Nunca',1),('it_q3_2','it_q3','Pocas veces',2),('it_q3_3','it_q3','A veces',3),('it_q3_4','it_q3','Frecuentemente',4),('it_q3_5','it_q3','Siempre',5),
('it_q4_1','it_q4','Nunca',1),('it_q4_2','it_q4','Pocas veces',2),('it_q4_3','it_q4','A veces',3),('it_q4_4','it_q4','Frecuentemente',4),('it_q4_5','it_q4','Siempre',5),
('it_q5_1','it_q5','Nunca',1),('it_q5_2','it_q5','Pocas veces',2),('it_q5_3','it_q5','A veces',3),('it_q5_4','it_q5','Frecuentemente',4),('it_q5_5','it_q5','Siempre',5),
('it_q6_1','it_q6','Nunca',1),('it_q6_2','it_q6','Pocas veces',2),('it_q6_3','it_q6','A veces',3),('it_q6_4','it_q6','Frecuentemente',4),('it_q6_5','it_q6','Siempre',5),
('it_q7_1','it_q7','Nunca',1),('it_q7_2','it_q7','Pocas veces',2),('it_q7_3','it_q7','A veces',3),('it_q7_4','it_q7','Frecuentemente',4),('it_q7_5','it_q7','Siempre',5),
('it_q8_1','it_q8','Nunca',1),('it_q8_2','it_q8','Pocas veces',2),('it_q8_3','it_q8','A veces',3),('it_q8_4','it_q8','Frecuentemente',4),('it_q8_5','it_q8','Siempre',5),
('it_q9_1','it_q9','Nunca',1),('it_q9_2','it_q9','Pocas veces',2),('it_q9_3','it_q9','A veces',3),('it_q9_4','it_q9','Frecuentemente',4),('it_q9_5','it_q9','Siempre',5),
('it_q10_1','it_q10','Nunca',1),('it_q10_2','it_q10','Pocas veces',2),('it_q10_3','it_q10','A veces',3),('it_q10_4','it_q10','Frecuentemente',4),('it_q10_5','it_q10','Siempre',5),
('it_q11_1','it_q11','Nunca',1),('it_q11_2','it_q11','Pocas veces',2),('it_q11_3','it_q11','A veces',3),('it_q11_4','it_q11','Frecuentemente',4),('it_q11_5','it_q11','Siempre',5),
('it_q12_1','it_q12','Nunca',1),('it_q12_2','it_q12','Pocas veces',2),('it_q12_3','it_q12','A veces',3),('it_q12_4','it_q12','Frecuentemente',4),('it_q12_5','it_q12','Siempre',5),
('it_q13_1','it_q13','Nunca',1),('it_q13_2','it_q13','Pocas veces',2),('it_q13_3','it_q13','A veces',3),('it_q13_4','it_q13','Frecuentemente',4),('it_q13_5','it_q13','Siempre',5),
('it_q14_1','it_q14','Nunca',1),('it_q14_2','it_q14','Pocas veces',2),('it_q14_3','it_q14','A veces',3),('it_q14_4','it_q14','Frecuentemente',4),('it_q14_5','it_q14','Siempre',5),
('it_q15_1','it_q15','Nunca',1),('it_q15_2','it_q15','Pocas veces',2),('it_q15_3','it_q15','A veces',3),('it_q15_4','it_q15','Frecuentemente',4),('it_q15_5','it_q15','Siempre',5),
('it_q16_1','it_q16','Nunca',1),('it_q16_2','it_q16','Pocas veces',2),('it_q16_3','it_q16','A veces',3),('it_q16_4','it_q16','Frecuentemente',4),('it_q16_5','it_q16','Siempre',5),
('it_q17_1','it_q17','Nunca',1),('it_q17_2','it_q17','Pocas veces',2),('it_q17_3','it_q17','A veces',3),('it_q17_4','it_q17','Frecuentemente',4),('it_q17_5','it_q17','Siempre',5),
('it_q18_1','it_q18','Nunca',1),('it_q18_2','it_q18','Pocas veces',2),('it_q18_3','it_q18','A veces',3),('it_q18_4','it_q18','Frecuentemente',4),('it_q18_5','it_q18','Siempre',5),
('it_q19_1','it_q19','Nunca',1),('it_q19_2','it_q19','Pocas veces',2),('it_q19_3','it_q19','A veces',3),('it_q19_4','it_q19','Frecuentemente',4),('it_q19_5','it_q19','Siempre',5),
('it_q20_1','it_q20','Nunca',1),('it_q20_2','it_q20','Pocas veces',2),('it_q20_3','it_q20','A veces',3),('it_q20_4','it_q20','Frecuentemente',4),('it_q20_5','it_q20','Siempre',5);

SET FOREIGN_KEY_CHECKS=1;

