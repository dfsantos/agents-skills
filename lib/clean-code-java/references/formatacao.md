# Formatação

## 18. Arquivos e funções curtos

Favoreça a leitura de cima para baixo — arquivos e funções longos obrigam o leitor a rolar e perder contexto.

❌ Antes
```java
// PedidoService.java com 800 linhas misturando validação, cálculo, persistência,
// notificação e geração de relatório numa única classe.
```

✅ Depois
```java
// PedidoService (orquestra), PedidoValidator, PedidoCalculadora,
// PedidoRepository, PedidoNotificador — cada um em seu próprio arquivo curto.
```

## 19. Espaçamento vertical para separar conceitos

Agrupe código relacionado e separe blocos de conceitos diferentes com uma linha em branco.

❌ Antes
```java
double subtotal = calcularSubtotal(itens);
double desconto = calcularDesconto(cliente, subtotal);
double total = subtotal - desconto;
enviarEmailConfirmacao(cliente, total);
registrarAuditoria(cliente, total);
```

✅ Depois
```java
double subtotal = calcularSubtotal(itens);
double desconto = calcularDesconto(cliente, subtotal);
double total = subtotal - desconto;

enviarEmailConfirmacao(cliente, total);
registrarAuditoria(cliente, total);
```

## 20. Consistência de identação e estilo

Seja consistente em todo o projeto, idealmente com um formatador automatizado (ex: `google-java-format`, `spotless`).

❌ Antes
```java
class Pedido {
  private String id;
    private double total;
        public Pedido(String id) {
    this.id = id;
  }
}
```

✅ Depois
```java
class Pedido {
    private String id;
    private double total;

    public Pedido(String id) {
        this.id = id;
    }
}
```
