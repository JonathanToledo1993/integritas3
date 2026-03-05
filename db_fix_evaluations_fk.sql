-- =========================================================
-- db_fix_evaluations_fk.sql
-- Corrección del FK incorrecto en la tabla evaluations.
-- =========================================================
-- PROBLEMA: La tabla evaluations fue creada con un FK en userId
--           que apunta a `users_client`, pero el sistema de login
--           usa la tabla `users`. Esto causa un error 500 al crear
--           evaluaciones.
--
-- SOLUCIÓN: 1) Hacer nullable la columna userId (previene el error)
--           2) Cambiar el FK para que apunte a `users` (correcto)
-- =========================================================

-- Paso 1: Hacer la columna userId nullable para evitar errores si
--         se omite en el INSERT
ALTER TABLE `evaluations`
    MODIFY COLUMN `userId` CHAR(36) NULL DEFAULT NULL 
    COMMENT 'ID del usuario que creó la evaluación (ref users.id)';

-- Paso 2: Eliminar el FK incorrecto que apunta a users_client
--    (Buscar el nombre real del FK si el siguiente falla):
--    SELECT CONSTRAINT_NAME FROM information_schema.KEY_COLUMN_USAGE
--    WHERE TABLE_NAME='evaluations' AND COLUMN_NAME='userId' AND TABLE_SCHEMA='eintegri_allinone';
ALTER TABLE `evaluations` DROP FOREIGN KEY IF EXISTS `evaluations_ibfk_3`;
ALTER TABLE `evaluations` DROP FOREIGN KEY IF EXISTS `fk_evaluations_userId`;

-- Paso 3: Agregar el FK correcto apuntando a la tabla `users`
ALTER TABLE `evaluations`
    ADD CONSTRAINT `fk_evaluations_userId`
    FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE SET NULL;

-- Verificar:
-- SHOW CREATE TABLE evaluations;
