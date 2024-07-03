abstract class Operations {
  String symbol;
  String firstnum;
  String secondnum;

  Operations(this.symbol, this.firstnum, this.secondnum);

  String performOperation();
}

class AddOperation extends Operations {
  AddOperation(String firstnum, String secondnum)
      : super("+", firstnum, secondnum);

  @override
  String performOperation() {
    return (double.parse(firstnum) + double.parse(secondnum)).toString();
  }
}

class MinusOperation extends Operations {
  MinusOperation(String firstnum, String secondnum)
      : super("-", firstnum, secondnum);

  @override
  String performOperation() {
    return (double.parse(firstnum) - double.parse(secondnum)).toString();
  }
}

class multiply extends Operations {
  multiply(String firstnum, String secondnum) : super("-", firstnum, secondnum);

  @override
  String performOperation() {
    return (double.parse(firstnum) * double.parse(secondnum)).toString();
  }
}

class divide extends Operations {
  divide(String firstnum, String secondnum) : super("-", firstnum, secondnum);

  @override
  String performOperation() {
    return (double.parse(firstnum) / double.parse(secondnum)).toString();
  }
}

class module extends Operations {
  module(String firstnum, String secondnum) : super("-", firstnum, secondnum);

  @override
  String performOperation() {
    return (double.parse(firstnum) % double.parse(secondnum)).toString();
  }
}

class StringExtractor {
  List<String> symbols = ['+', 'x', '/', '-', '%'];
  final String fullString;
  List<String> stack = [];

  Operations? op;

  StringExtractor({required this.fullString});

  void extractString() {
    String temp = "";
    for (int i = 0; i < fullString.length; i++) {
      if (symbols.contains(fullString[i])) {
        stack.add(temp);
        stack.add(fullString[i]);
        temp = "";
      } else {
        temp += fullString[i];
      }
    }
    stack.add(temp); // Add the last number
  }

  String calculateOperation() {
    String firstnum = "";

    while (stack.isNotEmpty) {
      if (firstnum.isEmpty) {
        firstnum = stack.first;
        stack.removeAt(0);
      }
      if (stack.isEmpty) break; // Ensure there is a symbol
      String symbol = stack.first;
      stack.removeAt(0);
      if (stack.isEmpty) break; // Ensure there is a second number
      String secondnum = stack.first;
      stack.removeAt(0);
      try {
        switch (symbol) {
          case '+':
            op = AddOperation(firstnum, secondnum);

            break;

          case '-':
            op = MinusOperation(firstnum, secondnum);

            break;

          case 'x':
            op = multiply(firstnum, secondnum);

            break;

          case '/':
            op = divide(firstnum, secondnum);

          case '%':
            op = module(firstnum, secondnum);
        }
      } catch (ex) {
        return "error : $ex";
      }

      firstnum = op?.performOperation() ?? "";
    }

    return firstnum;
  }
}
