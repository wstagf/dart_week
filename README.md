"# dart_week" 



# Framework
    * Backend: Aqueduct
    https://aqueduct.io/

<pre>
$ brew install dart
$ pub global activate aqueduct
$ aqueduct create -t db dart_week_api
$ cd my_app
$ aqueduct serve
</pre>


# Plugins

    * https://marketplace.visualstudio.com/items?itemName=changjoo-park.aqueduct-snippets

    * https://marketplace.visualstudio.com/items?itemName=AzMoza.aqueduct-helper

    * https://marketplace.visualstudio.com/items?itemName=BendixMa.dart-data-class-generator



# Create database models in dart

* No projeto, criar o arquivo
    database.yaml



## criar migrates
aqueduct db generate

## atualizar o banco de dados com as migrates
aqueduct db upgrade

## Anotation para as chaves estrangeiras 1-N
    * casse
        *  @Relate(#movimentacoes)
        *  CategoriaModel categoria;
    * estrangeira
        * ManagedSet<MovimentacaoModel> movimentacoes;



## Anotation para as chaves estrangeiras 1-1  // TODO: Conferir
    * casse
        *  @Relate(#movimentacoes)
        *  CategoriaModel categoria;
    * estrangeira
        *  @Relate(#movimentacoes)
        *  CategoriaModel categoria;


# Contruir as rotas
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
            

# Build backend to heroku apps

    <pre>heroku create minhascontasback</pre>
    <pre>heroku config:set DART_SDK_URL=https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.67.0/sdk/dartsdk-linux-x64-release.zip --app=minhascontas</pre>
    <pre>heroku config:set DART_BUILD_CMD="/app/dart-sdk/bin/pub global activate webdev && /app/dart-sdk/bin/pub global run webdev build" --app=minhascontasback</pre>
    <pre>webdev build</pre>

# Flutter build codes

* code generator
    - flutter packages pub run build_runner watch --delete-conflicting-outputs

    - flutter packages pub run build_runner build --delete-conflicting-outputs

* gerar modulos 

    - slidy g m modules/login -c


# TODO
    * layout está quebrando quando o teclado aparece

    * Continuar em 
    * https://youtu.be/B9qRoH8N_p8?t=7970
    * Aula 04 - tempo 2:12:50

