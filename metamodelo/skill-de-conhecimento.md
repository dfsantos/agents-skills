# Skill de Conhecimento

Este tipo de skill serve para prover ao agente um corpo de princípios e convenções que orientam decisões de julgamento — não passos fixos. É uma skill apropriada para tarefas em que não existe uma sequência determinística de ações, mas sim critérios que o agente deve aplicar de forma consistente ao gerar, revisar ou refatorar código. Neste tipo de skill, o agente NÃO executa scripts para produzir o resultado; ele aplica os princípios diretamente no raciocínio e na escrita do código, usando os exemplos da skill como referência de padrão esperado.

Diferente da skill de execução (que é uma receita), a skill de conhecimento é uma **política com jurisprudência**: define regras e ilustra cada uma com casos concretos de aplicação, para reduzir ambiguidade sem eliminar o julgamento do agente.

# Anatomia da skill

A anatomia da skill se refere àquilo que DEVE ser criado ao estruturar uma skill. Não se refere a como o agente utilizará a skill (isso fica dentro da própria skill).

## Estrutura de diretório

```
skill-name/
├── SKILL.md          # Obrigatório: frontmatter + princípios + critério de aplicação
├── references/        # Obrigatório: um arquivo por princípio ou grupo de princípios, com exemplos
```

Skills de conhecimento normalmente não têm `scripts/`. Se a skill precisar de um script (ex: um linter ou validador automatizado que checa aderência aos princípios), isso é um sinal de que parte da skill deveria ser uma skill de execução separada — não misture as duas anatomias no mesmo SKILL.md.

## Seções da SKILL.md

| Seção                 | Descrição                                                                                                                                                                                                                                                         |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Frontmatter           | Segue os padrões da especificação de Skills. A description deve deixar claro que a skill contém convenções específicas da biblioteca do usuário, não conhecimento genérico — para justificar o trigger mesmo em casos que o agente "já saberia" resolver sozinho. |
| Visão geral           | Texto introdutório enxuto (com no máximo 1024 caracteres) explicando o escopo do conjunto de princípios e sua motivação.                                                                                                                                          |
| Princípios            | Lista dos princípios cobertos pela skill, cada um com: nome, descrição curta, exemplo "antes" (violando o princípio) e exemplo "depois" (aplicando o princípio), no domínio Java do usuário.                                                                      |
| Critério de aplicação | Orientação sobre quando cada princípio se sobrepõe a outro em caso de conflito, e quando é aceitável não aplicá-lo (trade-offs reconhecidos).                                                                                                                     |
| Fora de escopo        | O que a skill não cobre, e para onde o agente deve olhar nesses casos (outra skill, ou perguntar ao usuário).                                                                                                                                                     |

Se o número de princípios for grande, cada princípio pode virar um arquivo próprio em `references/`, com o SKILL.md apenas listando os princípios e apontando para o arquivo correspondente (progressive disclosure). Isso evita que o SKILL.md ultrapasse o limite recomendado de linhas (500 linhas).

## SKILL.md de exemplo

```md
---
name: java-clean-code
description: Aplica os princípios de clean code adotados na biblioteca pessoal do usuário para geração e revisão de código Java, com exemplos concretos de antes/depois em cada princípio. Use sempre que for gerar, revisar ou refatorar código Java — não apenas quando solicitado explicitamente sobre "clean code". Contém convenções específicas do usuário, não apenas os princípios genéricos do livro.
---

Esta skill reúne os princípios de clean code que o usuário adota como padrão em projetos Java, cada um ilustrado com exemplo de código real do seu domínio. APENAS em caso de dúvida sobre um princípio específico, leia o arquivo correspondente em `references/`.

# Princípios

## Nomes significativos
Ver `references/nomes-significativos.md`.

## Funções pequenas e com uma responsabilidade
Ver `references/funcoes-pequenas.md`.

## Evitar efeitos colaterais ocultos
Ver `references/efeitos-colaterais.md`.

# Critério de aplicação

- Em caso de conflito entre "função pequena" e "evitar over-engineering", prefira a função pequena apenas se a divisão resultar em nomes que expliquem por si só o fluxo; caso contrário, mantenha o método único e comente a decisão.
- Testes unitários seguem convenções próprias (ver skill `java-testes-unitarios`) — não aplique aqui regras de nomenclatura de métodos de teste.

# Fora de escopo

- Convenções de nomenclatura de testes: ver skill `java-testes-unitarios`.
- Padrões de tratamento de exceção: ver skill `java-error-handling` (se existir) ou perguntar ao usuário como proceder.
```