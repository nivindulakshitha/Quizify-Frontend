import 'package:flutter/material.dart';
import 'package:quizify/widgets/create_quiz_widget.dart'; // Import the create_quiz_widget

class CreateQuizScreen extends StatefulWidget {
  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  int _numberOfQuestions = 15;
  int _quizDuration = 5;
  String _selectedQuizType = 'Open quiz';
  bool _isPrivateQuiz = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Quiz'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdownMenu(),
              SizedBox(height: 16),
              if (_isPrivateQuiz) _buildEditableTextBox(context, 'Quiz Password:', '123456'),
              SizedBox(height: 16),
              _buildEditableTextBox(context, 'Quiz Name', 'XYZ Quiz 1'),
              SizedBox(height: 16),
              _buildNumberSelector(
                context,
                'Number of Questions',
                _numberOfQuestions,
                onIncrement: () {
                  setState(() {
                    _numberOfQuestions++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    if (_numberOfQuestions > 1) {
                      _numberOfQuestions--;
                    }
                  });
                },
              ),
              SizedBox(height: 16),
              _buildNumberSelector(
                context,
                'Quiz Duration (Minutes)',
                _quizDuration,
                onIncrement: () {
                  setState(() {
                    _quizDuration++;
                  });
                },
                onDecrement: () {
                  setState(() {
                    if (_quizDuration > 1) {
                      _quizDuration--;
                    }
                  });
                },
              ),
              SizedBox(height: 16),
              _buildCreateQuizButton(context, 'Create Quiz'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownMenu() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select quiz type',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          DropdownButton<String>(
            value: _selectedQuizType,
            isExpanded: true,
            items: <String>['Open quiz', 'Private quiz'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedQuizType = newValue!;
                _isPrivateQuiz = _selectedQuizType == 'Private quiz';
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEditableTextBox(BuildContext context, String label, String initialValue) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: initialValue,
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 18),
            ),
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberSelector(
      BuildContext context, String label, int value,
      {required VoidCallback onIncrement, required VoidCallback onDecrement}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              Text(
                value.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: onDecrement,
              ),
              IconButton(
                icon: Icon(Icons.arrow_drop_up),
                onPressed: onIncrement,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCreateQuizButton(BuildContext context, String text) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _navigateToFirstQuestion(context);
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  void _navigateToFirstQuestion(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateQuizWidget(
          questionNumber: 1,
          totalQuestions: _numberOfQuestions,
        ),
      ),
    );
  }
}
