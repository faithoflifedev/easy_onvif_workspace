String? getEnvironmentVariable(String variableName, {String? defaultValue}) =>
    String.fromEnvironment(variableName, defaultValue: defaultValue ?? '');
