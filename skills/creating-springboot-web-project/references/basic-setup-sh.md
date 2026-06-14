# basic-setup.sh

Script para criar projetos Spring Boot via Spring Boot CLI.

## Uso

```bash
./basic-setup.sh <groupId> <artifactId>
```

## Argumentos

- **groupId** - ID do grupo Maven (ex: `com.company`)
- **artifactId** - ID do artefato (ex: `my-api`)

## Padrões

- Java: `25`
- Dependências: `web`
- Descrição: `Spring Boot project`
- Saída: `<artifactId>`
- Package: `<groupId>.<artifactId>` (com hífens convertidos em pontos)

## Exemplos

```bash
./basic-setup.sh com.company my-api
./basic-setup.sh org.example api-gateway
```

## Pré-requisitos

- Spring Boot CLI instalado
- Bash 4.0+

## Resultado

Cria diretório com nome igual ao `artifactId` contendo o projeto Spring Boot configurado.