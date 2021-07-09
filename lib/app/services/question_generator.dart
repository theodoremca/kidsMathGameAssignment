
import 'dart:convert';
import 'dart:math';
import 'package:function_tree/function_tree.dart';
import 'package:unit7_mobile_dev/app/services/question_model.dart';

class QuestionGenerator {
  int randomValueBetween ({min,max}){
    final _random = new Random();
    return min + _random.nextInt(max - min);
  }

  int randomValue (){
    return randomValueBetween(min:1,max:13);
  }

  additionQuestion(){
      int _firstNumber = randomValue();
      int _secondNumber = randomValue();
      String _generated = _firstNumber.toString() + " + " + _secondNumber.toString();
      int _answer = _generated.interpret().round();
      List _options = options(answer: _answer,range: 24);
      Map<String,dynamic> _question = {
        "firstValue":_firstNumber,
        "secondValue":_secondNumber,
        "operation":"+",
        "question":_generated,
        "answer":_answer,
        "options":_options
      };
      return _question;
  }
  multiplicationQuestion(){
    int _firstNumber = randomValue();
    int _secondNumber = randomValue();
    String _generated = _firstNumber.toString() + " * " + _secondNumber.toString();
    int _answer = _generated.interpret().round();
    List _options = options(answer: _answer,range: 144);
    Map<String,dynamic> _question = {
      "firstValue":_firstNumber,
      "secondValue":_secondNumber,
      "operation":"*",
      "question":_generated,
      "answer":_answer,
      "options":_options
    };
    return _question;
  }

  subtractionQuestion(){
    int _firstNumber = randomValue();
    int _secondNumber =randomValueBetween(min: 0,max: _firstNumber);
    String _generated = _firstNumber.toString() + " - " + _secondNumber.toString();
    int _answer = _generated.interpret().round();
    List _options = options(answer: _answer,range: 11);
    Map<String,dynamic> _question = {
      "firstValue":_firstNumber,
      "secondValue":_secondNumber,
      "operation":"-",
      "question":_generated,
      "answer":_answer,
      "options":_options
    };
    return _question;
  }
  divisionQuestion(){
    List tmp = [1];
    int num = randomValueBetween(min:2,max:13);
    for( int i = 2 ; i <= num ; ++i ) {
      if(num % i == 0){
        tmp.add(i);
      }
    }
    var second = tmp[randomValueBetween(min:0,max:tmp.length-1)];
    String _generated = num.toString() +  " / " + second.toString();
    int _answer = _generated.interpret().round();
    List _options = options(answer: _answer,range: 12);
    Map<String,dynamic> _question = {
      "firstValue":num,
      "secondValue":second,
      "operation":"/",
      "question":_generated,
      "answer":_answer,
      "options":_options
    };
    return _question;
  }

  List<dynamic> options ({answer,range}){
    _generateOption({answer,randomMax}){
      final _random = new Random();
      int _option;
      _option = _random.nextInt(randomMax);
      return answer == _option ? _generateOption(answer: answer,randomMax: randomMax):_option;
    }
    List shuffle(List items) {
      var random = new Random();

      // Go through all elements.
      for (var i = items.length - 1; i > 0; i--) {

        // Pick a pseudorandom number according to the list length
        var n = random.nextInt(i + 1);

        var temp = items[i];
        items[i] = items[n];
        items[n] = temp;
      }

      return items;
    }
    List _options = [answer,_generateOption(answer:answer , randomMax: range),_generateOption(answer: answer,randomMax: range)];
    return shuffle(_options);
  }

  QuestionModel randomQuestion (){
    final _random = new Random();
    int x=_random.nextInt(4);
    if(x==0){
      final _question = additionQuestion();
      QuestionModel question = QuestionModel.fromJson(_question);
      return question;
    }
    if(x==1){
      final _question = subtractionQuestion();
      QuestionModel question = QuestionModel.fromJson(_question);
      return question;
    }
    if(x==2){
      final _question = multiplicationQuestion();
      QuestionModel question = QuestionModel.fromJson(_question);
      return question;
    }
    final _question = divisionQuestion();
    QuestionModel question = QuestionModel.fromJson(_question);
    return question;
  }



}