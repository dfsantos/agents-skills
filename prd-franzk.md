# PRD — Franzk

**Status:** Rascunho v1
**Versão:** v1.0
**Data:** 2026-09-27
**Autor / Responsável:** [PENDENTE — não informado na entrevista]

> **Legenda:** [INFERIDO] = dedução do agente, não confirmada pelo stakeholder · [PENDENTE] = informação não obtida na entrevista.

## 1. Visão Geral e Proposta de Valor (Product Overview)

Um console de administração de clusters Kafka voltado a desenvolvedores, engenheiros de plataforma e testadores, que consolida em uma única ferramenta as operações hoje fragmentadas entre CLIs, scripts próprios e ferramentas visuais de terceiros. Reduz o desperdício de tempo e o ruído de comunicação entre times causados pela heterogeneidade de abordagens, numa época em que o número de times usando Kafka está crescendo.

## 2. Declaração do Problema e Contexto (Problem Statement)

### O Problema

Hoje, cada perfil (desenvolvedor, engenheiro de plataforma, testador) resolve suas necessidades em torno do Kafka de forma isolada e heterogênea — usando ferramentas visuais de terceiros, CLI ou scripts próprios. Isso gera desperdício de tempo, trabalho pouco eficiente e torna a comunicação entre times "ruidosa", pois não há uma linguagem ou ferramenta comum para tratar das questões do Kafka. A necessidade se intensificou com o crescimento do número de times que utilizam Kafka.

### Cenários de Uso Principais (Key Use Cases)

- **Desenvolvedor local:** Durante o desenvolvimento de um sistema, o desenvolvedor precisa subir um cluster Kafka local, inspecionar o conteúdo de tópicos e publicar mensagens manualmente para validar o comportamento da sua aplicação, sem depender de ferramentas fragmentadas ou scripts próprios.
- **Engenheiro de plataforma:** Ao operar um cluster Kafka compartilhado (teste, homologação, produção), o engenheiro de plataforma precisa criar, excluir e reconfigurar tópicos, e eventualmente intervir em situações de correção (como ajustar o offset de um consumer group), com segurança e agilidade.
- **Testador:** Ao validar um sistema num ambiente compartilhado, o testador precisa publicar mensagens manualmente (unitárias ou em lote) e inspecionar o conteúdo e o fluxo de tópicos, sem acesso direto à aplicação sob teste.

## 3. Personas e Públicos Impactados

- **Desenvolvedor:** Implementa sistemas que produzem/consomem do Kafka; precisa de um ambiente local ágil para inspecionar e publicar mensagens durante o desenvolvimento.
- **Engenheiro de plataforma:** Responsável por operar clusters Kafka compartilhados (teste, homologação, produção); precisa criar/gerenciar tópicos e realizar intervenções de correção.
- **Testador:** Valida sistemas em ambientes compartilhados; precisa publicar mensagens de teste e inspecionar conteúdo/fluxo de tópicos sem acesso à aplicação.
- **Arquiteto de software:** Transita pelas necessidades de desenvolvedor e testador, porém com foco adicional em observabilidade — acompanha métricas dos tópicos e confere configurações que impactam o comportamento dos processos que passam por eles.

## 4. Objetivos e Métricas de Sucesso (Goals & Success Metrics)

### Objetivos Principais

1. Consolidar as atividades de administração e operação do Kafka em uma ferramenta comum, reduzindo a fragmentação de ferramentas e scripts entre times.
2. Reduzir a dependência do time de plataforma para operações manuais rotineiras em tópicos e consumer groups.

### Métricas e Metas

| Objetivo | Métrica / KPI | Meta Esperada |
|---|---|---|
| Reduzir dependência do time de plataforma | Volume de tickets abertos ao time de plataforma relacionados a operações manuais em tópicos/consumer groups (criação, exclusão, ajuste de offset, inspeção de mensagens) | Redução de 50% em até 6 meses após a adoção [INFERIDO] |

## 5. Escopo e Fronteiras (Scope & Non-Goals)

### Incluso (In-Scope — O que será construído)

- Provisionamento e operação de cluster Kafka em ambiente local para o desenvolvedor.
- Criação, exclusão e reconfiguração de tópicos (incluindo alteração de quantidade de partições) em ambientes compartilhados (teste, homologação, produção).
- Intervenções de correção operacional, como ajuste de offset de consumer group.
- Publicação manual de mensagens, unitária ou em lote.
- Inspeção de conteúdo e fluxo de mensagens em tópicos.
- Visão essencial de observabilidade dos tópicos e configurações relevantes ao comportamento dos processos, sem drill-down — como acompanhamento superficial, não como substituto de uma stack de observabilidade dedicada.

### Fora de Escopo (Non-Goals — O que NÃO será construído nesta versão)

- Gestão de segurança e controle de acesso (ACLs) do Kafka.
- Integração com schema registry.
- Observabilidade completa com drill-down — essa responsabilidade permanece com a stack de monitoramento dedicada (ex: Grafana/Prometheus) [INFERIDO — exemplos de stack citados pelo usuário na pergunta, não confirmados como as ferramentas reais em uso].

## 6. Regras de Negócio Críticas e Invariantes

1. **Confirmação por pares para exclusão de tópicos:** Um tópico só pode ser excluído livremente quando o cluster estiver executando em ambiente local. Em qualquer outro ambiente, a exclusão exige uma etapa de confirmação por pares.

## 7. Requisitos Funcionais (RFs)

#### RF-001: Provisionamento de cluster local (Classificação: Essencial)

**Necessidade:** O desenvolvedor precisa subir um cluster Kafka em ambiente local para desenvolver e validar sua aplicação sem depender de scripts próprios ou ferramentas fragmentadas.

#### RF-002: Criação e exclusão de tópicos (Classificação: Essencial)

**Necessidade:** O engenheiro de plataforma precisa criar e excluir tópicos em ambientes compartilhados (teste, homologação, produção).

#### RF-003: Reconfiguração de tópicos (Classificação: Essencial)

**Necessidade:** O engenheiro de plataforma precisa alterar a configuração de tópicos existentes, incluindo a quantidade de partições.

#### RF-004: Ajuste de offset de consumer group (Classificação: Essencial)

**Necessidade:** O engenheiro de plataforma precisa intervir em situações de correção operacional ajustando o offset de um consumer group.

#### RF-005: Publicação manual de mensagem unitária (Classificação: Essencial)

**Necessidade:** O desenvolvedor e o testador precisam publicar manualmente uma mensagem por vez em um tópico, para validar o comportamento de uma aplicação sob teste.

#### RF-006: Inspeção de conteúdo de mensagens em tópicos (Classificação: Essencial)

**Necessidade:** O desenvolvedor, o testador e o arquiteto precisam inspecionar o conteúdo e o fluxo de mensagens em tópicos, para validar comportamento ou investigar problemas.

#### RF-007: Publicação de mensagens em lote (Classificação: Desejável)

**Necessidade:** O testador precisa publicar múltiplas mensagens de uma vez em um tópico. Não substitui ferramentas especialistas de load testing.

#### RF-008: Visão essencial de observabilidade e configuração de tópicos (Classificação: Desejável)

**Necessidade:** O arquiteto precisa acompanhar métricas essenciais dos tópicos e conferir configurações que impactam o comportamento dos processos, sem a profundidade de uma stack de observabilidade dedicada.

## 8. Restrições e Expectativas de Negócio

- **Períodos Críticos:** O cluster Kafka roda 24/7; a criticidade do console acompanha a criticidade do cluster, sem uma janela específica de maior risco.
- **Volume e Intensidade de Uso:** Cerca de 32 times, entre desenvolvedores, testadores, arquitetos e engenheiros de plataforma.
- **Dados Sensíveis e Acesso:** As mensagens inspecionadas podem conter dados pessoais. A conformidade com a LGPD precisa ser considerada, mas seu tratamento fica para uma versão futura — os desdobramentos ainda precisam ser avaliados.
- **Regulação e Compliance:** [PENDENTE — ver observação sobre LGPD acima; tratamento formal adiado para versão futura]
- **Continuidade da Operação:** Não existirá contingência prevista; se o console ficar indisponível, não há uma forma manual alternativa planejada para operar o Kafka.

## 9. Premissas, Riscos e Mitigações (Assumptions & Risks)

- **Risco Registrado:** Acesso indevido a dados sensíveis, especialmente em ambientes de produção, ao inspecionar conteúdo de mensagens → **Mitigação:** Avaliar controle de acesso a dados de produção e conformidade com a LGPD em versão futura do produto [INFERIDO — mitigação proposta a partir da preocupação relatada; ainda não há solução definida pelo usuário].
