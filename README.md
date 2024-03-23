<h1>Aplicativo de Controle Agrícola Flutter</h1>
Este aplicativo foi desenvolvido com o objetivo de auxiliar na gestão e controle de operações agrícolas, permitindo o cadastro, visualização, edição e acompanhamento das diversas atividades realizadas em uma fazenda. Utilizando Flutter, o aplicativo oferece uma solução móvel cross-platform para a administração eficiente de tratos agrícolas.

<h2>Características Principais</h2>
Cadastro de Operações Agrícolas: Permite o registro de diversas informações relativas a operações agrícolas, incluindo código da fazenda, área em hectares, culturas plantadas, operações realizadas, produtos utilizados e suas doses, e datas importantes (como de aplicação e execução).

<h3>Listagem de Operações : </h3> Exibe uma lista de todas as operações cadastradas, com informações resumidas. A lista serve como ponto de acesso para visualizar detalhes de cada operação ou para iniciar o processo de edição.

<h3>Detalhamento de Operações :</h3> Oferece uma visão detalhada de cada operação, incluindo todas as informações cadastradas. Nesta tela, o usuário pode também iniciar a edição dos dados.

<h3>Edição de Operações :</h3> Facilita a atualização das informações de operações já cadastradas, permitindo modificar qualquer dado previamente inserido.

<h3>Cálculos Automatizados:</h3> Realiza cálculos automáticos de doses de produtos com base na área em hectares da operação, otimizando o planejamento e a execução das atividades agrícolas.

<p> Estrutura do Projeto<br>
css<br>
Copy code<br>
flutter_agricultural_control_app/<br>
├── android/<br>
├── ios/<br>
├── lib/<br>
│   ├── models/<br>
│   │   └── operation.dart<br>
│   ├── widgets/<br>
│   │   ├── operation_form.dart<br>
│   │   └── operation_list_item.dart<br>
│   ├── views/<br>
│   │   ├── home_page.dart<br>
│   │   ├── operation_details_page.dart<br>
│   │   └── add_edit_operation_page.dart<br>
│   └── main.dart<br>
├── pubspec.yaml</p><br>

<h2>Tecnologias Utilizadas</h2>
<h3>Flutter:</h3> Framework de desenvolvimento cross-platform que permite uma única base de código para iOS e Android.
<h3>Dart:</h3> Linguagem de programação utilizada para o desenvolvimento Flutter, focando em produtividade e performance.

<h2>Como Usar</h2>
Para executar o aplicativo, é necessário ter o Flutter instalado em seu ambiente de desenvolvimento. Após clonar o repositório, execute os seguintes comandos no diretório raiz do projeto:

flutter pub get para instalar as dependências.
flutter run para executar o aplicativo em um dispositivo conectado ou emulador.

<h2>Contribuições</h2>
Contribuições são sempre bem-vindas! Para contribuir, por favor, crie um fork do repositório, faça suas alterações e submeta um Pull Request.

Licença
Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE.md para detalhes.
