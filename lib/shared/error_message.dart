class ErrorMessage {
  String auth(String message) {
    switch (message) {
      case 'Given String is empty or null':
        return 'Entire form can\'t be empty';
      default:
        return message;
    }
  }
}
