# Critérios de completude por seção

Use este arquivo para decidir o estado de cada seção no mapa de completude e para escolher as próximas perguntas. As perguntas sugeridas são pontos de partida: adapte ao vocabulário do usuário e ao que ele já disse, e nunca pergunte algo que a conversa já respondeu.

Seções **essenciais** (1, 2, 3, 4, 5, 7) precisam estar completas para a entrevista terminar por completude. Seções **complementares** (6, 8, 9) podem ser encerradas como `[PENDENTE]` sem bloquear o fim — é melhor deixar a lacuna explícita do que inventar conteúdo.

Nenhuma seção pede conhecimento técnico. Se o usuário trouxer detalhes de implementação (tecnologia, banco, API, arquitetura), agradeça, extraia a necessidade de negócio por trás deles e deixe o detalhe técnico fora do PRD.

---

## Cabeçalho

**Completo quando:** há nome do produto/feature e autor/responsável. Status, versão e data o agente preenche (Rascunho v1, v1.0, data atual) sem precisar perguntar.

**Pergunta típica:** "Como você chama esse produto/feature? E quem assina o PRD como responsável?"

## 1. Visão Geral e Proposta de Valor — essencial

**Completo quando:** dá para responder em 2–4 frases *o que é*, *para quem* e *por que vale a pena construir agora*.

**Parcial quando:** existe só a descrição da solução, sem o valor ou a motivação.

**Perguntas:** "Se esse produto existisse amanhã, o que mudaria para quem usa?" · "Por que agora? O que motivou essa demanda?"

## 2. Problema e Cenários de Uso — essencial

**Completo quando:** a dor está descrita com impacto concreto (tempo, dinheiro, erro, retrabalho, risco) e há pelo menos um cenário principal descrito como situação de uso: quem usa, em que contexto e com qual objetivo. O cenário não descreve a sequência de passos.

**Parcial quando:** a dor é genérica ("é ruim", "é lento") ou só há a solução, sem o problema.

**Perguntas:** "Como isso é feito hoje?" · "O que acontece de ruim hoje, e com que frequência?" · "Me conte a última vez em que esse problema aconteceu."

Se o usuário narrar o processo em detalhe, use o relato para entender a dor e identificar as situações de uso, mas registre no PRD só a situação (quem, contexto, objetivo), não os passos.

Atenção: stakeholders costumam chegar com a solução pronta. Volte ao problema antes de aceitar a solução como dada — sem problema claro, as métricas da seção 4 ficam sem âncora.

## 3. Personas — essencial

**Completo quando:** cada persona tem quem é, o que precisa e como se beneficia ou é afetada. Personas são pessoas ou papéis, não sistemas.

**Perguntas:** "Quem vai usar isso no dia a dia? Existe mais de um perfil?" · "Alguém é afetado sem usar diretamente (aprovador, auditor, cliente final)?"

## 4. Objetivos e Métricas — essencial

**Completo quando:** existe ao menos um objetivo com métrica e meta verificáveis, expressas em termos de negócio ou experiência (tempo de um processo, taxa de erro, volume atendido, satisfação). Uma meta sem número ou sem critério objetivo deixa a seção parcial.

**Perguntas:** "Como você vai saber, daqui a três meses, que isso deu certo?" · "Qual número você gostaria de ver mudar, e para quanto?" · "Hoje esse número está em quanto, aproximadamente?"

Se o usuário não souber a meta, proponha uma faixa plausível como hipótese e peça confirmação. Se ele não confirmar, registre com `[INFERIDO]`.

## 5. Escopo e Non-Goals — essencial

**Completo quando:** o incluso lista as capacidades principais e há pelo menos um non-goal explícito. Um PRD sem non-goals quase sempre sofre scope creep.

**Perguntas:** "O que alguém poderia esperar dessa entrega, mas não vai ter nesta versão?" · "Existe algo que fica para uma fase 2 ou outra área?"

## 6. Regras de Negócio e Invariantes — complementar

**Completo quando:** as regras que, se violadas, tornam o produto incorreto estão listadas (ou o usuário declara que não há regras críticas além dos RFs).

**Perguntas:** "Existe alguma situação que nunca pode acontecer nesse produto?" · "Tem alguma regra legal, contábil ou de política interna envolvida?"

## 7. Requisitos Funcionais — essencial

**Completo quando:** cada capacidade do escopo incluso virou ao menos um RF com necessidade e classificação (Essencial ou Desejável), e as regras que o usuário percebe ao usar o produto estão registradas.

**Parcial quando:** há RFs só para parte do escopo, ou RFs sem necessidade clara ou sem classificação.

**Perguntas:** "O que a pessoa precisa conseguir fazer com o produto?" · "Existe alguma regra ou limite que o usuário vai perceber ao usar (algo que ele não pode fazer, uma condição para conseguir)?" · "Sem quais dessas capacidades o produto não cumpre seu propósito? E quais agregam valor, mas podem ficar de fora?"

Pedir que o usuário descreva como as coisas acontecem ajuda a descobrir capacidades e regras, mas o passo a passo em si não entra no PRD: o detalhamento de comportamento pertence à análise de jornada, feita em outro trabalho. Registre apenas a necessidade e as regras visíveis ao usuário. Na tabela de RFs, a necessidade cabe em uma frase; regras ficam na lista abaixo da tabela, referenciadas pelo ID do RF.

O PRD não contém:
- **Histórias de usuário** ("Como [persona], quero…") nem critérios de aceitação — são artefatos do processo de desenvolvimento.
- **Agrupamento por módulo, componente ou subsistema** — decompor o produto é decisão arquitetural.
- **Fluxos passo a passo, exceções e casos de borda detalhados** — são detalhamento de comportamento. Se uma exceção se manifesta como regra que o usuário percebe ("não é possível cancelar com menos de 2 horas de antecedência"), ela entra como regra visível.

Classificação: **Essencial** é indispensável para o produto cumprir seu propósito; **Desejável** agrega valor, mas o produto se sustenta sem ele. Essencial tem precedência sobre Desejável. Se o usuário hesitar, pergunte o que aconteceria se a capacidade não existisse no lançamento.

## 8. Restrições e Expectativas de Negócio — complementar

**Completo quando:** os cinco tópicos (períodos críticos, volume e intensidade de uso, dados sensíveis e acesso, regulação e compliance, continuidade da operação) estão preenchidos ou explicitamente marcados como "não se aplica" pelo usuário.

**Perguntas:** "Existe algum período em que esse produto não pode falhar de jeito nenhum?" · "Quantas pessoas usariam, e em que momentos há mais movimento?" · "Há dados pessoais ou sigilosos? Quem pode ver o quê?" · "Alguma norma, auditoria ou regulador exige algo aqui?" · "Se o produto parar por algumas horas, o que acontece com a operação?"

Registre as respostas como o usuário as expressou, em linguagem de negócio. Não converta em métricas técnicas (tempo de resposta em milissegundos, percentual de uptime, requisitos de infraestrutura): essa tradução é trabalho da engenharia, fora do PRD.

## 9. Premissas e Riscos — complementar

**Completo quando:** há ao menos uma premissa e um risco com mitigação. O agente pode e deve contribuir aqui: riscos percebidos durante a entrevista entram como `[INFERIDO]`.

Registre apenas riscos de negócio, adoção, operação, prazo ou dependência de outras áreas. Riscos técnicos (falha de integração, desempenho de banco, escolha de tecnologia) ficam fora do PRD.

**Perguntas:** "O que precisa ser verdade para esse plano funcionar?" · "O que mais te preocupa que dê errado?" · "Depende de alguma outra área ou decisão para acontecer?"
