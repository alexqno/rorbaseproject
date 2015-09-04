-- FUNCAO CRIAR PERMISSOES
CREATE OR REPLACE FUNCTION public.criar_permissao (
  _chave_ varchar,
  _descricao_ varchar,
  _tipo_ integer,
  _modulo_ integer
)
RETURNS void AS
$body$
DECLARE
  _grupo_ INTEGER;
BEGIN
  
  INSERT INTO permissoes (id, chave, descricao, tipo, modulo, created_at, updated_at)
  VALUES (nextval('permissoes_id_seq'), _chave_, _descricao_, _tipo_, _modulo_, now(), now());
  
  INSERT INTO grupo_permissoes (id, grupo_id, permissao_id, valor, created_at, updated_at)
  VALUES (nextval('grupo_permissoes_id_seq'), (SELECT id FROM grupos WHERE descricao = 'root'), currval('permissoes_id_seq'), (CASE WHEN (_tipo_ = 0) THEN 'S' ELSE 'A' END), now(), now());
  
  FOR _grupo_ IN (
    SELECT id FROM grupos WHERE descricao <> 'root'
  )
  Loop
    
    INSERT INTO grupo_permissoes (id, grupo_id, permissao_id, valor, created_at, updated_at)
    VALUES (nextval('grupo_permissoes_id_seq'), _grupo_, currval('permissoes_id_seq'), 'N', now(), now());
    
  END Loop;
  
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;


-- TIPOS
-- simnao = 0, VALORES = 'S', 'N'
-- acesso = 1, VALORES = 'A', 'V', 'N'

-- MODULOS
-- 0 - USUARIOS
SELECT criar_permissao('permissaoUsuarios', 'Nivel de acesso ao menu de usuario', 1, 0);