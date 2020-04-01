"# dart_week" 



# Framework
    * Backend: Aqueduct
    https://aqueduct.io/


λ brew install dart
λ pub global activate aqueduct
λ aqueduct create -t db dart_week_api
λ cd my_app
λ aqueduct serve


create database dart

* No projeto, criar o arquivo
    database.yaml


plugins

https://marketplace.visualstudio.com/items?itemName=changjoo-park.aqueduct-snippets

https://marketplace.visualstudio.com/items?itemName=AzMoza.aqueduct-helper




# criar migrates
aqueduct db generate

aqueduct db upgrade




# Anotation para as chaves estrangeiras 1-N
    * casse
        *  @Relate(#movimentacoes)
        *  CategoriaModel categoria;
    * estrangeira
        * ManagedSet<MovimentacaoModel> movimentacoes;



# Anotation para as chaves estrangeiras 1-1  // TODO: Conferir
    * casse
        *  @Relate(#movimentacoes)
        *  CategoriaModel categoria;
    * estrangeira
        *  @Relate(#movimentacoes)
        *  CategoriaModel categoria;



