# Testes

## 29. Testes tão limpos quanto o código de produção

Testes confusos ou duplicados desencorajam manutenção e acabam sendo abandonados.

❌ Antes
```java
@Test
void teste1() {
    Pedido p = new Pedido();
    p.adicionarItem(new Item("A", 10.0, 2));
    p.adicionarItem(new Item("B", 5.0, 1));
    assertEquals(25.0, p.getTotal());
    p.aplicarCupom(new Cupom(0.1));
    assertEquals(22.5, p.getTotal());
}
```

✅ Depois
```java
@Test
void totalSomaPrecoDosItens() {
    Pedido pedido = pedidoCom(item("A", 10.0, 2), item("B", 5.0, 1));
    assertEquals(25.0, pedido.getTotal());
}

@Test
void cupomAplicaDescontoSobreOTotal() {
    Pedido pedido = pedidoComTotal(25.0);
    pedido.aplicarCupom(cupomDe(0.1));
    assertEquals(22.5, pedido.getTotal());
}
```

## 30. Padrão F.I.R.S.T.

Testes devem ser Fast, Independent, Repeatable, Self-validating, Timely.

❌ Antes
```java
@Test
void testeIntegracaoComBancoReal() {
    // depende de um banco externo específico, lento e pode falhar por rede
    Cliente cliente = jdbcTemplate.queryForObject("SELECT * FROM clientes WHERE id = 1", ...);
    assertNotNull(cliente);
}
```

✅ Depois
```java
@Test
void buscaClientePorId() {
    repository.save(new Cliente(1L, "Maria"));
    Optional<Cliente> cliente = repository.findById(1L);
    assertTrue(cliente.isPresent());
}
// usando banco em memória/testcontainers isolado por teste, sem depender de estado externo
```

## 31. Um conceito por teste

Cada teste deve verificar uma única coisa, com um nome que descreva exatamente o que está sendo validado.

❌ Antes
```java
@Test
void testaValidacoesDoPedido() {
    assertThrows(Exception.class, () -> new Pedido(null));
    assertThrows(Exception.class, () -> new Pedido("").adicionarItem(null));
    assertTrue(new Pedido("1").estaVazio());
}
```

✅ Depois
```java
@Test
void naoPermiteCriarPedidoComIdNulo() {
    assertThrows(IllegalArgumentException.class, () -> new Pedido(null));
}

@Test
void naoPermiteAdicionarItemNulo() {
    Pedido pedido = new Pedido("1");
    assertThrows(IllegalArgumentException.class, () -> pedido.adicionarItem(null));
}

@Test
void pedidoNovoComecaVazio() {
    assertTrue(new Pedido("1").estaVazio());
}
```
