import 'package:flutter/material.dart';

void main() {
  runApp(const AzureQuizApp());
}

class AzureQuizApp extends StatelessWidget {
  const AzureQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Azure Data Fundamentals Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const QuizPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

// Add as many questions as you like here.
final List<QuizQuestion> questions = [
  QuizQuestion(
    question:
        "What is the primary purpose of Azure Synapse Analytics?",
    options: [
      "Storing unstructured data",
      "Big data analytics and data warehousing",
      "Hosting web applications",
      "Machine learning model training"
    ],
    correctIndex: 1,
    explanation:
        "Azure Synapse Analytics is designed for big data analytics and data warehousing, enabling the analysis of large volumes of data.",
  ),
  QuizQuestion(
    question:
        "Which Azure service provides globally distributed, multi-model database capabilities?",
    options: [
      "Azure SQL Database",
      "Azure Synapse Analytics",
      "Azure Blob Storage",
      "Azure Cosmos DB"
    ],
    correctIndex: 3,
    explanation:
        "Azure Cosmos DB is a globally distributed, multi-model database service that supports NoSQL options and provides low-latency access.",
  ),
  QuizQuestion(
    question:
        "Which of the following is a characteristic of non-relational data?",
    options: [
      "Organized in tables with rows and columns",
      "Schema is flexible and can handle varying data structures",
      "Supports only structured data",
      "Requires SQL for querying"
    ],
    correctIndex: 1,
    explanation:
        "Non-relational data stores often have a flexible schema, allowing for varying data structures, unlike relational databases.",
  ),
  QuizQuestion(
    question:
        "What is the main function of Azure Data Lake Storage?",
    options: [
      "Hosting virtual machines",
      "Storing large amounts of structured and unstructured data",
      "Managing identities",
      "Sending email notifications"
    ],
    correctIndex: 1,
    explanation:
        "Azure Data Lake Storage is optimized for storing and analyzing large amounts of structured and unstructured data.",
  ),
  QuizQuestion(
    question:
        "Which service would you use for fully managed relational databases in Azure?",
    options: [
      "Azure Blob Storage",
      "Azure SQL Database",
      "Azure Data Lake Storage",
      "Azure Cosmos DB"
    ],
    correctIndex: 1,
    explanation:
        "Azure SQL Database is a fully managed relational database service provided by Microsoft Azure.",
  ),
  QuizQuestion(
    question:
        "Which service is best suited for storing files, images, and videos in Azure?",
    options: [
      "Azure SQL Database",
      "Azure Synapse Analytics",
      "Azure Blob Storage",
      "Azure Table Storage"
    ],
    correctIndex: 2,
    explanation:
        "Azure Blob Storage specializes in storing large amounts of unstructured data such as files, images, and videos.",
  ),
  QuizQuestion(
    question:
        "What is the benefit of using Azure Data Factory?",
    options: [
      "To build websites",
      "To orchestrate and automate data movement and transformation",
      "To manage virtual machines",
      "To monitor network traffic"
    ],
    correctIndex: 1,
    explanation:
        "Azure Data Factory is a cloud-based data integration service that allows you to orchestrate and automate data movement and transformation.",
  ),
  QuizQuestion(
    question:
        "Which Azure service is primarily used for real-time analytics on streaming data?",
    options: [
      "Azure Stream Analytics",
      "Azure Data Lake Storage",
      "Azure SQL Database",
      "Azure Machine Learning"
    ],
    correctIndex: 0,
    explanation:
        "Azure Stream Analytics is designed for real-time analytics on fast-moving streaming data.",
  ),
  QuizQuestion(
    question:
        "What does ETL stand for in data processing?",
    options: [
      "Extract, Transform, Load",
      "Execute, Transfer, Learn",
      "Encrypt, Transfer, List",
      "Evaluate, Transform, Load"
    ],
    correctIndex: 0,
    explanation:
        "ETL stands for Extract, Transform, Load, which are the three steps used to prepare data for analysis.",
  ),
  QuizQuestion(
    question:
        "What is a data warehouse?",
    options: [
      "A system for storing logs",
      "A central repository for integrated data from multiple sources",
      "A tool for designing databases",
      "A service for managing APIs"
    ],
    correctIndex: 1,
    explanation:
        "A data warehouse is a central repository for integrated data from multiple sources, optimized for analytics and reporting.",
  ),
];

// Quiz Page
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int? selectedOption;
  List<int?> userAnswers = List<int?>.filled(questions.length, null);
  bool showExplanation = false;

  void nextQuestion() {
    setState(() {
      if (currentIndex < questions.length - 1) {
        currentIndex++;
        selectedOption = userAnswers[currentIndex];
        showExplanation = false;
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReviewPage(
                      userAnswers: userAnswers,
                    )));
      }
    });
  }

  void previousQuestion() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        selectedOption = userAnswers[currentIndex];
        showExplanation = false;
      }
    });
  }

  void selectOption(int idx) {
    setState(() {
      selectedOption = idx;
      userAnswers[currentIndex] = idx;
      showExplanation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];
    bool answered = userAnswers[currentIndex] != null;
    bool isLast = currentIndex == questions.length - 1;
    bool isFirst = currentIndex == 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Azure Data Fundamentals Quiz'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Question ${currentIndex + 1} of ${questions.length}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              question.question,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16),
            ...question.options.asMap().entries.map((entry) {
              int idx = entry.key;
              String opt = entry.value;
              bool selected = selectedOption == idx;

              Color? tileColor;
              if (showExplanation) {
                if (idx == question.correctIndex) {
                  tileColor = Colors.green[200];
                } else if (selected) {
                  tileColor = Colors.red[200];
                }
              }

              return Card(
                color: tileColor,
                child: ListTile(
                  title: Text(opt),
                  leading: Radio<int>(
                    value: idx,
                    groupValue: selectedOption,
                    onChanged: (answered && showExplanation)
                        ? null
                        : (int? value) {
                            selectOption(idx);
                          },
                  ),
                  onTap: (answered && showExplanation)
                      ? null
                      : () {
                          selectOption(idx);
                        },
                ),
              );
            }),
            if (showExplanation)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  selectedOption == question.correctIndex
                      ? "Correct! ${question.explanation}"
                      : "Incorrect. ${question.explanation}",
                  style: const TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w500),
                ),
              ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!isFirst)
                  ElevatedButton(
                    onPressed: previousQuestion,
                    child: const Text('Previous'),
                  ),
                ElevatedButton(
                  onPressed: answered ? nextQuestion : null,
                  child: Text(isLast ? 'Finish' : 'Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Review Page
class ReviewPage extends StatelessWidget {
  final List<int?> userAnswers;
  const ReviewPage({super.key, required this.userAnswers});

  @override
  Widget build(BuildContext context) {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctIndex) {
        score++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Answers"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Your Score: $score / ${questions.length}',
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 12),
          ...questions.asMap().entries.map((entry) {
            int idx = entry.key;
            QuizQuestion q = entry.value;
            int? userAns = userAnswers[idx];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Q${idx + 1}: ${q.question}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Your answer: ${userAns != null ? q.options[userAns] : "No answer"}",
                      style: TextStyle(
                          color: userAns == q.correctIndex
                              ? Colors.green
                              : Colors.red),
                    ),
                    Text(
                      "Correct answer: ${q.options[q.correctIndex]}",
                      style: const TextStyle(color: Colors.green),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      q.explanation,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Retake Quiz'),
            ),
          )
        ],
      ),
    );
  }
}
