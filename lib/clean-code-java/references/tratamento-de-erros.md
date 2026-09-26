# Tratamento de Erros

## 24. Exceções em vez de códigos de retorno

Códigos de retorno obrigam verificação manual a cada chamada e são fáceis de ignorar.

❌ Antes
```java
int transferir(Conta origem, Conta destino, double valor) {
    if (origem.getSaldo() < valor) return -1;
    origem.debitar(valor);
    destino.creditar(valor);
    return 0;
}
```

✅ Depois
```java
void transferir(Conta origem, Conta destino, double valor) {
    if (origem.getSaldo() < valor) throw new SaldoInsuficienteException(origem);
    origem.debitar(valor);
    destino.creditar(valor);
}
```

## 25. Não retorne nem passe `null`

`null` gera verificações defensivas espalhadas pelo código e é fonte comum de `NullPointerException`.

❌ Antes
```java
Cliente buscarCliente(String cpf) {
    Cliente cliente = repository.findByCpf(cpf);
    return cliente; // pode ser null
}

// no chamador:
Cliente cliente = buscarCliente(cpf);
if (cliente != null) { ... }
```

✅ Depois
```java
Optional<Cliente> buscarCliente(String cpf) {
    return repository.findByCpf(cpf);
}

// no chamador:
buscarCliente(cpf).ifPresent(cliente -> ...);
```

## 26. Contexto suficiente no erro

A exceção deve carregar informação suficiente para diagnosticar causa e origem.

❌ Antes
```java
throw new RuntimeException("erro");
```

✅ Depois
```java
throw new PedidoInvalidoException(
    "Pedido " + pedido.getId() + " não pode ser processado: total negativo (" + pedido.getTotal() + ")"
);
```
