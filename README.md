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

# atualizar o banco de dados com as migrates
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


* Contruir as rotas
    * chanel.dart
    <pre>
    <code>
    @override
    Controller get entryPoint {
        final router = Router();
        UsuariosRouter.configurar(router, context); // Adicionado esta linha
        return router;
    }
    </code>
    </pre>

            

    *  usuariosRouter.dart
        * Implementar método configuar
    <pre>
        <code>
        static void configurar(Router router, ManagedContext context) {
            router.route('/login').link(() => LoginController(context));
        }
        </code>
    </pre>
            


* build codes

- flutter packages pub run build_runner watch --delete-conflicting-outputs

- flutter packages pub run build_runner build --delete-conflicting-outputs

* gerar modulos 

- slidy g m modules/login -c

* TODO
    

Continuar em 

https://youtu.be/AuMeicABhpo?t=4084

Aula 03 - tempo 1:08:04
