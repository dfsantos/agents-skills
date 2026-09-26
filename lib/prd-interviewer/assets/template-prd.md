# PRD — [Nome do Produto, Feature ou Sistema]

**Status:** [Rascunho v1 / Em Avaliação / Aprovado]
**Versão:** [v1.0]
**Data:** [AAAA-MM-DD]
**Autor / Responsável:** [Nome do Autor / Time / E-mail]

## 1. Visão Geral e Proposta de Valor (Product Overview)

[Descreva de forma clara e sucinta o produto ou feature: o que é, o valor que entrega ao negócio/usuário e a motivação central para sua criação.]

## 2. Declaração do Problema e Contexto (Problem Statement)

### O Problema

[Descreva a dor atual de forma objetiva e seu impacto no usuário ou na operação.]

### Cenários de Uso Principais (Key Use Cases)

- **[Cenário 1]:** [Explicite a jornada do usuário ou fluxo operacional principal]
- **[Cenário 2]:** [Explicite um fluxo secundário ou operacional relevante]

## 3. Personas e Públicos Impactados

- **[Persona 1]:** [Quem é, necessidades principais e como se beneficia da solução].
- **[Persona 2]:** [Quem é, necessidades principais e como é afetado — inclusive públicos que não usam o produto diretamente, como aprovadores ou auditores].

## 4. Objetivos e Métricas de Sucesso (Goals & Success Metrics)

### Objetivos Principais

1. [Objetivo de produto/negócio 1]
2. [Objetivo de experiência ou eficiência 2]

### Métricas e Metas

| Objetivo | Métrica / KPI | Meta Esperada |
|---|---|---|
| [Ex: Reduzir tempo de publicação] | [Tempo médio entre o pedido e a publicação] | [< 2 horas] |
| [Ex: Aumentar a autonomia do cliente] | [% de solicitações resolvidas sem atendimento humano] | [> 70%] |

## 5. Escopo e Fronteiras (Scope & Non-Goals)

### Incluso (In-Scope — O que será construído)

- [Funcionalidade ou capacidade 1]
- [Funcionalidade ou capacidade 2]

### Fora de Escopo (Non-Goals — O que NÃO será construído nesta versão)

- [Item ou capacidade intencionalmente excluída para evitar scope creep]
- [Responsabilidade delegada a outra área, produto ou fase futura]

## 6. Regras de Negócio Críticas e Invariantes

[Descreva as regras invioláveis de comportamento do produto.]

1. **[Regra 1]:** [Exemplo: Os valores exibidos refletem sempre a situação real e atualizada.]
2. **[Regra 2]:** [Exemplo: Um registro inativo não deve ser visível na experiência pública.]

## 7. Requisitos Funcionais (RFs) e Histórias de Usuário

[Foque na experiência e comportamento do produto, do ponto de vista de quem usa. Não descreva como será implementado.]

### Módulo: [Nome do Módulo]

#### RF-001: [Nome do Requisito] (Prioridade: P0)

**História de Usuário:** Como [persona], quero [ação] para que [benefício].

**Comportamento Esperado:**
- [Passo a passo lógico da jornada ou regra do produto]

**Exceções e Casos de Borda:**
- [O que o usuário deve ver ou poder fazer quando algo foge do fluxo normal]

## 8. Restrições e Expectativas de Negócio

[Registre, na linguagem do negócio, as condições que o produto precisa respeitar. Não traduza em métricas técnicas: essa tradução cabe à engenharia, em documento próprio.]

- **Períodos Críticos:** [Ex: Não pode ficar indisponível durante o fechamento mensal, entre os dias 28 e 5]
- **Volume e Intensidade de Uso:** [Ex: Cerca de 200 analistas usam ao mesmo tempo no início do expediente]
- **Dados Sensíveis e Acesso:** [Ex: Envolve dados pessoais de clientes; cada gerente só vê a própria carteira]
- **Regulação e Compliance:** [Ex: Toda alteração de limite precisa ficar registrada para auditoria por 5 anos]
- **Continuidade da Operação:** [Ex: Se o produto parar, a equipe precisa de uma forma manual de seguir atendendo]

## 9. Premissas, Riscos e Mitigações (Assumptions & Risks)

- **Premissa:** [Hipótese ou condição de negócio assumida como verdadeira para este escopo]
- **Risco Registrado:** [Risco de negócio, adoção ou operação] → **Mitigação:** [Ação preventiva proposta]

## 10. Critérios de Aceitação (Definition of Done)

Checklist objetivo para validar se o requisito foi atendido com qualidade:

- [ ] [O usuário consegue realizar o fluxo X de ponta a ponta sem erros]
- [ ] [As exceções conhecidas são tratadas de forma compreensível para o usuário]
- [ ] [As restrições e expectativas de negócio da seção 8 são atendidas]
