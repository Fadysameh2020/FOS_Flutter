class EmailValidator {
  static bool isEmailValid(String email) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    return emailRegex.hasMatch(email);
  }
}

bool isValidUrl(String text) {
  final RegExp urlRegExp = RegExp(
    r'^(https?:\/\/)?' // Optional scheme (http or https)
    r'(([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,})' // Domain name
    r'(:\d+)?' // Optional port
    r'(\/[-a-zA-Z0-9@:%._\+~#=]*)*' // Optional path
    r'(\?[;&a-zA-Z0-9%_.,~+=-]*)?' // Optional query parameters
    r'(\#[-a-zA-Z0-9_]*)?$', // Optional fragment
    caseSensitive: false,
    multiLine: false,
  );

  return urlRegExp.hasMatch(text);
}
