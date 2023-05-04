class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffleAnswers() {
    //create a copy of the List and store it in a variable
    final shuffledList = List.of(answers);
    //we call shuffle and changes the list in placed
    shuffledList.shuffle();
    //and then we return the updated shuffle List
    return shuffledList;
  }
}
