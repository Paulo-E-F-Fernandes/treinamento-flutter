# bytebank_official

A new Flutter project.
 - Mensagem de commit padrão: "Aula 2: Persistência de dados - Vídeo x"

## Documentação - Livro de recitas para tarefas comuns
 - https://docs.flutter.dev/cookbook

## Dependências:
 - A dependência do "sqflite:" foi adicionada no arquivo "pubspec.yaml" sem definir um versão, por exemplo, "cupertino_icons: ^1.0.2", então no cado do "sqflite" estamos sinalizando o usu de qualquer versão.
 - Para mais informações sobre dependências, podemos acessar o link abaixo:
   - https://dart.dev/tools/pub/dependencies

## Padrão de nomenclatura:
 - Para verificar o padrão de nomenclatura utilizado no dart, podemos acessar a página https://dart.dev/guides/language/effective-dart/style.

---
## Para saber mais - Lidando com possíveis problemas no *sqflite*
 - Nesta configuração inicial do *sqflite*, caso tenha algum problema durante a execução do *onCreate*, como por exemplo, erro de *syntax* na criação da tabela, o *sqflite* mantém a execução e considera o banco como a primeira versão criada.
 - Em outras palavras, não é possível acessar a tabela, para lidar com esse tipo de situação temos 2 abordagens comuns:
   - Apagar o banco por meio do *downgrade*;
   - Realizar *migration*.

 - Para realizar o *downgrade*, basta adicionar a propriedade *onDowngrade: onDatabaseDowngradeDelete* no *openDatabase()*, então modifica a versão para 2, executa o app e modifica para a versão 1 novamente. Ao modificar para 1, o *onCreate* é executado novamente, por tanto, antes de executar, certifique-se que o problema de *syntax* foi corrigido, caso contrário é necessário realizar o mesmo procedimento.

 - Para realizar *migration* você pode incrementar a versão atual, como por exemplo, se estiver 1 vai para 2, então pode implementar a propriedade *onUpgrade* que recebe uma função com os argumentos *(Database, int, int)*, sendo que os *int's* representam a versão atual e versão nova respectivamente, então poderia considerar o seguinte exemplo de execução:
   - <pre><code>openDatabase(path, onCreate: (db, version) {
        db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
      }, 
      version: 1,
      onUpgrade: (db, oldVersion, newVersion) {
        // run sql code for upgrade
      });</code></pre>
 - É importante ressaltar que durante o processo de *migration*, qualquer tipo de mudança que afeta a estrutura inicial do *onCreate()* precisa também ser replicada no código SQL do *onCreate*, ou seja, se adicionou algum campo novo, o SQL de criação também precisa adicionar esse campo, pois um dispositivo novo não vai executar as instruções do onUpgrade.
 - Essa atualização de banco também é conhecida como *migration*, [você pode obter mais informações por meio da página do GitHub do sqflite](https://github.com/tekartik/sqflite/blob/master/sqflite/doc/migration_example.md).
---
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
