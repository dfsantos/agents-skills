# Fronteiras (Boundaries)

## 27. Encapsule código de terceiros

Bibliotecas e APIs externas devem ficar atrás de uma interface própria, para que mudanças na dependência não vazem para o resto do sistema.

❌ Antes
```java
// uso direto do SDK de pagamento espalhado pelo código de negócio
StripeClient stripeClient = new StripeClient(apiKey);
Charge charge = stripeClient.charges().create(params);
```

✅ Depois
```java
interface GatewayDePagamento {
    ResultadoPagamento cobrar(Cobranca cobranca);
}

class StripeGatewayDePagamento implements GatewayDePagamento {
    private final StripeClient stripeClient;

    public ResultadoPagamento cobrar(Cobranca cobranca) {
        Charge charge = stripeClient.charges().create(paramsFrom(cobranca));
        return ResultadoPagamento.from(charge);
    }
}
```

## 28. Testes de aprendizado (learning tests)

Escreva testes que validem seu entendimento do comportamento de uma biblioteca externa antes de depender dela em produção.

❌ Antes
```java
// nenhum teste — a equipe assume o comportamento do parser de datas da lib
```

✅ Depois
```java
@Test
void parserAceitaFormatoIso8601() {
    LocalDate data = bibliotecaExterna.parse("2024-01-15");
    assertEquals(LocalDate.of(2024, 1, 15), data);
}

@Test
void parserLancaExcecaoParaFormatoInvalido() {
    assertThrows(FormatoInvalidoException.class, () -> bibliotecaExterna.parse("15/01/2024"));
}
```
