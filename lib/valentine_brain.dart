class CalculatorBrain {
  final String firstName;
  final String secondName;
  double lovePercentage = 0;

  CalculatorBrain({this.firstName, this.secondName});

  String calculateLove() {
    String a = firstName;
    String b = secondName;

    int sum1 = 0;
    int sum2 = 0;
    for (int i = 0; i < a.length; i++) {
      int temp = a.toLowerCase().codeUnitAt(i);
      int ascii = temp;
      sum1 = sum1 + ascii;
    }
    for (int m = 0; m < b.length; m++) {
      int temp = b.toLowerCase().codeUnitAt(m);
      int ascii = temp;
      sum2 = sum2 + ascii;
    }
    int total = sum1 + sum2;
    lovePercentage = ((total) / 2) % 100;
    print(lovePercentage.toStringAsFixed(0).toString());
    return lovePercentage.toStringAsFixed(0).toString();
  }

  String shortMessage() {
    String shortMessage;
    if (lovePercentage < 20) {
      shortMessage = 'ohh  😟 ';
    } else if (lovePercentage < 30) {
      shortMessage = 'hope 🙂';
    } else if (lovePercentage < 40) {
      shortMessage = 'Dream 😇';
    } else if (lovePercentage < 50) {
      shortMessage = 'Believe 💝';
    } else if (lovePercentage < 60) {
      shortMessage = 'Strong 😘' ;
    } else if (lovePercentage < 70) {
      shortMessage = 'lovely 😊';
    } else if (lovePercentage < 80) {
      shortMessage = 'beautiful 🥰';
    } else if (lovePercentage < 90) {
      shortMessage = 'Wow 🤗';
    } else if (lovePercentage <=100) {
      shortMessage = 'Amazing 😍';
    }

    return shortMessage;
  }

  String bigMessage() {
    String bigMessage;
    if (lovePercentage < 10) {
      bigMessage = 'Not made for each other.';
    } else if (lovePercentage < 20) {
      bigMessage = 'You need to rethink Dear.';}
    else if (lovePercentage < 30) {
      bigMessage = 'Give Yourself Time .';
    } else if (lovePercentage < 40) {
      bigMessage = 'Fight for the fairy tale it does Exist.';

    }
    else if (lovePercentage < 50) {
      bigMessage = 'Start Up With Freindship.';
    } else if (lovePercentage < 60) {
      bigMessage = 'Never give up on someone you love.';
    } else if (lovePercentage < 70) {
      bigMessage = 'Have Faith On Your Love.';
    } else if (lovePercentage < 80) {
      bigMessage = 'Keep Loving Each Other.';
    } else if (lovePercentage < 90) {
      bigMessage = 'LOVE Is Difficult but it is REAL.';
    } else if (lovePercentage <= 100) {
      bigMessage = 'Love Conquers All.';
    }

    return bigMessage;
  }

  void reset() {}
}
