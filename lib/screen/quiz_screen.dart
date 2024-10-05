import 'package:flutter/material.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, Object>> _allQuestions = [
    {
      'question': 'What is the capital city of Pangasinan?',
      'answers': ['A) Lingayen', 'B) Dagupan', 'C) Alaminos', 'D) Urdaneta'],
      'correctAnswer': 0
    },
    {
      'question':
          'Which famous beach in Pangasinan is known for its Hundred Islands National Park?',
      'answers': ['A) Alaminos', 'B) Lingayen', 'C) Bolinao', 'D) Dasol'],
      'correctAnswer': 0
    },
    {
      'question': 'What is the dominant language spoken in Pangasinan?',
      'answers': ['A) Pangasinense', 'B) Ilocano', 'C) Tagalog', 'D) Cebuano'],
      'correctAnswer': 0
    },
    {
      'question':
          'Which Pangasinan city is known for its bangus (milkfish) festival?',
      'answers': ['A) Lingayen', 'B) Alaminos', 'C) Dagupan', 'D) San Carlos'],
      'correctAnswer': 2
    },
    {
      'question': 'Which body of water borders Pangasinan to the west?',
      'answers': [
        'A) South China Sea',
        'B) Pacific Ocean',
        'C) Laguna de Bay',
        'D) Taal Lake'
      ],
      'correctAnswer': 0
    },
    {
      'question': 'What is the main agricultural product of Pangasinan?',
      'answers': ['A) Rice', 'B) Corn', 'C) Bananas', 'D) Sugarcane'],
      'correctAnswer': 0
    },
    {
      'question': 'Who is the patron saint of the capital city, Lingayen?',
      'answers': [
        'A) St. John the Evangelist',
        'B) St. Peter',
        'C) St. Dominic',
        'D) St. Anne'
      ],
      'correctAnswer': 0
    },
    {
      'question':
          'Which church in Pangasinan is a popular pilgrimage site, known for its healing masses?',
      'answers': [
        'A) Manaoag Church',
        'B) Lingayen Cathedral',
        'C) Dagupan Cathedral',
        'D) San Carlos Church'
      ],
      'correctAnswer': 0
    },
    {
      'question':
          'What is the historical significance of the Lingayen Gulf in World War II?',
      'answers': [
        'A) Landing site for American forces',
        'B) Japanese surrender site',
        'C) Location of a major battle',
        'D) Allied forces base'
      ],
      'correctAnswer': 0
    },
    {
      'question':
          'Which Pangasinan town is known for its white sandy beaches and Cape Bolinao Lighthouse?',
      'answers': ['A) Bolinao', 'B) San Fabian', 'C) Anda', 'D) Alaminos'],
      'correctAnswer': 0
    },
    {
      'question':
          'Which Pangasinan city is known as the “Milkfish Capital of the Philippines”?',
      'answers': ['A) Dagupan', 'B) Urdaneta', 'C) Alaminos', 'D) Lingayen'],
      'correctAnswer': 0
    },
    {
      'question':
          'Which island is a famous pilgrimage site during Holy Week in Pangasinan?',
      'answers': [
        'A) Romulo Island',
        'B) Pilgrimage Island',
        'C) Tondol Island',
        'D) Anda Island'
      ],
      'correctAnswer': 1
    },
    {
      'question':
          'Which popular waterfall can be found in Bolinao, Pangasinan?',
      'answers': [
        'A) Tambobong Falls',
        'B) Pantal Falls',
        'C) Bolinao Falls',
        'D) Lucap Falls'
      ],
      'correctAnswer': 2
    },
    {
      'question': 'What is the major religion practiced in Pangasinan?',
      'answers': [
        'A) Roman Catholicism',
        'B) Protestantism',
        'C) Islam',
        'D) Buddhism'
      ],
      'correctAnswer': 0
    },
    {
      'question':
          'Which mountain range lies in the northern part of Pangasinan?',
      'answers': [
        'A) Cordillera',
        'B) Sierra Madre',
        'C) Caraballo',
        'D) Zambales Range'
      ],
      'correctAnswer': 3
    },
    {
      'question':
          'What is the nickname of the municipality of Mangatarem in Pangasinan?',
      'answers': [
        'A) “Forest Capital of Pangasinan”',
        'B) “Bangus Capital”',
        'C) “City of Gold”',
        'D) “Gateway to the West”'
      ],
      'correctAnswer': 0
    },
    {
      'question': 'Which famous river is found in Pangasinan?',
      'answers': [
        'A) Pantal River',
        'B) Pasig River',
        'C) Cagayan River',
        'D) Agno River'
      ],
      'correctAnswer': 3
    },
    {
      'question': 'In which year did Pangasinan become a province?',
      'answers': ['A) 1572', 'B) 1660', 'C) 1901', 'D) 1946'],
      'correctAnswer': 0
    },
    {
      'question': 'What is the local term for rice cakes made in Pangasinan?',
      'answers': ['A) Patupat', 'B) Bibingka', 'C) Tupig', 'D) Kutsinta'],
      'correctAnswer': 2
    },
    {
      'question': 'Which Pangasinan city is home to the scenic Tondol Beach?',
      'answers': ['A) Anda', 'B) Alaminos', 'C) San Fabian', 'D) Bolinao'],
      'correctAnswer': 0
    },
  ];

  List<Map<String, Object>> _selectedQuestions = [];
  int _score = 0;
  int _questionIndex = 0;

  @override
  void initState() {
    super.initState();
    _allQuestions.shuffle();
    _selectedQuestions = _getRandomQuestions();
  }

  List<Map<String, Object>> _getRandomQuestions() {
    return _allQuestions.sublist(0, 10);
  }

  void _answerQuestion(int answerIndex) {
    if (answerIndex == _selectedQuestions[_questionIndex]['correctAnswer']) {
      _score++;
    }

    setState(() {
      _questionIndex++;
      if (_questionIndex >= _selectedQuestions.length) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              score: _score,
              totalQuestions: _selectedQuestions.length,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _questionIndex < _selectedQuestions.length
          ? Padding(
              padding: const EdgeInsets.only(
                top: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      _selectedQuestions[_questionIndex]['question'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  ...(_selectedQuestions[_questionIndex]['answers']
                          as List<String>)
                      .map((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 10.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          right: 10,
                          left: 10,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                          ),
                          onPressed: () => _answerQuestion(
                            (_selectedQuestions[_questionIndex]['answers']
                                    as List<String>)
                                .indexOf(answer),
                          ),
                          child: Align(
                            alignment:
                                Alignment.centerLeft, // Align text to the left
                            child: Text(
                              answer,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
