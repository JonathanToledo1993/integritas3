SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

-- =============================================================
-- SEED PART 1: Schema setup + DISC + Inteligencia Lógico-Matemática
-- Run this first in your MySQL via phpMyAdmin or CLI
-- =============================================================
-- Fix type column (may be ENUM, convert to VARCHAR)
ALTER TABLE catalog_questions MODIFY COLUMN `type` VARCHAR(20) NOT NULL DEFAULT 'multiple';

-- Fix catalog_tests: set default for updatedAt so INSERT doesn't fail
ALTER TABLE catalog_tests
    MODIFY COLUMN `updatedAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Add extra columns we need (safe - IF NOT EXISTS)
ALTER TABLE catalog_answers   ADD COLUMN IF NOT EXISTS score     TINYINT      DEFAULT 0    COMMENT 'Score for this answer';
ALTER TABLE catalog_questions ADD COLUMN IF NOT EXISTS dimension  VARCHAR(10)  DEFAULT NULL COMMENT 'Dimension/factor';
ALTER TABLE catalog_questions ADD COLUMN IF NOT EXISTS orderNum   INT          DEFAULT 0;


-- =============================================================
-- CATALOG TESTS (all 12 tests declared first)
-- =============================================================
INSERT IGNORE INTO catalog_tests (id, `key`, name, category, description, durationMins, isActive, updatedAt) VALUES
('ct_disc',    'DISC',       'DISC',                          'Personalidad',  'Evalúa el perfil conductual en 4 dimensiones: Dominancia, Influencia, Estabilidad y Cumplimiento.',   20, 1, NOW()),
('ct_iq',      'IQ_WONDR',   'Inteligencia Lógico-Matemática','Cognitivo',     'Mide capacidades cognitivas: razonamiento numérico, verbal, espacial y lógico. Basado en Wonderlic.',   30, 1, NOW()),
('ct_bigfive', 'BIG5',       '5 Factores de Personalidad',   'Personalidad',  'Perfil de personalidad basado en el Big Five Questionnaire (BFQ): O, C, E, A, N.',                      25, 1, NOW()),
('ct_eq',      'ICE_BARON',  'Cociente Emocional',           'Competencias',  'Evaluación de inteligencia emocional basada en el modelo ICE Baron: intrapersonal, interpersonal y más.', 25, 1, NOW()),
('ct_eng_bas', 'ENG_BASIC',  'Inglés Escrito Básico',        'Idiomas',       'Evalúa comprensión y escritura en inglés nivel A1-A2.',                                                    20, 1, NOW()),
('ct_eng_int', 'ENG_INT',    'Inglés Escrito Intermedio',    'Idiomas',       'Evalúa gramática, vocabulario y comprensión en inglés nivel B1-B2.',                                       25, 1, NOW()),
('ct_eng_adv', 'ENG_ADV',    'Inglés Escrito Avanzado',      'Idiomas',       'Evalúa uso avanzado del inglés nivel C1-C2: sintaxis, idiomatic expressions y redacción.',                 30, 1, NOW()),
('ct_venta',   'VENTAS',     'Estilo de Venta',              'Habilidades',   'Identifica el estilo de venta predominante y competencias comerciales del candidato.',                      20, 1, NOW()),
('ct_lider',   'LIDERAZGO',  'Liderazgo',                    'Competencias',  'Diagnostica el estilo de liderazgo y habilidades directivas del candidato.',                               20, 1, NOW()),
('ct_16pf',    '16PF',       '16 Factores de Personalidad',  'Personalidad',  'Perfil profundo de personalidad con 16 dimensiones de Cattell.',                                           40, 1, NOW()),
('ct_estab',   'ESTABILIDAD','Estabilidad Laboral',          'Competencias',  'Mide la estabilidad, compromiso y retención del candidato en relaciones laborales.',                       15, 1, NOW()),
('ct_integ',   'INTEGRIDAD', 'Integridad',                   'Competencias',  'Evalúa honestidad, ética y confiabilidad del candidato en el entorno laboral.',                            15, 1, NOW());

-- =============================================================
-- TEST 1: DISC (28 preguntas, forzado A/B/C/D, cada opción pesa una dimensión)
-- Dimensiones: D=Dominancia I=Influencia S=Estabilidad C=Cumplimiento
-- score: 1=D 2=I 3=S 4=C
-- =============================================================
INSERT IGNORE INTO catalog_questions (id,testId,questionText,type,dimension,orderNum) VALUES
('disc_q1', 'ct_disc','En situaciones de presión, tiendo a...','multiple','DISC',1),
('disc_q2', 'ct_disc','Al trabajar en equipo, mi rol natural es...','multiple','DISC',2),
('disc_q3', 'ct_disc','Cuando tomo decisiones, principalmente...','multiple','DISC',3),
('disc_q4', 'ct_disc','Ante un conflicto, mi reacción habitual es...','multiple','DISC',4),
('disc_q5', 'ct_disc','Mi mayor fortaleza en el trabajo es...','multiple','DISC',5),
('disc_q6', 'ct_disc','Prefiero un ambiente laboral que sea...','multiple','DISC',6),
('disc_q7', 'ct_disc','Cuando enfrento obstáculos, suelo...','multiple','DISC',7),
('disc_q8', 'ct_disc','Al comunicarme con otros, me caracterizo por ser...','multiple','DISC',8),
('disc_q9', 'ct_disc','Mi ritmo de trabajo natural es...','multiple','DISC',9),
('disc_q10','ct_disc','A la hora de resolver problemas, prefiero...','multiple','DISC',10),
('disc_q11','ct_disc','En proyectos, me siento más cómodo/a cuando...','multiple','DISC',11),
('disc_q12','ct_disc','Mi forma de influir en otros es...','multiple','DISC',12),
('disc_q13','ct_disc','Ante cambios inesperados, reacciono...','multiple','DISC',13),
('disc_q14','ct_disc','Para lograr un objetivo, prefiero...','multiple','DISC',14),
('disc_q15','ct_disc','Mi estilo de comunicación es principalmente...','multiple','DISC',15),
('disc_q16','ct_disc','Cuando tengo que persuadir a alguien, uso...','multiple','DISC',16),
('disc_q17','ct_disc','Me siento más motivado/a cuando...','multiple','DISC',17),
('disc_q18','ct_disc','Al crear relaciones en el trabajo, soy...','multiple','DISC',18),
('disc_q19','ct_disc','Mi actitud ante las reglas y procedimientos es...','multiple','DISC',19),
('disc_q20','ct_disc','Para liderar, prefiero...','multiple','DISC',20),
('disc_q21','ct_disc','Mi mayor debilidad es que a veces soy demasiado...','multiple','DISC',21),
('disc_q22','ct_disc','Al recibir retroalimentación negativa, suelo...','multiple','DISC',22),
('disc_q23','ct_disc','En una reunión, tiendo a...','multiple','DISC',23),
('disc_q24','ct_disc','Mi mayor satisfacción laboral viene de...','multiple','DISC',24),
('disc_q25','ct_disc','Cuando me asignan una tarea nueva, primero...','multiple','DISC',25),
('disc_q26','ct_disc','Ante decisiones de equipo, prefiero...','multiple','DISC',26),
('disc_q27','ct_disc','Mi gestión del tiempo se basa en...','multiple','DISC',27),
('disc_q28','ct_disc','Al evaluar mi propio desempeño, me enfoco en...','multiple','DISC',28);

-- DISC Answers (4 options per question: D,I,S,C scored 1,2,3,4)
INSERT IGNORE INTO catalog_answers (id,questionId,text,score) VALUES
('disc_q1a','disc_q1','Actuar de inmediato para resolver la situación',1),
('disc_q1b','disc_q1','Motivar al equipo con entusiasmo',2),
('disc_q1c','disc_q1','Mantener la calma y la estabilidad',3),
('disc_q1d','disc_q1','Analizar datos antes de actuar',4),
('disc_q2a','disc_q2','Liderar y tomar decisiones',1),
('disc_q2b','disc_q2','Energizar y conectar a las personas',2),
('disc_q2c','disc_q2','Apoyar y mantener el equilibrio',3),
('disc_q2d','disc_q2','Organizar y verificar la calidad',4),
('disc_q3a','disc_q3','Actúo rápido con mis propios criterios',1),
('disc_q3b','disc_q3','Consulto a otros y busco consenso entusiasta',2),
('disc_q3c','disc_q3','Busco mantener la armonía del grupo',3),
('disc_q3d','disc_q3','Recopilo datos y sigo procedimientos',4),
('disc_q4a','disc_q4','Lo enfrento directo y busco resolución rápida',1),
('disc_q4b','disc_q4','Trato de mediarlo con optimismo',2),
('disc_q4c','disc_q4','Cedo para mantener la paz',3),
('disc_q4d','disc_q4','Analizo quién tiene razón según las normas',4),
('disc_q5a','disc_q5','Tomar decisiones difíciles bajo presión',1),
('disc_q5b','disc_q5','Crear relaciones y motivar personas',2),
('disc_q5c','disc_q5','Ser constante y de confianza',3),
('disc_q5d','disc_q5','Ser preciso y seguir procesos',4),
('disc_q6a','disc_q6','Dinámico, retador y lleno de retos',1),
('disc_q6b','disc_q6','Colaborativo, social y de reconocimiento',2),
('disc_q6c','disc_q6','Estable, predecible y armonioso',3),
('disc_q6d','disc_q6','Estructurado, claro en reglas y calidad',4),
('disc_q7a','disc_q7','Los enfrento de frente con determinación',1),
('disc_q7b','disc_q7','Los convierto en oportunidades con entusiasmo',2),
('disc_q7c','disc_q7','Los aguanto con paciencia y perseverancia',3),
('disc_q7d','disc_q7','Los analizo sistemáticamente',4),
('disc_q8a','disc_q8','Directo/a y orientado/a a resultados',1),
('disc_q8b','disc_q8','Expresivo/a, persuasivo/a y cálido/a',2),
('disc_q8c','disc_q8','Tranquilo/a, buen/a escucha y empático/a',3),
('disc_q8d','disc_q8','Preciso/a, formal y basado/a en hechos',4),
('disc_q9a','disc_q9','Rápido, intenso y orientado a resultados',1),
('disc_q9b','disc_q9','Variable, energético y espontáneo',2),
('disc_q9c','disc_q9','Constante, metódico y sin interrupciones',3),
('disc_q9d','disc_q9','Minucioso, planificado y sin errores',4),
('disc_q10a','disc_q10','Decidir rápido y ejecutar',1),
('disc_q10b','disc_q10','Hablar con el equipo y generar ideas',2),
('disc_q10c','disc_q10','Buscar estabilidad y no arriesgar',3),
('disc_q10d','disc_q10','Investigar a fondo antes de decidir',4),
('disc_q11a','disc_q11','Tengo autonomía para decidir',1),
('disc_q11b','disc_q11','Puedo colaborar con muchas personas',2),
('disc_q11c','disc_q11','Hay claridad en mis tareas y rutinas',3),
('disc_q11d','disc_q11','Puedo revisar y controlar la calidad',4),
('disc_q12a','disc_q12','Siendo contundente y claro/a',1),
('disc_q12b','disc_q12','Siendo entusiasta e inspirador/a',2),
('disc_q12c','disc_q12','Siendo confiable y consistente',3),
('disc_q12d','disc_q12','Usando argumentos lógicos y datos',4),
('disc_q13a','disc_q13','Los afronto como un reto',1),
('disc_q13b','disc_q13','Los acepto con flexibilidad y entusiasmo',2),
('disc_q13c','disc_q13','Me cuesta adaptarme, prefiero estabilidad',3),
('disc_q13d','disc_q13','Los evalúo con cautela antes de actuar',4),
('disc_q14a','disc_q14','Actuar inmediatamente',1),
('disc_q14b','disc_q14','Motivar al equipo para que lo logre',2),
('disc_q14c','disc_q14','Seguir un método probado paso a paso',3),
('disc_q14d','disc_q14','Planificar con detalle para minimizar riesgos',4),
('disc_q15a','disc_q15','Asertivo/a y directo/a',1),
('disc_q15b','disc_q15','Expresivo/a y persuasivo/a',2),
('disc_q15c','disc_q15','Cálido/a y paciente',3),
('disc_q15d','disc_q15','Objetivo/a y formal',4),
('disc_q16a','disc_q16','La firmeza y la confianza en mis argumentos',1),
('disc_q16b','disc_q16','El entusiasmo y las historias emocionantes',2),
('disc_q16c','disc_q16','La paciencia y la empatía',3),
('disc_q16d','disc_q16','Datos, hechos y lógica',4),
('disc_q17a','disc_q17','Tengo control y autonomía',1),
('disc_q17b','disc_q17','Recibo reconocimiento y trabajo con otros',2),
('disc_q17c','disc_q17','Hay seguridad y no hay cambios bruscos',3),
('disc_q17d','disc_q17','El trabajo está bien hecho conforme a normas',4),
('disc_q18a','disc_q18','Directo/a desde el principio',1),
('disc_q18b','disc_q18','Muy sociable y animado/a',2),
('disc_q18c','disc_q18','Leal y cuidadoso/a de los demás',3),
('disc_q18d','disc_q18','Reservado/a y profesional',4),
('disc_q19a','disc_q19','Las cuestiono si no tienen sentido para mí',1),
('disc_q19b','disc_q19','Las sigo si el ambiente lo requiere',2),
('disc_q19c','disc_q19','Las valoro porque dan estabilidad',3),
('disc_q19d','disc_q19','Las sigo rigurosamente',4),
('disc_q20a','disc_q20','Tomar decisiones rápidas y dirigir',1),
('disc_q20b','disc_q20','Entusiasmar y ser el alma del equipo',2),
('disc_q20c','disc_q20','Apoyar a cada persona individualmente',3),
('disc_q20d','disc_q20','Asegurar que todo siga el proceso correcto',4),
('disc_q21a','disc_q21','Impulsivo/a o dominante',1),
('disc_q21b','disc_q21','Impulsivo/a o impaciente',2),
('disc_q21c','disc_q21','Conformista o lento/a para cambiar',3),
('disc_q21d','disc_q21','Perfeccionista o indeciso/a',4),
('disc_q22a','disc_q22','Lo tomo como un ataque y lo defiendo',1),
('disc_q22b','disc_q22','Lo ignoro o no le doy importancia',2),
('disc_q22c','disc_q22','Me lo tomo muy a pecho emocionalmente',3),
('disc_q22d','disc_q22','Lo analizo para mejorar mi proceso',4),
('disc_q23a','disc_q23','Tomar el control y dirigir la agenda',1),
('disc_q23b','disc_q23','Hablar mucho y animar el grupo',2),
('disc_q23c','disc_q23','Escuchar y apoyar a los demás',3),
('disc_q23d','disc_q23','Tomar notas y verificar los detalles',4),
('disc_q24a','disc_q24','Lograr resultados y superar metas',1),
('disc_q24b','disc_q24','Ser reconocido/a y tener relaciones positivas',2),
('disc_q24c','disc_q24','Mantener armonía y seguridad en el equipo',3),
('disc_q24d','disc_q24','Entregar trabajo de alta calidad y sin errores',4),
('disc_q25a','disc_q25','La tomo y arranco de inmediato',1),
('disc_q25b','disc_q25','Hablo con otros para entusiasmarlos',2),
('disc_q25c','disc_q25','Espero instrucciones claras',3),
('disc_q25d','disc_q25','Leo toda la documentación disponible',4),
('disc_q26a','disc_q26','Tomar la última palabra',1),
('disc_q26b','disc_q26','Que todos estén emocionados con la decisión',2),
('disc_q26c','disc_q26','Que haya consenso y nadie quede mal',3),
('disc_q26d','disc_q26','Que la decisión esté bien fundamentada',4),
('disc_q27a','disc_q27','Taclear primero lo más urgente',1),
('disc_q27b','disc_q27','Variar actividades para no aburrirme',2),
('disc_q27c','disc_q27','Seguir un cronograma habitual',3),
('disc_q27d','disc_q27','Planificar cada detalle con antelación',4),
('disc_q28a','disc_q28','Los resultados y el impacto logrado',1),
('disc_q28b','disc_q28','La energía y relaciones que generé',2),
('disc_q28c','disc_q28','La estabilidad y apoyo que brindé',3),
('disc_q28d','disc_q28','La precisión y calidad de mi trabajo',4);

-- =============================================================
-- TEST 2: INTELIGENCIA LÓGICO-MATEMÁTICA (Wonderlic - 25 preguntas)
-- score: 1=correcto 0=incorrecto
-- =============================================================
INSERT IGNORE INTO catalog_questions (id,testId,questionText,type,dimension,orderNum) VALUES
('iq_q1', 'ct_iq','Si ganas $800 y gastas $275, ¿cuánto te queda?','multiple','NUM',1),
('iq_q2', 'ct_iq','¿Cuál número sigue en la serie: 2, 4, 8, 16, ___?','multiple','LOG',2),
('iq_q3', 'ct_iq','RELOJ es a TIEMPO lo que TERMÓMETRO es a:','multiple','VERB',3),
('iq_q4', 'ct_iq','Un tren va a 90 km/h. ¿Cuántos km recorre en 40 minutos?','multiple','NUM',4),
('iq_q5', 'ct_iq','¿Cuál es el opuesto de ESCASO?','multiple','VERB',5),
('iq_q6', 'ct_iq','Si Pedro tiene el doble de edad que Ana, y Ana tiene 15, ¿cuántos años tiene Pedro?','multiple','NUM',6),
('iq_q7', 'ct_iq','¿Cuál palabra NO pertenece al grupo? Manzana, Pera, Zanahoria, Uva','multiple','LOG',7),
('iq_q8', 'ct_iq','¿Cuánto es 15% de 200?','multiple','NUM',8),
('iq_q9', 'ct_iq','La serie: 1, 4, 9, 16, 25... ¿Cuál es el siguiente número?','multiple','LOG',9),
('iq_q10','ct_iq','LIBRO es a LEER como CANCIÓN es a:','multiple','VERB',10),
('iq_q11','ct_iq','Si 5 máquinas producen 5 piezas en 5 minutos, ¿cuánto tardan 100 máquinas en producir 100 piezas?','multiple','LOG',11),
('iq_q12','ct_iq','¿Cuánto es 25 × 4 ÷ 5?','multiple','NUM',12),
('iq_q13','ct_iq','¿Cuál es la figura que completa la secuencia? □ ○ △ □ ○ ___','multiple','ESPA',13),
('iq_q14','ct_iq','Un producto costaba $120 y subió un 25%. ¿Cuánto cuesta ahora?','multiple','NUM',14),
('iq_q15','ct_iq','¿Qué palabra completa la analogía? FRÍO es a CALIENTE como OSCURO es a:','multiple','VERB',15),
('iq_q16','ct_iq','En una oficina hay 3 hombres por cada 2 mujeres. Si hay 20 mujeres, ¿cuántos empleados hay en total?','multiple','NUM',16),
('iq_q17','ct_iq','¿Cuál número es primo?','multiple','LOG',17),
('iq_q18','ct_iq','Si A > B y B > C, entonces:','multiple','LOG',18),
('iq_q19','ct_iq','¿Cuánto es la raíz cuadrada de 144?','multiple','NUM',19),
('iq_q20','ct_iq','DOCTOR es a HOSPITAL como MAESTRO es a:','multiple','VERB',20),
('iq_q21','ct_iq','Una tienda vende 3 camisas por $45. ¿Cuánto cuestan 7 camisas?','multiple','NUM',21),
('iq_q22','ct_iq','¿Cuál es la siguiente letra? A, C, E, G, ___','multiple','LOG',22),
('iq_q23','ct_iq','Si una habitación mide 5m × 4m, ¿cuántos m² tiene?','multiple','NUM',23),
('iq_q24','ct_iq','¿Cuál de estas palabras es un sinónimo de AUDAZ?','multiple','VERB',24),
('iq_q25','ct_iq','Todos los A son B. Ningún B es C. Por lo tanto:','multiple','LOG',25);

INSERT IGNORE INTO catalog_answers (id,questionId,text,score) VALUES
('iq_q1a','iq_q1','$550',0),('iq_q1b','iq_q1','$525',1),('iq_q1c','iq_q1','$475',0),('iq_q1d','iq_q1','$425',0),
('iq_q2a','iq_q2','24',0),('iq_q2b','iq_q2','32',1),('iq_q2c','iq_q2','28',0),('iq_q2d','iq_q2','20',0),
('iq_q3a','iq_q3','Temperatura',1),('iq_q3b','iq_q3','Calor',0),('iq_q3c','iq_q3','Clima',0),('iq_q3d','iq_q3','Fiebre',0),
('iq_q4a','iq_q4','55 km',0),('iq_q4b','iq_q4','60 km',1),('iq_q4c','iq_q4','45 km',0),('iq_q4d','iq_q4','70 km',0),
('iq_q5a','iq_q5','Abundante',1),('iq_q5b','iq_q5','Pequeño',0),('iq_q5c','iq_q5','Mínimo',0),('iq_q5d','iq_q5','Basto',0),
('iq_q6a','iq_q6','25',0),('iq_q6b','iq_q6','30',1),('iq_q6c','iq_q6','20',0),('iq_q6d','iq_q6','28',0),
('iq_q7a','iq_q7','Manzana',0),('iq_q7b','iq_q7','Pera',0),('iq_q7c','iq_q7','Zanahoria',1),('iq_q7d','iq_q7','Uva',0),
('iq_q8a','iq_q8','25',0),('iq_q8b','iq_q8','30',1),('iq_q8c','iq_q8','20',0),('iq_q8d','iq_q8','35',0),
('iq_q9a','iq_q9','30',0),('iq_q9b','iq_q9','36',1),('iq_q9c','iq_q9','32',0),('iq_q9d','iq_q9','35',0),
('iq_q10a','iq_q10','Escuchar',1),('iq_q10b','iq_q10','Bailar',0),('iq_q10c','iq_q10','Ver',0),('iq_q10d','iq_q10','Hablar',0),
('iq_q11a','iq_q11','100 minutos',0),('iq_q11b','iq_q11','5 minutos',1),('iq_q11c','iq_q11','50 minutos',0),('iq_q11d','iq_q11','20 minutos',0),
('iq_q12a','iq_q12','15',0),('iq_q12b','iq_q12','20',1),('iq_q12c','iq_q12','25',0),('iq_q12d','iq_q12','10',0),
('iq_q13a','iq_q13','△',1),('iq_q13b','iq_q13','□',0),('iq_q13c','iq_q13','○',0),('iq_q13d','iq_q13','◇',0),
('iq_q14a','iq_q14','$145',0),('iq_q14b','iq_q14','$150',1),('iq_q14c','iq_q14','$140',0),('iq_q14d','iq_q14','$130',0),
('iq_q15a','iq_q15','Luminoso',1),('iq_q15b','iq_q15','Negro',0),('iq_q15c','iq_q15','Noche',0),('iq_q15d','iq_q15','Triste',0),
('iq_q16a','iq_q16','30',0),('iq_q16b','iq_q16','50',1),('iq_q16c','iq_q16','40',0),('iq_q16d','iq_q16','60',0),
('iq_q17a','iq_q17','9',0),('iq_q17b','iq_q17','15',0),('iq_q17c','iq_q17','17',1),('iq_q17d','iq_q17','21',0),
('iq_q18a','iq_q18','A > C',1),('iq_q18b','iq_q18','C > A',0),('iq_q18c','iq_q18','A = C',0),('iq_q18d','iq_q18','No se puede determinar',0),
('iq_q19a','iq_q19','11',0),('iq_q19b','iq_q19','12',1),('iq_q19c','iq_q19','13',0),('iq_q19d','iq_q19','14',0),
('iq_q20a','iq_q20','Escuela',1),('iq_q20b','iq_q20','Libro',0),('iq_q20c','iq_q20','Universidad',0),('iq_q20d','iq_q20','Oficina',0),
('iq_q21a','iq_q21','$90',0),('iq_q21b','iq_q21','$100',0),('iq_q21c','iq_q21','$105',1),('iq_q21d','iq_q21','$95',0),
('iq_q22a','iq_q22','H',0),('iq_q22b','iq_q22','I',1),('iq_q22c','iq_q22','J',0),('iq_q22d','iq_q22','K',0),
('iq_q23a','iq_q23','18 m²',0),('iq_q23b','iq_q23','20 m²',1),('iq_q23c','iq_q23','22 m²',0),('iq_q23d','iq_q23','25 m²',0),
('iq_q24a','iq_q24','Tímido',0),('iq_q24b','iq_q24','Valiente',1),('iq_q24c','iq_q24','Prudente',0),('iq_q24d','iq_q24','Cuidadoso',0),
('iq_q25a','iq_q25','Ningún A es C',1),('iq_q25b','iq_q25','Algunos A son C',0),('iq_q25c','iq_q25','Todos los C son A',0),('iq_q25d','iq_q25','No se puede concluir',0);

SET FOREIGN_KEY_CHECKS=1;

