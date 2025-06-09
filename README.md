# 🍽️ Receitas App
Um aplicativo Flutter para descobrir e organizar receitas deliciosas usando a API TheMealDB.

## 🛠️ Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (versão 3.7.2 ou superior)
- [Dart SDK](https://dart.dev/get-dart) (incluído com Flutter)
- [Android Studio](https://developer.android.com/studio) ou [VS Code](https://code.visualstudio.com/)
- [Git](https://git-scm.com/)

### Para desenvolvimento Android:
- Android SDK
- Emulador Android ou dispositivo físico


## 📥 Instalação

### 1. Clone o repositório
```bash
git clone <url-do-repositorio>
cd receita_app
```

### 2. Instale as dependências
```bash
flutter pub get
```

### 3. Verifique se o Flutter está configurado corretamente
```bash
flutter doctor
```

### 4. Execute o aplicativo
```bash
# Para Android
flutter run


## 📦 Dependências

O projeto utiliza as seguintes dependências principais:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8      # Ícones do iOS
  http: ^1.4.0                 # Requisições HTTP para API
  shared_preferences: ^2.2.2   # Armazenamento local

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0        # Análise de código
```

## 🌐 API

O aplicativo utiliza a [TheMealDB API](https://www.themealdb.com/api.php) para obter dados das receitas:

- **Receitas**: `https://www.themealdb.com/api/json/v1/1/search.php?s=`
- **Categorias**: `https://www.themealdb.com/api/json/v1/1/categories.php`
- **Por Categoria**: `https://www.themealdb.com/api/json/v1/1/filter.php?c={categoria}`
- **Por ID**: `https://www.themealdb.com/api/json/v1/1/lookup.php?i={id}`

## 🔧 Comandos Úteis

### Limpar cache e dependências
```bash
flutter clean
flutter pub get
```

### Executar testes
```bash
flutter test
```

### Verificar problemas de código
```bash
flutter analyze
```

### Gerar APK para Android
```bash
flutter build apk --release
```


### Executar em dispositivo específico
```bash
# Listar dispositivos disponíveis
flutter devices

# Executar em dispositivo específico
flutter run -d <device-id>
```

## 🐛 Resolução de Problemas

### Problema: "Flutter doctor" mostra erros
**Solução**: Siga as instruções fornecidas pelo comando para instalar dependências em falta.

### Problema: Erro de rede ao buscar receitas
**Solução**: 
- Verifique sua conexão com a internet
- Certifique-se de que as permissões de internet estão configuradas
- Verifique se a API TheMealDB está funcionando

### Problema: App não carrega no Android
**Solução**:
```bash
flutter clean
cd android
./gradlew clean
cd ..
flutter pub get
flutter run
```


### Emulador Android
1. Abra o Android Studio
2. Vá para AVD Manager
3. Crie ou inicie um emulador
4. Execute `flutter run`


Este é um projeto de estudo/demonstração.