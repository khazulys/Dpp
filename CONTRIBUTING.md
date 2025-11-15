# Contributing to DPP Store

Thank you for considering contributing to DPP Store!

## Development Setup

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/yourusername/dpp-store.git
   cd dpp-store
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Code Style

### Dart/Flutter Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter analyze` to check for issues
- Format code with `dart format .`
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions small and focused

### File Naming

- Use snake_case for file names: `product_detail_page.dart`
- Use PascalCase for class names: `ProductDetailPage`
- Use camelCase for variables: `productName`

### Widget Structure

```dart
class MyWidget extends ConsumerWidget {
  // 1. Constructor
  const MyWidget({super.key});

  // 2. Build method
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ...
  }
  
  // 3. Helper methods (if any)
  void _handleAction() {
    // ...
  }
}
```

## Commit Messages

Use conventional commits format:

- `feat:` for new features
- `fix:` for bug fixes
- `docs:` for documentation
- `style:` for formatting changes
- `refactor:` for code refactoring
- `test:` for adding tests
- `chore:` for maintenance tasks

Examples:
```
feat: add product filtering by price range
fix: resolve cart total calculation error
docs: update README with setup instructions
```

## Pull Request Process

1. Ensure your code follows the style guide
2. Update documentation if needed
3. Add tests for new features (if applicable)
4. Run `flutter analyze` and fix any issues
5. Run `flutter test` and ensure all tests pass
6. Create a Pull Request with a clear description
7. Link any related issues

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
How to test the changes

## Screenshots (if UI changes)
Add screenshots here

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No new warnings
```

## Branch Naming

- Feature: `feature/add-payment-gateway`
- Bug fix: `fix/cart-total-calculation`
- Documentation: `docs/update-readme`
- Hotfix: `hotfix/critical-crash`

## Testing

### Run Tests
```bash
flutter test
```

### Run Widget Tests
```bash
flutter test test/widget_test.dart
```

### Integration Tests
```bash
flutter drive --target=test_driver/app.dart
```

## Documentation

- Update README.md for major changes
- Add inline comments for complex logic
- Update CHANGELOG.md for notable changes
- Update API documentation if backend changes

## Questions?

Feel free to open an issue for:
- Bug reports
- Feature requests
- Questions about the codebase
- Suggestions for improvements

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Help others learn
- Focus on the code, not the person

Thank you for contributing! 🎉
