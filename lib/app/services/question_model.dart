class QuestionModel {
  final String question;
  final String firstValue;
  final String secondValue;
  final String operation;
  final String answer;
  final List options;

  QuestionModel(this.question, this.answer, this.firstValue, this.options, this.operation,
      this.secondValue);

  QuestionModel.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        firstValue = json['firstValue'].toString(),
        secondValue = json['secondValue'].toString(),
        operation = json['operation'],
        answer = json['answer'].toString(),
        options = json['options'];

  Map<String, dynamic> toJson() => {
        'question': question,
        'operation': operation,
        'firstValue': firstValue,
        'secondValue': secondValue,
        'answer': answer,
        'options': options,
      };
}
