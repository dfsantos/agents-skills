# Nomes

## 1. Nomes que revelam intenção

O nome deve dizer por que a variável/função existe e o que faz, sem precisar de comentário.

❌ Antes
```java
int d; // dias desde a última atualização
```

✅ Depois
```java
int diasDesdeUltimaAtualizacao;
```

## 2. Evitar informações falsas ou enganosas

Não chame algo de `lista` se não for uma lista, nem use nomes que sugiram um tipo ou comportamento diferente do real.

❌ Antes
```java
Map<String, Cliente> listaClientes = new HashMap<>();
```

✅ Depois
```java
Map<String, Cliente> clientesPorCpf = new HashMap<>();
```

## 3. Nomes pronunciáveis e pesquisáveis

Evite abreviações crípticas ou letras soltas; prefira nomes que possam ser ditos em voz alta e encontrados com busca.

❌ Antes
```java
Date genymdhms;
int qtdCli;
```

✅ Depois
```java
Date dataHoraGeracao;
int quantidadeClientes;
```

## 4. Evitar prefixos ou notações redundantes

Não use Hungarian notation nem prefixos de tipo — o compilador e a IDE já informam o tipo.

❌ Antes
```java
String strNome;
List<Pedido> listPedidos;
IPedidoService iPedidoService;
```

✅ Depois
```java
String nome;
List<Pedido> pedidos;
PedidoService pedidoService;
```

## 5. Classes são substantivos, métodos são verbos

Nomes de classes devem descrever "o quê"; nomes de métodos devem descrever a ação.

❌ Antes
```java
class GerenciarPedido {
    void pedido() { ... }
}
```

✅ Depois
```java
class GerenciadorDePedido {
    void processarPedido() { ... }
}
```
