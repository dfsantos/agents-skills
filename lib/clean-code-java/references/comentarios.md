# Comentários

## 14. O melhor comentário é o que você não precisou escrever

Torne o código autoexplicativo em vez de explicar código confuso com um comentário.

❌ Antes
```java
// verifica se o funcionário é elegível para benefício integral
if (funcionario.getMeses() > 24 && funcionario.getStatus() == 1) { ... }
```

✅ Depois
```java
if (funcionario.temMaisDeDoisAnosDeCasa() && funcionario.estaAtivo()) { ... }
```

## 15. Comentários explicam o porquê, nunca compensam código ruim

Use comentários para intenção não óbvia, não para tornar legível um código que deveria ser reescrito.

❌ Antes
```java
// desconta 15% porque cliente antigo (regra estranha do financeiro, não mexer)
total = total * 0.85;
```

✅ Depois
```java
// Regra de negócio combinada com o financeiro em 2023: clientes com mais de 5 anos
// recebem 15% de desconto fixo, independente de campanha vigente.
double descontoClienteAntigo(double total) {
    return total * 0.85;
}
```

## 16. Remova código comentado

O controle de versão já guarda o histórico — código morto comentado só polui o arquivo.

❌ Antes
```java
void calcularFrete(Pedido pedido) {
    // double freteAntigo = pedido.getPeso() * 1.5;
    // return freteAntigo;
    return pedido.getPeso() * 2.0;
}
```

✅ Depois
```java
void calcularFrete(Pedido pedido) {
    return pedido.getPeso() * 2.0;
}
```

## 17. Evite comentários redundantes

Não repita em português o que o código já diz em Java.

❌ Antes
```java
// incrementa o contador em 1
contador++;
```

✅ Depois
```java
contador++;
```
