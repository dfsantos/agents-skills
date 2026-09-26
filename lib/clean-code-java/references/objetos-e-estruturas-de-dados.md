# Objetos e Estruturas de Dados

## 21. Objetos escondem dados, estruturas de dados expõem dados

Objetos expõem comportamento e escondem representação interna; estruturas de dados expõem dados e não têm comportamento significativo. Não misture os dois.

❌ Antes
```java
class ContaBancaria {
    public double saldo;
    public String titular;
}

// código cliente manipula o saldo diretamente, espalhando a regra de negócio
conta.saldo -= valorSaque;
```

✅ Depois
```java
class ContaBancaria {
    private double saldo;
    private String titular;

    public void sacar(double valor) {
        if (valor > saldo) throw new SaldoInsuficienteException();
        saldo -= valor;
    }
}

conta.sacar(valorSaque);
```

## 22. Evite estruturas híbridas

Uma classe que mistura métodos de negócio com getters/setters públicos que também expõem estado é pior que as duas formas puras, pois confunde quem deve manter a invariante.

❌ Antes
```java
class Pedido {
    public double total; // acesso direto
    public void aplicarDesconto(double percentual) { // mas também tem comportamento
        total -= total * percentual;
    }
}
```

✅ Depois
```java
class Pedido {
    private double total;

    public void aplicarDesconto(double percentual) {
        total -= total * percentual;
    }

    public double getTotal() {
        return total;
    }
}
```

## 23. Lei de Demeter

Fale apenas com "amigos diretos" — evite encadear chamadas através de objetos que você não deveria conhecer.

❌ Antes
```java
double cep = pedido.getCliente().getEndereco().getCep().getValor();
```

✅ Depois
```java
double cep = pedido.getCepDeEntrega();

// dentro de Pedido:
public String getCepDeEntrega() {
    return cliente.getCepPrincipal();
}
```
