---
name: creating-springboot-web-project
description: Faz o setup de um projeto Spring Boot. Utilize quando solicitado para que um projeto Spring Boot seja criado do zero. O projeto gerado combinará os padrões disponibilizados com as customisações do usuário. Acione quando o usuário necessitar que um novo projeto base do Spring Boot seja criado do zero.
---

O projeto resultante será bastante simples. Qualquer customização deverá ser feita apenas sob demanda do usuário. APENAS em caso de dúvida, leia a documentação @references/basic-setup-sh.md.

# Passo a passo

## 1. Coleta de parâmetros

Pergunte ao usuário um parâmetro de cada vez:

1. Qual o groupId? (ex: br.com.unicred)
2. Qual o artifactId?

Execute o passo seguinte APENAS após coletar todas as respostas.

## 2. Setup básico

Execute o script @scripts/basic-setup.sh utilizando os valores parametrizados no passo 1.

## 3. Verificação final

A mensagem `"✅ Projeto criado com sucesso em: $ARTIFACT_ID"` é o critério de sucesso do procedimento.

# Restrições
- NÃO crie qualquer artefato do projeto manualmente.
- NÃO invente artefatos dentro do projeto.
- O projeto DEVE ser criado exclusivamente pelo script do passo 2.
- Se o o script do passo 2 falhar, informe o usuário e deixe que ele decida o que fazer.