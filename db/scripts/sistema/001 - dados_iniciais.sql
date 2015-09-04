-- GRUPO ROOT
INSERT INTO GRUPOS (ID, DESCRICAO, STATUS, IS_ROOT, CREATED_AT, UPDATED_AT)
VALUES (nextval('grupos_id_seq'), 'root', 0, TRUE, now(), now());

-- GRUPO USUARIOS
INSERT INTO GRUPOS (ID, DESCRICAO, STATUS, IS_ROOT, CREATED_AT, UPDATED_AT)
VALUES (nextval('grupos_id_seq'), 'Usuario', 0, FALSE, now(), now());