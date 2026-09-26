# Skill de Execução

Este tipo de skill serve para prover ao agente a capacidade de executar uma tarefa que DEVE seguir um conjunto determinado de passos. É uma skill apropriadada para tarefas que podem ser automatizadas em scripts, pois possuem uma natureza determinística. Neste tipo de skill, o agente sempre deverá utilizar scripts para que o resultado seja alcançado, deixando com o agente apenas orquestração dos resultados obtidos a cada passo. A skill também apresentará restrições que o agente DEVE seguir. Para qualquer ação fora da skill o agente deverá solicitar a decisão do usuário. Essas ações não devem interromper a execução da skill e devem ser apresentadas ao final como questões em aberto para que o usuário possa pensar sobre como proceder.

Em resumo, skill de execução são receitas que o agente segue.

# Anatomia da skill

A anatomia da skill se refere àquilo que DEVE ser criado ao estruturar uma skill. Não se refere a como o agente utilizará a skill (isso fica dentro da própria skill).

## Estrutura de diretório

```
skill-name/
├── SKILL.md          # Obrigatório: frontmatter + passo a passo + restrições
├── scripts/          # Obrigatório: código executável para realização das tarefas dentro da skill
├── references/       # Obrigatório: cada script deve ter sua própria documentação
```

## Seções da SKILL.md

| Seção       | Descrição                                                                                                                                                   |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Frontmatter | Segue os padrões da especificação de Skills.                                                                                                                |
| Visão geral | Texto introdutório enxuto (com no máximo 1024 caracteres) apenas para dar um breve contexto ao agente sobre o que será produzido ao final do passo a passo. |
| Execução    | Apresenta as etapas que devem ser seguidas em ordem. Como uma receita.                                                                                      |
| Verificação | Mostra como o resultado do que foi feito com a skill deve ser avaliado para determinar se o trabalho está concluído com sucesso ou falha.                   |
| Restrições  | Uma lista de coisas que o agente jamais deve fazer.                                                                                                         |

## SKILL.md de exemplo

```md
---
name: creating-springboot-web-project
description: Faz o setup de um projeto Spring Boot. Utilize quando solicitado para que um projeto Spring Boot seja criado do zero. O projeto gerado combinará os padrões disponibilizados com as customisações do usuário. Acione quando o usuário necessitar que um novo projeto base do Spring Boot seja criado do zero.
---

O projeto resultante será bastante simples. Qualquer customização deverá ser feita apenas sob demanda do usuário. APENAS em caso de dúvida, leia a documentação `references/basic-setup-sh.md`.

# Execução

## 1. Coleta de parâmetros

Pergunte ao usuário um parâmetro de cada vez:

1. Qual o groupId? (ex: br.com.unicred)
2. Qual o artifactId?

Execute o passo seguinte APENAS após coletar todas as respostas.

## 2. Setup básico

Execute o script `scripts/basic-setup.sh` utilizando os valores parametrizados no passo 1.

# Verificação

A mensagem `"✅ Projeto criado com sucesso em: $ARTIFACT_ID"` é o critério de sucesso do procedimento.

# Restrições
- NÃO crie qualquer artefato do projeto manualmente.
- NÃO invente artefatos dentro do projeto.
- O projeto DEVE ser criado exclusivamente pelo script do passo 2.
- Se o o script do passo 2 falhar, informe o usuário e deixe que ele decida o que fazer.
```
