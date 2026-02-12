import '../models/mock_interview_model.dart';

class MockInterviewData {
  static final List<MockInterviewQuestion> questions = [
    // HR Questions - Easy
    MockInterviewQuestion(
      id: 'hr_1',
      text: 'Tell me about yourself.',
      category: 'HR',
      difficulty: 'Easy',
      suggestedDurationSeconds: 60,
    ),
    MockInterviewQuestion(
      id: 'hr_2',
      text: 'Why do you want to work for our company?',
      category: 'HR',
      difficulty: 'Easy',
      suggestedDurationSeconds: 60,
    ),
    MockInterviewQuestion(
      id: 'hr_3',
      text: 'What are your strengths and weaknesses?',
      category: 'HR',
      difficulty: 'Easy',
      suggestedDurationSeconds: 90,
    ),

    // HR Questions - Medium
    MockInterviewQuestion(
      id: 'hr_4',
      text: 'Where do you see yourself in five years?',
      category: 'HR',
      difficulty: 'Medium',
      suggestedDurationSeconds: 90,
    ),
    MockInterviewQuestion(
      id: 'hr_5',
      text: 'How do you handle pressure and stress?',
      category: 'HR',
      difficulty: 'Medium',
      suggestedDurationSeconds: 120,
    ),

    // HR Questions - Hard
    MockInterviewQuestion(
      id: 'hr_6',
      text: 'Why should we hire you over other candidates?',
      category: 'HR',
      difficulty: 'Hard',
      suggestedDurationSeconds: 120,
    ),

    // Technical Questions - Easy
    MockInterviewQuestion(
      id: 'tech_1',
      text: 'What is the difference between a class and an object?',
      category: 'Technical',
      difficulty: 'Easy',
      suggestedDurationSeconds: 60,
    ),
    MockInterviewQuestion(
      id: 'tech_2',
      text: 'Explain the concept of inheritance in OOP.',
      category: 'Technical',
      difficulty: 'Easy',
      suggestedDurationSeconds: 90,
    ),

    // Technical Questions - Medium
    MockInterviewQuestion(
      id: 'tech_3',
      text: 'What is a REST API and how does it work?',
      category: 'Technical',
      difficulty: 'Medium',
      suggestedDurationSeconds: 120,
    ),
    MockInterviewQuestion(
      id: 'tech_4',
      text: 'Explain the difference between SQL and NoSQL databases.',
      category: 'Technical',
      difficulty: 'Medium',
      suggestedDurationSeconds: 120,
    ),

    // Technical Questions - Hard
    MockInterviewQuestion(
      id: 'tech_5',
      text: 'How does garbage collection work in modern programming languages?',
      category: 'Technical',
      difficulty: 'Hard',
      suggestedDurationSeconds: 180,
    ),
    MockInterviewQuestion(
      id: 'tech_6',
      text:
          'Explain the CAP theorem and its implications in distributed systems.',
      category: 'Technical',
      difficulty: 'Hard',
      suggestedDurationSeconds: 180,
    ),

    // Behavioral Questions - Easy
    MockInterviewQuestion(
      id: 'beh_1',
      text: 'Tell me about a time you worked in a team.',
      category: 'Behavioral',
      difficulty: 'Easy',
      suggestedDurationSeconds: 90,
    ),

    // Behavioral Questions - Medium
    MockInterviewQuestion(
      id: 'beh_2',
      text:
          'Describe a situation where you had to deal with a difficult colleague.',
      category: 'Behavioral',
      difficulty: 'Medium',
      suggestedDurationSeconds: 120,
    ),
    MockInterviewQuestion(
      id: 'beh_3',
      text: 'Give an example of a goal you reached and how you achieved it.',
      category: 'Behavioral',
      difficulty: 'Medium',
      suggestedDurationSeconds: 120,
    ),

    // Behavioral Questions - Hard
    MockInterviewQuestion(
      id: 'beh_4',
      text: 'Tell me about a time you failed and how you handled it.',
      category: 'Behavioral',
      difficulty: 'Hard',
      suggestedDurationSeconds: 150,
    ),
    MockInterviewQuestion(
      id: 'beh_5',
      text: 'Describe a complex problem you solved. What was your approach?',
      category: 'Behavioral',
      difficulty: 'Hard',
      suggestedDurationSeconds: 180,
    ),
  ];

  static List<MockInterviewQuestion> getQuestionsByCategoryAndDifficulty(
    String category,
    String difficulty,
  ) {
    return questions
        .where((q) => q.category == category && q.difficulty == difficulty)
        .toList();
  }
}
