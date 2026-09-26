# Biblioteca de Skills

Este projeto é uma biblioteca de skills.

# Estrutura de diretórios do projeto

| Diretório         | O que contém                                                                                                                                                           |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| lib               | As skills que foram construídas e compõem a biblioteca.                                                                                                                |
| metamodelo        | Orientações sobre como construir as skills.                                                                                                                            |
| metamodelo/skills | Skills que podem ser utilizadas pelo agente de IA que trabalha neste projeto. As skills colocadas neste diretório estarão disponíveis em `.claude/skills` via symlink. |
| sandbox           | Diretório para criação de artefatos que são criados para testar as skills da biblioteca.                                                                               |
| snippets          | Trechos de texto que podem ser utilizados para escrever partes padronizadas de skills.                                                                                 |

Atualmente, este projeto de construir uma biblioteca de skills define categorias de skills:

| Categoria              | Local do metamodelo                   |
| ---------------------- | ------------------------------------- |
| Skills de execução     | `metamodelo/skill-de-execucao.md`     |
| Skills de conhecimento | `metamodelo/skill-de-conhecimento.md` |

Para conhecer o que é cada tipo de skill, leia o metamodelo correspondente.

# Índice de skills

Este arquivo é a fonte de verdade sobre quais skills já existem na biblioteca pessoal. Deve ser consultado antes de criar uma skill nova (para evitar duplicação/sobreposição) e atualizado sempre que uma skill for criada, renomeada ou descontinuada.

## Como preencher

Cada entrada deve conter:
- **Nome**: igual ao `name` do frontmatter da skill.
- **Tipo**: `execução` ou `conhecimento`.
- **Descrição breve**: uma frase sobre o que a skill cobre (não precisa repetir a description completa).
- **Caminho**: local da skill na biblioteca.
- **Status**: `ativa`, `rascunho`, `descontinuada`.
- **Sobreposições conhecidas**: outras skills com fronteira próxima, e como a fronteira é definida (se aplicável).

## Skills de execução

| Nome                                                | Descrição breve | Caminho | Status | Sobreposições conhecidas |
| --------------------------------------------------- | --------------- | ------- | ------ | ------------------------ |
| _(vazio — preencher conforme skills forem criadas)_ |                 |         |        |                          |

## Skills de conhecimento

| Nome            | Descrição breve                                                                               | Caminho               | Status | Sobreposições conhecidas                                                |
| --------------- | --------------------------------------------------------------------------------------------- | --------------------- | ------ | ----------------------------------------------------------------------- |
| clean-code-java | 37 regras de Clean Code (Robert C. Martin) para Java, com exemplos antes/depois por categoria | `lib/clean-code-java` | ativa  | Nomenclatura de testes fica fora — futura skill `java-testes-unitarios` |

## Histórico de decisões

Espaço livre para registrar decisões de fronteira entre skills que não são óbvias a partir da tabela — ex: "decidimos que convenções de nomenclatura de teste ficam em `java-testes-unitarios`, não em `java-clean-code`, porque X".

- Nomenclatura e padrões de teste unitário (ex: convenção de nome de método de teste) ficam fora de `clean-code-java` e devem ir para uma futura skill `java-testes-unitarios`, para não misturar convenções de estilo de produção com convenções específicas de teste.