Esta consulta retorna o nome da pessoa, a mensagem por ela enviada e o horário em que ela enviou.

SELECT nome, texto, data_hora 
from pessoa, mensagem
where mensagem.fk_pessoa_codpessoa = pessoa.codpessoa; 


Esta consulta retorna o nome  de todas as pessoas que curtiram a mensagem 'Boa noite!'.

SELECT nome, texto
from pessoa, mensagem, curte
where mensagem.texto = 'Boa noite!'
and curte.fk_mensagem_codmensagem = mensagem.codmensagem
and curte.fk_pessoa_codpessoa = pessoa.codpessoa;



