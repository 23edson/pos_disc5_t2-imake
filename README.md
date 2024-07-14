
## Trabalho 2 / Desenvolvimento Mobile / Pós-Graduação

-Edson Lemes da Silva   

A aplicação foi modificada conforme os requisitos do trabalho. Abaixo cada item modificado:

1. `Adicionar uma tela de login com e-mail e senha. Não precisa autenticar no banco de dados;`

    O arquivo `page_login.dart` contém um widget que representa uma tela de login. Esse widget não faz validação em nenhum banco de dados, existe apenas uma credencial fixa para teste:<br> 
    <b>login:</b> admin<br>
    <b>senha:</b> admin

2. `Adicionar um atributo chamado detail, na tarefa, do tipo String;`

    Para adição do atributo, foi alterado os seguintes arquivos:
    * tasks/data/local/model/`task_model.dart` : adicionado o atributo no model que representa uma tarefa.
    * tasks/presentation/bloc/`tasks_bloc.dart` : Alterado as funções para interagir com o novo atributo.
    * tasks/presentation/pages/`new_task_screen.dart`: Adicionado novo campo na tela de cadastro para o detail.
    * tasks/presentation/pages/`update_task_screen.dart`: Alterado para permitir editar o novo atributo detalhes das tarefas criadas.
    * tasks/presentation/widget/`task_item_view.dart`: Adicionado atributo detalhe para exibir na lista de tarefas de acordo com o item.

3. `Corrigir os erros no arquivo tasks_bloc.dart;`

    Alterações no arquivo `task_bloc.dart`:<br>
    * import tasks_event.dart;
    * import tasks_state.dart;
    * removido `?` da linha 19;

    Alterações arquivos `tasks_event.dart` e `tasks_state.dart`:<br>
    * import package:flutter/material.dart
    * tasks/data/local/model/task_model.dart

    Alteração arquivo `new_task_screen.dart`:<br>
    * import bloc/tasks_event.dart

    Alteração arquivo `tasks_screen.dart` e `update_task_screen.dart`:<br>
    * import bloc/tasks_event.dart;
    * import bloc/tasks_state.dart;

    Alteração arquivo `task_item_view.dart`:<br>
    * import bloc/tasks_event.dart

4. `Trocar o ícone da aplicação para Android;`

    O ícone da aplicação alterado foi substituído no diretório <b>android/app/src/main/res</b>. Nessa pasta foram incluídos ícones para os diversos tamanhos: <i>mipmap-hdpi</i>, <i>mipmap-mdpi</i>, <i>mipmap-xhdpi</i>,<i>mipmap-xxhdpi</i> e <i>mipmap-xxxhdpi</i>. 

5. `Corrija as rotas para que seja possível acessar a tela de splash. Ela deve ser a primeira tela a abrir;`

    Para essa tarefa basicamente foi alterado o arquivo de rotas: `app_routes.dart`, onde a rota inicial foi alterada para apontar para widget `splash_screen.dart`.

    Alteração [linha 15-17]: 
    ```
    case Pages.initial:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen());
    ```

6. `Adicionar uma tela sobre com informações dos desenvolvedores;`

    Foi criado um widget chamado `about_us.dart` na raiz do projeto. Esse widget é simples, 
    basicamente exibe o nome do professor e do aluno, assim como a logo da universidade.

    O widget é essa acessado através de um <i>FloatingActionButton</i> disponível na tela inicial (app logado). O botão está disposto acima do botão utilizado para adicionar uma nova tarefa.

    Basicamente foi criado uma nova rota chamada `about`, que é invocada no arquivo `task_screen.dart` através de um <i> tap event </i>. Neste instante o widget `about_us.dart` é apresentado na tela.

7. `Trocar o nome do app para Android;`

    O aplicativo foi renomeado para: <b>T2 - pós-app</b>. 

     Para mudar o nome do aplicativo, foi alterado o label no arquivo <b>AndroidManifest.xml</b>; localizado em: <i>android/app/main/AndroidManifest.xml</i>

    Alteração [linha 3]:
    ```
      android:label="T2 - pós-app"
    ``` 
    Além disso, também foi alterado a tela de apresentação `splash_screen.dart`, adicionando também o ícone correspondente do app.

8. `Implementar a ordenação de tarefas por data.`

    Na tela de listagem das tarefas foi adicionado um botão para o usuário escolher a filtragem de data ascendente ou descendente. Ao clicar, a lista de tarefas exibida abaixo é imediatamente ordenada.

    No arquvo `task_screen.dart` foi incluído um <i>PopupMenuButton</i>, onde ao clicar abre um menu com duas opções de ordenação: ascendente ou descendente.

    no arquivo `task_bloc.dart` foi criado um novo evento chamado de: <i>OrderByDateEvent</i>. Esse por sua vez invoca o método do repositório (arquivo `task_repository.dart`). Dentro do provider correspondente (`task_data_provider.dart`) está implementado a lógica que faz a análise das datas a fim de determinar a ordenação. Basicamente a função ordena as tarefas comparando os seus <i>dateTime</i>. No final, retorna a lista de tarefas ordenadas pelas datas.

