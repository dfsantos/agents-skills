# Funções

## 6. Funções pequenas

Funções devem ser pequenas — e depois, menores ainda. Se uma função não cabe na tela, provavelmente faz coisa demais.

❌ Antes
```java
void processarPedido(Pedido pedido) {
    if (pedido.getItens().isEmpty()) throw new IllegalArgumentException("Pedido vazio");
    double total = 0;
    for (Item item : pedido.getItens()) {
        total += item.getPreco() * item.getQuantidade();
    }
    if (pedido.getCupom() != null) {
        total = total - (total * pedido.getCupom().getDesconto());
    }
    pedido.setTotal(total);
    repository.save(pedido);
    emailService.enviarConfirmacao(pedido);
}
```

✅ Depois
```java
void processarPedido(Pedido pedido) {
    validarPedido(pedido);
    pedido.setTotal(calcularTotal(pedido));
    repository.save(pedido);
    emailService.enviarConfirmacao(pedido);
}
```

## 7. Uma única responsabilidade

Cada função deve fazer uma única coisa, e fazê-la bem.

❌ Antes
```java
void salvarUsuario(Usuario usuario) {
    usuario.setSenha(criptografar(usuario.getSenha()));
    repository.save(usuario);
    logger.info("Usuário salvo: " + usuario.getEmail());
    emailService.enviarBoasVindas(usuario);
}
```

✅ Depois
```java
void salvarUsuario(Usuario usuario) {
    usuario.setSenha(criptografar(usuario.getSenha()));
    repository.save(usuario);
    notificarCriacaoDeUsuario(usuario);
}
```

## 8. Um nível de abstração por função

Não misture lógica de alto nível (regra de negócio) com detalhes de baixo nível (parsing, formatação) na mesma função.

❌ Antes
```java
void gerarRelatorio(List<Venda> vendas) {
    double total = vendas.stream().mapToDouble(Venda::getValor).sum();
    String linha = "Total: R$ " + String.format("%.2f", total).replace(".", ",");
    System.out.println(linha);
}
```

✅ Depois
```java
void gerarRelatorio(List<Venda> vendas) {
    double total = calcularTotal(vendas);
    System.out.println(formatarLinhaDeTotal(total));
}

double calcularTotal(List<Venda> vendas) {
    return vendas.stream().mapToDouble(Venda::getValor).sum();
}

String formatarLinhaDeTotal(double total) {
    return "Total: R$ " + String.format("%.2f", total).replace(".", ",");
}
```

## 9. Poucos argumentos

Prefira zero a dois argumentos; muitos argumentos indicam que a função faz coisas demais.

❌ Antes
```java
void criarPedido(String clienteId, String produtoId, int quantidade, String cupom, boolean urgente, String enderecoEntrega) { ... }
```

✅ Depois
```java
void criarPedido(NovoPedido novoPedido) { ... }

record NovoPedido(String clienteId, String produtoId, int quantidade, String cupom, boolean urgente, String enderecoEntrega) {}
```

## 10. Sem efeitos colaterais escondidos

A função não deve fazer algo que seu nome não diz.

❌ Antes
```java
boolean validarSenha(String senha) {
    boolean valida = senha.length() >= 8;
    sessao.setUltimaValidacao(LocalDateTime.now()); // efeito colateral escondido
    return valida;
}
```

✅ Depois
```java
boolean validarSenha(String senha) {
    return senha.length() >= 8;
}

void registrarValidacaoDeSessao() {
    sessao.setUltimaValidacao(LocalDateTime.now());
}
```

## 11. Evitar argumentos booleanos (flags)

Um parâmetro booleano indica que a função faz mais de uma coisa dependendo do valor.

❌ Antes
```java
void enviarNotificacao(Usuario usuario, boolean urgente) {
    if (urgente) {
        smsService.enviar(usuario);
    } else {
        emailService.enviar(usuario);
    }
}
```

✅ Depois
```java
void enviarNotificacaoUrgente(Usuario usuario) {
    smsService.enviar(usuario);
}

void enviarNotificacaoPadrao(Usuario usuario) {
    emailService.enviar(usuario);
}
```

## 12. Exceções em vez de códigos de erro

Retornar códigos de erro obriga o chamador a verificar o retorno a cada chamada; exceções separam o fluxo de erro do fluxo principal.

❌ Antes
```java
int salvarPedido(Pedido pedido) {
    if (pedido == null) return -1;
    repository.save(pedido);
    return 0;
}
```

✅ Depois
```java
void salvarPedido(Pedido pedido) {
    if (pedido == null) throw new IllegalArgumentException("Pedido não pode ser nulo");
    repository.save(pedido);
}
```

## 13. Não repetir código (DRY)

Duplicação é a raiz de muitos problemas de manutenção — extraia o comportamento comum.

❌ Antes
```java
double calcularDescontoCliente(Cliente cliente, double total) {
    if (cliente.isVip()) return total * 0.9;
    return total;
}

double calcularDescontoPedido(Pedido pedido, double total) {
    if (pedido.getCliente().isVip()) return total * 0.9;
    return total;
}
```

✅ Depois
```java
double aplicarDescontoVip(Cliente cliente, double total) {
    return cliente.isVip() ? total * 0.9 : total;
}
```
