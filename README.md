# 🍽️ Meal App Bloc

Um aplicativo Flutter moderno para descobrir e explorar receitas culinárias de todo o mundo, construído com arquitetura BLoC e consumindo a API TheMealDB.

## 📱 Sobre o Projeto

O Meal App Bloc é um aplicativo de receitas que permite aos usuários:

- 🏠 Navegar por categorias de receitas
- 🔍 Buscar receitas por nome
- 📖 Ver detalhes completos de receitas incluindo ingredientes e instruções
- 🎥 Acessar vídeos tutoriais no YouTube
- 🌍 Explorar receitas de diferentes cozinhas do mundo

## ✨ Funcionalidades

### Home Screen
- Grid interativo de categorias com imagens
- Barra de pesquisa para filtrar categorias
- Cards animados com efeito Hero
- Estados de loading e erro

### Search Screen
- Campo de busca com foco automático
- Busca automática após 3 caracteres
- Resultados em lista com imagens e informações
- Estados visuais para vazio, loading e erro

### Recipe Details Screen
- SliverAppBar expansível com imagem da receita
- Chips informativos (categoria, região, tags)
- Lista completa de ingredientes com medidas
- Instruções de preparo detalhadas
- Link para vídeo tutorial

### Category Meals Screen
- Visualização de receitas por categoria
- Hero animation para transição suave

## 🏗️ Arquitetura

O projeto segue os princípios de **Clean Architecture** e utiliza o padrão **BLoC** (Business Logic Component) para gerenciamento de estado.

```
lib/
├── main.dart
├── modules/
│   ├── home/
│   │   ├── models/
│   │   ├── home_bloc.dart
│   │   ├── home_repository.dart
│   │   ├── home_screen.dart
│   │   └── category_meals_screen.dart
│   ├── search/
│   │   ├── models/
│   │   ├── search_bloc.dart
│   │   ├── search_repository.dart
│   │   └── search_screen.dart
│   └── recipe/
│       ├── models/
│       ├── recipe_bloc.dart
│       ├── recipe_repository.dart
│       └── recipe_screen.dart
└── shared/
    └── core/
        ├── client/
        ├── constants/
        ├── di/
        └── routing/
```

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework UI
- **flutter_bloc**: Gerenciamento de estado
- **dio**: Cliente HTTP para requisições
- **get_it**: Injeção de dependências
- **go_router**: Navegação e rotas
- **freezed**: Code generation para modelos imutáveis
- **json_serializable**: Serialização JSON

## 📦 Dependências Principais

```yaml
dependencies:
  flutter_bloc: ^9.1.1
  dio: ^5.9.0
  get_it: ^9.0.5
  go_router: ^16.3.0
  freezed_annotation: ^2.4.1
  json_annotation: ^4.9.0

dev_dependencies:
  build_runner: ^2.4.6
  freezed: ^2.4.5
  json_serializable: ^6.7.1
```

## 🚀 Como Executar

### Pré-requisitos

- Flutter SDK (>=3.9.2)
- Dart SDK
- Android Studio / VS Code
- Emulador ou dispositivo físico

### Instalação

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/meal_app_bloc.git
cd meal_app_bloc
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Execute o code generation (se necessário):
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Execute o aplicativo:
```bash
flutter run
```

## 🌐 API

O aplicativo utiliza a [TheMealDB API](https://www.themealdb.com/api.php) - uma API gratuita de banco de dados de receitas.

### Endpoints utilizados:

- `GET /categories.php` - Lista todas as categorias
- `GET /search.php?s={query}` - Busca receitas por nome
- `GET /lookup.php?i={id}` - Detalhes de uma receita específica
- `GET /filter.php?c={category}` - Filtra receitas por categoria

## 🎨 Design Pattern

### BLoC Pattern

O projeto implementa o padrão BLoC para separação de lógica de negócio da interface:

```dart
// Eventos
abstract class HomeEvent {}
class HomeInitialFetch extends HomeEvent {}

// Estados
abstract class HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final CategoryModel category;
  HomeLoaded(this.category);
}
class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

// BLoC
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  // ...
}
```

### Dependency Injection

Utiliza GetIt para injeção de dependências:

```dart
final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => ClientApi(getIt()).setup());
  getIt.registerLazySingleton(() => HomeRepository(getIt()));
  // ...
}
```

## 📱 Screenshots

_Em breve - adicione screenshots do seu aplicativo aqui_

## 🧪 Testes

```bash
# Executar todos os testes
flutter test

# Executar testes com coverage
flutter test --coverage
```

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📝 Melhorias Futuras

- [ ] Adicionar favoritos com persistência local
- [ ] Implementar filtros avançados
- [ ] Cache de imagens
- [ ] Modo offline
- [ ] Compartilhamento de receitas
- [ ] Testes unitários e de widget
- [ ] Internacionalização (i18n)
- [ ] Dark mode
- [ ] Animações mais elaboradas

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👨‍💻 Autor

Desenvolvido com ❤️ por [Seu Nome]

---

⭐ Se este projeto foi útil para você, considere dar uma estrela!

## 🔗 Links Úteis

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [TheMealDB API](https://www.themealdb.com/api.php)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
