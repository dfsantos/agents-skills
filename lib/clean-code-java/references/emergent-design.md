# Emergent Design (Design que emerge)

## 35. Código limpo emerge de quatro regras simples

Nesta ordem de prioridade: (1) passa nos testes, (2) expressa a intenção do programador, (3) elimina duplicação, (4) minimiza o número de classes/métodos.

❌ Antes
```java
class ServicoDeDesconto {
    double aplicar(double total, String tipoCliente) {
        if (tipoCliente.equals("VIP")) {
            return total - (total * 0.2);
        } else if (tipoCliente.equals("REGULAR")) {
            return total - (total * 0.1);
        } else if (tipoCliente.equals("NOVO")) {
            return total;
        }
        return total;
    }
    // sem testes, intenção pouco clara sobre por que cada percentual existe
}
```

✅ Depois
```java
enum TipoCliente {
    VIP(0.2), REGULAR(0.1), NOVO(0.0);

    private final double percentualDesconto;

    TipoCliente(double percentualDesconto) {
        this.percentualDesconto = percentualDesconto;
    }

    double aplicarDesconto(double total) {
        return total - (total * percentualDesconto);
    }
}

// coberto por teste para cada tipo de cliente, sem duplicação de if/else
```
