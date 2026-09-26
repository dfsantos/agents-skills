---
name: skill-creator-java
description: Cria e edita skills para a biblioteca pessoal de desenvolvimento Java, seguindo os metamodelos de skill de execução e skill de conhecimento definidos em references/. Use sempre que o usuário pedir para criar, ajustar ou revisar uma skill dentro dessa biblioteca (ex: skills de clean code, testes unitários, setup de projeto, convenções Java). NÃO use para skills genéricas fora dessa biblioteca — nesse caso, use o skill-creator padrão.
---

# Skill Creator (biblioteca Java)

Esta skill estende o processo padrão de criação de skills (draft → test → eval → iterate) descrito em `skill-creator` original, adicionando uma etapa obrigatória anterior: **decidir o tipo de skill segundo o metamodelo da biblioteca, e aplicar a anatomia correspondente.**

Todo o resto do processo (interview, escrita de test cases, execução de evals, otimização de description, empacotamento) segue exatamente o skill-creator padrão — não repita essa lógica aqui, apenas consulte-a quando chegar a hora.

## Ordem de leitura

1. Leia este arquivo por completo primeiro.
2. Ao chegar na etapa "Write the SKILL.md" do processo padrão, PARE e siga a seção "Decisão de tipo" abaixo antes de escrever qualquer conteúdo.
3. Consulte `references/biblioteca-index.md` para saber o que já existe na biblioteca e evitar duplicação ou fragmentação desnecessária.
4. Consulte o metamodelo correspondente ao tipo decidido antes de escrever a SKILL.md.

## Decisão de tipo

Antes de escrever qualquer skill nova, pergunte ao usuário (ou infira da conversa, se já estiver claro) qual dos dois tipos se aplica:

**Skill de execução** — a tarefa segue passos determinísticos, idealmente automatizáveis em script, com um agente que só orquestra. Exemplos: setup de projeto Spring Boot, geração de um módulo Maven padrão, aplicação de um scaffold.
→ Consulte `references/metamodelo-execucao.md` e siga a anatomia definida lá (Visão geral / Execução / Verificação / Restrições).

**Skill de conhecimento** — a tarefa exige julgamento aplicado a partir de princípios e convenções, sem passos fixos. Exemplos: clean code, construção de testes unitários, convenções de nomenclatura, padrões de tratamento de erro.
→ Consulte `references/metamodelo-conhecimento.md` e siga a anatomia definida lá.

Se a tarefa combinar as duas naturezas (ex: "criar um novo endpoint seguindo nossos padrões" pode ter passos fixos de scaffold + decisões de nomenclatura/estilo), prefira separar em duas skills distintas — uma de execução, uma de conhecimento — em vez de misturar as duas anatomias em um único SKILL.md. Sinalize essa recomendação ao usuário e deixe a decisão final com ele.

## Verificação de sobreposição

Antes de criar uma skill nova, verifique `references/biblioteca-index.md`:
- Se já existe uma skill que cobre parte do escopo pedido, pergunte ao usuário se é para estender a existente ou criar uma nova com fronteira clara.
- Ao finalizar uma skill nova, lembre o usuário de atualizar `references/biblioteca-index.md` com a entrada correspondente (nome, tipo, descrição breve, caminho).

## A partir daqui

Prossiga com o processo padrão descrito no skill-creator original (`../skill-creator/SKILL.md`): Capture Intent → Interview and Research → Write the SKILL.md (agora informado pelo metamodelo escolhido) → test cases → eval → iterate → package.

Use os scripts, agents e eval-viewer do skill-creator original sem modificação — nada nessa camada muda por causa do metamodelo.