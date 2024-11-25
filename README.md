# **Projeto: Lista de Usuários**

## **Descrição**
Aplicação Flutter para exibir uma lista de usuários consumindo uma API REST. Funcionalidades principais:
1. **Listar usuários:** Nome, e-mail e avatar.
2. **Exibir detalhes:** Ao clicar em um item, mostra informações detalhadas.
3. **Atualização:** Atualiza os dados com Pull-to-Refresh.

## **Estrutura do Projeto**
Baseado na **Clean Architecture**, o projeto é dividido em:
- **Domain:** Regras de negócio, entidades e casos de uso.
- **Data:** Implementa repositórios e interage com fontes de dados.
- **Presentation:** Interface do usuário e gerenciamento de estado.

Essa estrutura melhora a separação de responsabilidades, facilita a testabilidade e permite a evolução do código.

## **Principais Tecnologias**
1. **Dio:** Comunicação com API REST. Escolhido pela flexibilidade e suporte a interceptores.
2. **GetX:** Gerenciamento de estado, navegação e injeção de dependência. Escolhido pela simplicidade e integração completa.
3. **Dartz:** Usado para o padrão `Either`, separando sucesso e falha no fluxo de dados.
4. **Flutter Test:** Utilizado para testes unitários e de integração.

## **Testes**
Foram implementados testes unitários para as camadas **Domain** e **Data**, garantindo:
- Funcionamento correto dos casos de uso.
- Validação da interação entre repositórios e datasources.
- Tratamento de erros e exceções.


Com **Clean Architecture** e ferramentas modernas como **Dio**, **GetX** e **Dartz**, o projeto combina modularidade, robustez e escalabilidade.
