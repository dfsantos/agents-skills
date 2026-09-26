# Classes

## 32. Classes pequenas, medidas por responsabilidade

O tamanho de uma classe deve ser medido pelo número de responsabilidades, não pelo número de linhas.

❌ Antes
```java
class Pedido {
    void calcularTotal() { ... }
    void salvar() { ... }
    void enviarEmailConfirmacao() { ... }
    void gerarNotaFiscal() { ... }
    void calcularImposto() { ... }
}
```

✅ Depois
```java
class Pedido {
    void calcularTotal() { ... }
}

class PedidoRepository {
    void salvar(Pedido pedido) { ... }
}

class NotificadorDePedido {
    void enviarEmailConfirmacao(Pedido pedido) { ... }
}

class EmissorDeNotaFiscal {
    void gerar(Pedido pedido) { ... }
}
```

## 33. Princípio da Responsabilidade Única (SRP)

Uma classe deve ter uma, e somente uma, razão para mudar.

❌ Antes
```java
class RelatorioDeVendas {
    String gerarTextoDoRelatorio(List<Venda> vendas) { ... }
    void salvarEmArquivo(String texto, String caminho) { ... }
    void enviarPorEmail(String texto, String destinatario) { ... }
}
```

✅ Depois
```java
class GeradorDeRelatorioDeVendas {
    String gerarTexto(List<Venda> vendas) { ... }
}

class ArmazenamentoDeRelatorio {
    void salvarEmArquivo(String texto, String caminho) { ... }
}

class EnvioDeRelatorio {
    void enviarPorEmail(String texto, String destinatario) { ... }
}
```

## 34. Maximizar coesão

Métodos e variáveis de uma classe devem estar intimamente relacionados; baixa coesão é sinal de que a classe deveria ser dividida.

❌ Antes
```java
class Utilitarios {
    double calcularFrete(Pedido pedido) { ... }
    String formatarCpf(String cpf) { ... }
    void enviarEmail(String destinatario, String assunto) { ... }
}
```

✅ Depois
```java
class CalculadoraDeFrete {
    double calcular(Pedido pedido) { ... }
}

class FormatadorDeCpf {
    String formatar(String cpf) { ... }
}

class EnviadorDeEmail {
    void enviar(String destinatario, String assunto) { ... }
}
```
