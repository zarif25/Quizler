class Quiz {
  late final List<Question> questionList;
  Quiz({required this.questionList});

  List<Question> getQuestionList() {
    questionList.shuffle();
    return questionList;
  }
}

class Question {
  late final String questionText;
  late final String correct;

  /// the first option has to be the correct answer
  late final List<String> options;

  Question({required this.questionText, required this.options}) {
    correct = options[0];
  }

  List<String> getOptions() {
    options.shuffle();
    return options;
  }

  
}

void main(List<String> args) {
  var q = Quiz(
    questionList: [
      Question(questionText: "aboltabol?", options: ["a", "b", "c", "d"]),
      Question(questionText: "habijabi?", options: ["a", "b", "c", "d"]),
    ],
  );
}
