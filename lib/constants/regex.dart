final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

final maxAndMinSymbolsRegex = RegExp(r'^.{8,64}$');

final atLeastOneUppercaseRegex = RegExp(r'^(?=.*[A-Z]).*$');

final atLeastOnNumberRegex = RegExp(r'^(?=.*\d).*$');
