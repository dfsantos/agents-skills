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

[Descreva as situações em que o produto será usado: quem usa, em que contexto e com qual objetivo. Não descreva a sequência de passos: o detalhamento da jornada é definido em outro trabalho.]

- **[Cenário 1]:** [Situação de uso principal — ex: No início do expediente, o gerente precisa saber quais clientes da carteira estão com pendências]
- **[Cenário 2]:** [Situação de uso secundária ou menos frequente, mas relevante]

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

## 7. Requisitos Funcionais (RFs)

[Liste as capacidades que o produto precisa oferecer, em termos gerais. Não descreva como será construído, como o trabalho será organizado nem o passo a passo das jornadas: isso é definido em outros trabalhos. Classifique cada RF como Essencial (indispensável para o produto cumprir seu propósito) ou Desejável (agrega valor, mas o produto se sustenta sem ele). Essencial tem precedência sobre Desejável.]

| ID | Nome | Necessidade | Classificação |
|---|---|---|---|
| RF-001 | [Nome do Requisito] | [O que o produto deve permitir ou garantir, e para qual persona da seção 3] | Essencial |
| RF-002 | [Nome do Requisito] | [O que o produto deve permitir ou garantir, e para qual persona da seção 3] | Desejável |

### Regras Visíveis ao Usuário

- **RF-001:** [Regra que o usuário percebe ao usar o produto. Ex: Não é possível agendar uma aula que já está lotada]

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
