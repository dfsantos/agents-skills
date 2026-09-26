# Geral

## 36. Regra do escoteiro

Deixe o código mais limpo do que você o encontrou — pequenas melhorias a cada alteração evitam a degradação do código ao longo do tempo.

❌ Antes
```java
// PR só adiciona o novo campo, ignorando o nome de variável ruim já existente na função tocada
void processar(Pedido p) {
    double t = p.getTotal();
    t = t + p.getNovoCampo(); // única linha nova
}
```

✅ Depois
```java
// PR adiciona o campo e aproveita para renomear a variável que já estava ali
void processar(Pedido pedido) {
    double total = pedido.getTotal();
    total = total + pedido.getNovoCampo();
}
```

## 37. Níveis de abstração separados por responsabilidade (SRP aplicado à arquitetura)

Assim como métodos e classes, o sistema como um todo deve ser organizado em camadas/módulos com responsabilidades bem definidas.

❌ Antes
```java
// Controller acessando o banco diretamente e montando SQL, misturando
// apresentação, regra de negócio e persistência na mesma classe.
class PedidoController {
    void criar(HttpServletRequest request) {
        String sql = "INSERT INTO pedidos ...";
        jdbcConnection.execute(sql);
    }
}
```

✅ Depois
```java
class PedidoController {
    private final PedidoService pedidoService;

    void criar(NovoPedidoRequest request) {
        pedidoService.criar(request.toNovoPedido());
    }
}

class PedidoService {
    private final PedidoRepository pedidoRepository;

    void criar(NovoPedido novoPedido) {
        pedidoRepository.save(new Pedido(novoPedido));
    }
}
```
