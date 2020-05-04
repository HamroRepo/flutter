int next;

class Option1 {
  int next = 0;
  List<String> option1 = [
    'Mt.Everest',
    'Armstrong',
    'Rome',
    'Eikoku',
    'Greece',
    'Superman',
    'Theseus',
    'Unicorn',
    'Football',
    'Barcelona',
    'AC Milan',
    '100M yrs ago',
    'Platezioc era',
    'Tyrannosaurus Rex',
    'Brown Bear',
    'Nicolas Cage',
    '1990',
    'Vitamin A',
  ];

  void changeOpt1() {
    if (next < option1.length - 1) {
      next++;
    }
  }

  String getOption1() {
    return option1[next];
  }

  void reset() {
    next = 0;
  }
}

class Option2 {
  int next = 0;
  List<String> option2 = [
    'K2',
    'Gagarin',
    'Italy',
    'Beikoku',
    'Vinland',
    'Batman',
    'Perseus',
    'Pegasus',
    'Sumo Wrestling',
    'Liverpool',
    'Bayern Munich',
    '65M yrs ago',
    'Mesozoic era',
    'Spinosaurus',
    'African Lion',
    'Jhonny Depp',
    '1995',
    'Vitamin K',
  ];

  void changeOpt2() {
    if (next < option2.length - 1) {
      next++;
    }
  }

  String getOption2() {
    return option2[next];
  }

  void reset() {
    next = 0;
  }
}

class Option3 {
  int next = 0;
  List<String> option3 = [
    ' Annapurna',
    'Prachanda',
    'Greece',
    'Nippon',
    'Iceland',
    'Spiderman',
    ' Hercules',
    'Minotaur',
    'Swimming',
    'Real Madrid',
    'Real Madrid',
    '20M yrs ago',
    'Cenozoic era',
    'Argentinosaurus',
    'Polar Bear',
    'Jeremy Renner',
    '2000',
    'Vitamin C'
  ];

  void changeOpt3() {
    if (next < option3.length - 1) {
      next++;
    }
  }

  String getOption3() {
    return option3[next];
  }

  void reset() {
    next = 0;
  }
}

class Option4 {
  int next = 0;

  List<String> option4 = [
    'Dhaulagiri',
    'Trump',
    ' Britian',
    'Kankoku',
    'Switzerland',
    ' Micki Mouse',
    'Prometheus',
    'Griffin',
    'Sword Play',
    'AC Milan',
    'Liverpool',
    '200M yrs ago',
    'Paleozoic era',
    'Titanoceratops',
    'Siberean Tiger',
    'Will Smith',
    ' 1998',
    'Vitamin D'
  ];

  void changeOpt4() {
    if (next < option4.length - 1) {
      next++;
    }
  }

  String getOption4() {
    return option4[next];
  }

  void reset() {
    next = 0;
  }
}
