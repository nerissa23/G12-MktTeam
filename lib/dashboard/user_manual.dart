import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/src/widgets/scrollable.dart';

class UserManual extends StatefulWidget {
  const UserManual({Key? key}) : super(key: key);

  @override
  _UserManualState createState() => _UserManualState();
}

class _UserManualState extends State<UserManual> {
  late ScrollController _scrollController;

  // Define global keys for each section to identify them
  final Map<String, GlobalKey> _sectionKeys = {
    'Introduction': GlobalKey(),
    'Getting Started': GlobalKey(),
    'Features': GlobalKey(),
    'Troubleshooting': GlobalKey(),
    'Best Practices': GlobalKey(),
    'Glossary': GlobalKey(),
    'FAQ': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    final key = _sectionKeys[section];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Manual'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ManualIndex(scrollToSection: _scrollToSection),
          ),
          Expanded(
            flex: 3,
            child: ManualContent(
              scrollController: _scrollController,
              sectionKeys: _sectionKeys,
            ),
          ),
        ],
      ),
    );
  }
}

class ManualIndex extends StatelessWidget {
  final Function(String) scrollToSection;

  ManualIndex({required this.scrollToSection});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Introduction'),
          onTap: () => scrollToSection('Introduction'),
        ),
        ListTile(
          title: Text('Getting Started'),
          onTap: () => scrollToSection('Getting Started'),
        ),
        ListTile(
          title: Text('Features'),
          onTap: () => scrollToSection('Features'),
        ),
        ListTile(
          title: Text('Troubleshooting'),
          onTap: () => scrollToSection('Troubleshooting'),
        ),
        ListTile(
          title: Text('Best Practices'),
          onTap: () => scrollToSection('Best Practices'),
        ),
        ListTile(
          title: Text('Glossary'),
          onTap: () => scrollToSection('Glossary'),
        ),
        ListTile(
          title: Text('FAQ'),
          onTap: () => scrollToSection('FAQ'),
        ),
      ],
    );
  }
}

class ManualContent extends StatelessWidget {
  final ScrollController scrollController;
  final Map<String, GlobalKey> sectionKeys;

  const ManualContent({
    required this.scrollController,
    required this.sectionKeys,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Introduction(key: sectionKeys['Introduction']),
          GettingStarted(key: sectionKeys['Getting Started']),
          Features(key: sectionKeys['Features']),
          Troubleshooting(key: sectionKeys['Troubleshooting']),
          BestPractices(key: sectionKeys['Best Practices']),
          Glossary(key: sectionKeys['Glossary']),
          FAQ(key: sectionKeys['FAQ']),
        ],
      ),
    );
  }
}

// Definitions of each section, utilizing GlobalKeys for scroll identification
class Introduction extends StatelessWidget {
  final GlobalKey? key;

  Introduction({this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Introduction',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Meet RajaMark, your reliable helper to automate the grading of multiple-choice question (MCQ) answer sheets. '
            'By leveraging Tesseract OCR for handwritten text recognition and OpenCV for image preprocessing, RajaMark can '
            'swiftly and accurately interpret handwritten answers (A-E) beside question numbers. This automation eliminates the '
            'tedious and error-prone manual grading process, making it ideal for educational institutions seeking a more efficient '
            'grading solution. ',
            style: TextStyle(fontSize: 14),
          ),
           const SizedBox(height: 10),
          Text(
            'In addition to grading, RajaMark offers tools to compile class results, allowing educators to '
            'aggregate individual scores and generate comprehensive reports on class performance in quizzes and tests. This '
            'feature helps teachers quickly identify trends and areas for improvement, streamlining the assessment process. '
            'Overall, RajaMark is a valuable resource for schools and universities aiming to improve the speed and accuracy of '
            'MCQ evaluation while reducing the workload on educators. ',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class GettingStarted extends StatelessWidget {
  final GlobalKey? key;
  final TextStyle _textStyle1 = TextStyle(fontSize: 18);
  final TextStyle _textStyle2 = TextStyle(fontSize: 14);


  GettingStarted({this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Getting Started',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Operating System Requirements',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            'RajaMark requires (either one):',
            style: _textStyle2,
          ),
          const SizedBox(height: 10),
          Text(
            '- the 64-bit version of Microsoft Windows 10 or later. These versions of Windows should include the required Windows PowerShell 5 or later.',
            style: _textStyle2,
          ),
          const SizedBox(height: 10),
          Text(
            '- macOS 10.15 (Catalina) or later. This guide presumes your Mac runs the zsh as your default shell.',
            style: _textStyle2,
          ),
          const SizedBox(height: 10),
          Text(
            '- Debian Linux 11 or later and Ubuntu Linux 20.04 LTS or later.',
            style: _textStyle2,
          ),
          const SizedBox(height: 10),
          Text(
            '- ChromeOS.',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
          Text(
            'Installation Steps',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            'To install RajaMark:',
            style: _textStyle2,
          ),
          const SizedBox(height: 10),
          Text(
            '1. Click here to access our Google Drive.',
            style: _textStyle2,
          ),const SizedBox(height: 10),
          Text(
            '2. Download the .exe file.',
            style: _textStyle2,
          ),const SizedBox(height: 10),
          Text(
            '3. Click the .exe file and allow it to make changes to your computer for execution.',
            style: _textStyle2,
          ),const SizedBox(height: 10),
          Text(
            '4. You are all set.',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
          Text(
            'Account Setup',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            'RajaMark requires macOS Monterey (macOS 12) or later, Windows 10 or later or Linux.',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
          Text(
            'Navigation',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            'RajaMark requires macOS Monterey (macOS 12) or later, Windows 10 or later or Linux.',
            style: _textStyle2,
          ),
        ],
      ),
    );
  }
}

class Features extends StatelessWidget {
  final GlobalKey? key;

  Features({this.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle1 = TextStyle(fontSize: 18);
    final TextStyle _textStyle2 = TextStyle(fontSize: 14);

    return Container(
      key: key,
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Features',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Exam Creation',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            'RajaMark requires macOS Monterey (macOS 12) or later, Windows 10 or later or Linux.',
            style: _textStyle2,
          )
        ],
      ),
    );
  }
}

class Troubleshooting extends StatelessWidget {
  final GlobalKey? key;

  Troubleshooting({this.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle1 = TextStyle(fontSize: 18);
    final TextStyle _textStyle2 = TextStyle(fontSize: 14);

    return Container(
      key: key,
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Troubleshooting',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Common Issues',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. Poor Image Quality: OCR accuracy may decrease if the input images are of low resolution or contain artifacts such as blurriness or distortion.',
                style: _textStyle2,
              ),
              Text(
                '2. Unsupported Fonts: Certain fonts or styles may not be recognized accurately by the OCR system, leading to errors in text extraction.',
                style: _textStyle2,
              ),
              Text(
                '3. Complex Layouts: Documents with complex layouts, such as tables, columns, or mixed fonts, can pose challenges for OCR algorithms and result in incorrect text extraction.',
                style: _textStyle2,
              ),
              Text(
                '4. Handwritten Text: OCR systems are primarily designed for printed text and may struggle to accurately recognize handwritten text.',
                style: _textStyle2,
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          Text(
            'Solutions',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. Improve Image Quality: Ensure that input images are clear, well-lit, and have sufficient resolution. Avoid using images with excessive noise or compression artifacts.',
                style: _textStyle2,
              ),
              Text(
                '2. Use Supported Fonts: Whenever possible, use standard fonts and avoid decorative or obscure fonts that may not be recognized reliably by the OCR system.',
                style: _textStyle2,
              ),
              Text(
                '3. Simplify Layouts: If possible, preprocess documents to remove complex layouts or convert them into simpler formats before performing OCR. This can help improve accuracy and reduce errors.',
                style: _textStyle2,
              ),
              Text(
                '4. Consider Handwriting Recognition: For handwritten text, consider using specialized OCR models or handwriting recognition software that are optimized for recognizing handwritten characters.',
                style: _textStyle2,
              ),
            ],
          ),

          const SizedBox(height: 20),
          Text(
            'Support Contact',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'If you encounter any issues with the OCR system that cannot be resolved using the provided solutions, please contact our support team for assistance:',
                style: _textStyle2,
              ),
              Text(
                'Email: rajamarkmarketing@gmail.com',
                style: _textStyle2,
              ),
              Text(
                'Phone: +1 (555) 123-4567',
                style: _textStyle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BestPractices extends StatelessWidget {
  final GlobalKey? key;

  BestPractices({this.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle1 = TextStyle(fontSize: 18);
    final TextStyle _textStyle2 = TextStyle(fontSize: 14);

    return Container(
      key: key,
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Best Practices',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Grading Tips',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            'RajaMark requires macOS Monterey (macOS 12) or later, Windows 10 or later or Linux.',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
          Text(
            'Accuracy Recommendations',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            'RajaMark requires macOS Monterey (macOS 12) or later, Windows 10 or later or Linux.',
            style: _textStyle2,
          ),
        ],
      ),
    );
  }
}

class Glossary extends StatelessWidget {
  final GlobalKey? key;

  Glossary({this.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle1 = TextStyle(fontSize: 18);
    final TextStyle _textStyle2 = TextStyle(fontSize: 14);

    return Container(
      key: key,
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Glossary',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            width: 800,
            child: Table(
            border: TableBorder.all(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FlexColumnWidth(0.3),
            },
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Term'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Definition'),
                    ),
                  ),
                ],
              ),

              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Optical Character Recognition (OCR)'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('The technology used to convert different types of documents, '
                      'such as scanned paper documents, PDF files, or images captured by a digital camera, into editable and '
                      'searchable data.')
                    ),
                  ),
                ],
              ),

              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Resolution'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('The level of detail that an image holds. In the context of scanning, it measures the '
                      'number of pixels per inch (PPI) or dots per inch (DPI) in a digital image.')
                    ),
                  ),
                ],
              ),

              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Layout'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('The arrangement of text, images, and other elements on a document or webpage.')
                    ),
                  ),
                ],
              ),

              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Handwriting Recognition'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('The process of converting handwritten text into digital text. It involves analyzing '
                      'and interpreting handwritten characters to recognize and convert them into machine-readable text.')
                    ),
                  ),
                ],
              ),

              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Calibration'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('The process of adjusting and fine-tuning equipment or software to ensure accuracy and '
                      'consistency in performance. In the context of scanning, calibration may involve adjusting settings '
                      'such as brightness, contrast, and color balance to optimize image quality.')
                    ),
                  ),
                ],
              ),

              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Standardized Format'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('A predefined layout or structure that follows specific guidelines or conventions. '
                      'In the context of answer sheets, a standardized format ensures consistency in the presentation of '
                      'questions and answers, facilitating accurate interpretation and grading.')
                    ),
                  ),
                ],
              ),

              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Alignment'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('The positioning of text or objects relative to a reference point or line. In the '
                      'context of OCR, alignment ensures that text is accurately detected and interpreted within '
                      'predefined boundaries or regions.')
                    ),
                  ),
                ],
              ),

              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Noise'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Random variations or interference in an image that can degrade quality and affect '
                      'OCR accuracy.')
                    ),
                  ),
                ],
              ),

              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Preprocessing'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('The process of applying various techniques to raw data, such as images or text, to '
                      'improve quality, enhance features, or prepare it for further analysis.')
                    ),
                  ),
                ],
              ),
            ],
          ),
          )
        ],
      ),
    );
  }
}

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
  final GlobalKey? key;
  FAQ({this.key});

}

class _FAQState extends State<FAQ> {
  final List<FAQItem> _faqs = [
    FAQItem(
      question: '1. Which platforms are RajaMark compatible with?', 
      answer: 'RajaMark is designed to be compatible with multiple operating systems, which are Windows, '
      'macOS, Linux, Android and iOS.'),
    FAQItem(
      question: '2. How does RajaMark automate answer sheet grading?', 
      answer: 'RajaMark assumes the adherence of the answer sheets uploaded to a standardized format and '
      'layout, and conducts recognition of students’ handwriting with OCR technology to compare the answers with '
      'the sample provided.'),
    FAQItem(
      question: '3. What format should the answer sheets uploaded be in?', 
      answer: 'The answer sheets (PNG) should have the answers consistently written next to the corresponding '
      'question numbers in a predetermined manner and written in Capital Letters (e.g., letters A-E)'),
    FAQItem(
      question: '4. How does RajaMark ensure its accuracy in text recognition to compare uploaded answer sheets with '
      'the sample answers?', 
      answer: 'While we try our best to produce the most accurate text recognition results using OCR technology, it '
      'is inevitable to face minor inaccuracies in detecting the handwritten answers. Hence, we highly advise users '
      'to conduct a thorough checking of the graded answers and make the necessary corrections on the Student Answer Page.'),
    FAQItem(
      question: '5. Can I modify the grading system for a subject?', 
      answer: 'Yes! After the user has created a subject under the Exam Details page, a default grade will be automatically '
      'set for the subject and users can click “Edit” to amend the existing grading system.'),
  ];

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle1 = TextStyle(fontSize: 18);
    final TextStyle _textStyle2 = TextStyle(fontSize: 14);

    return Container(
      width: 900,
      padding: EdgeInsets.only(top: 0.0, right: 24.0, bottom: 28.0, left: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          for (int i=0; i<_faqs.length; i++)
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              collapsedTitleBackgroundColor: const Color.fromARGB(255, 162, 180, 212),
              expandedTitleBackgroundColor: const Color.fromARGB(255, 111, 143, 199),
              title: _faqs[i].question,
              content: _faqs[i].answer,
            ),
        ],
      ),
    );
  }
}

class FAQItem {
  String question;
  String answer;
  bool isExpanded;

  FAQItem({required this.question, required this.answer, this.isExpanded = false});
}

// Definitions for other sections...

// import 'package:flutter/material.dart';
// import 'package:getwidget/getwidget.dart';

// class UserManual extends StatelessWidget {
//   const UserManual({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const ManualContent();
//   }
// }

// class ManualContent extends StatelessWidget {
//   const ManualContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Introduction(),
//             GettingStarted(),
//             Features(),
//             Troubleshooting(),
//             BestPractices(),
//             Glossary(),
//             FAQ(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Introduction extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle _textStyle = TextStyle(fontSize: 14);

//     return Container(
//       padding: EdgeInsets.all(24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Introduction',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'Meet RajaMark, your reliable helper to automate the grading of multiple-choice question (MCQ) answer sheets. '
//             'By leveraging Tesseract OCR for handwritten text recognition and OpenCV for image preprocessing, RajaMark can '
//             'swiftly and accurately interpret handwritten answers (A-E) beside question numbers. This automation eliminates the '
//             'tedious and error-prone manual grading process, making it ideal for educational institutions seeking a more efficient '
//             'grading solution. ',
//             style: _textStyle,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'In addition to grading, RajaMark offers tools to compile class results, allowing educators to '
//             'aggregate individual scores and generate comprehensive reports on class performance in quizzes and tests. This '
//             'feature helps teachers quickly identify trends and areas for improvement, streamlining the assessment process. '
//             'Overall, RajaMark is a valuable resource for schools and universities aiming to improve the speed and accuracy of '
//             'MCQ evaluation while reducing the workload on educators. ',
//             style: _textStyle,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class GettingStarted extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle _textStyle1 = TextStyle(fontSize: 18);
//     final TextStyle _textStyle2 = TextStyle(fontSize: 14);

//     return Container(
//       padding: EdgeInsets.only(top: 0.0, right: 24.0, bottom: 28.0, left: 24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Getting Started',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'Operating System Requirements',
//             style: _textStyle1,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'RajaMark requires (either one):',
//             style: _textStyle2,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             '- the 64-bit version of Microsoft Windows 10 or later. These versions of Windows should include the required Windows PowerShell 5 or later.',
//             style: _textStyle2,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             '- macOS 10.15 (Catalina) or later. This guide presumes your Mac runs the zsh as your default shell.',
//             style: _textStyle2,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             '- Debian Linux 11 or later and Ubuntu Linux 20.04 LTS or later.',
//             style: _textStyle2,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             '- ChromeOS.',
//             style: _textStyle2,
//           ),
//           const SizedBox(height: 20),
//           Text(
//             'Installation Steps',
//             style: _textStyle1,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'To install RajaMark:',
//             style: _textStyle2,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             '1. Click here to access our Google Drive.',
//             style: _textStyle2,
//           ),const SizedBox(height: 10),
//           Text(
//             '2. Download the .exe file.',
//             style: _textStyle2,
//           ),const SizedBox(height: 10),
//           Text(
//             '3. Click the .exe file and allow it to make changes to your computer for execution.',
//             style: _textStyle2,
//           ),const SizedBox(height: 10),
//           Text(
//             '4. You are all set.',
//             style: _textStyle2,
//           ),
//           const SizedBox(height: 20),
//           Text(
//             'Account Setup',
//             style: _textStyle1,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'RajaMark requires macOS Monterey (macOS 12) or later, Windows 10 or later or Linux.',
//             style: _textStyle2,
//           ),
//           const SizedBox(height: 20),
//           Text(
//             'Navigation',
//             style: _textStyle1,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'RajaMark requires macOS Monterey (macOS 12) or later, Windows 10 or later or Linux.',
//             style: _textStyle2,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Features extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle _textStyle1 = TextStyle(fontSize: 18);
//     final TextStyle _textStyle2 = TextStyle(fontSize: 14);

//     return Container(
//       padding: EdgeInsets.only(top: 0.0, right: 24.0, bottom: 28.0, left: 24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Features',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'Exam Creation',
//             style: _textStyle1,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'RajaMark requires macOS Monterey (macOS 12) or later, Windows 10 or later or Linux.',
//             style: _textStyle2,
//           )
//         ],
//       ),
//     );
//   }
// }

// class Troubleshooting extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle _textStyle1 = TextStyle(fontSize: 18);
//     final TextStyle _textStyle2 = TextStyle(fontSize: 14);

//     return Container(
//       padding: EdgeInsets.only(top: 0.0, right: 24.0, bottom: 28.0, left: 24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Troubleshooting',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'Common Issues',
//             style: _textStyle1,
//           ),
//           const SizedBox(height: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '1. Poor Image Quality: OCR accuracy may decrease if the input images are of low resolution or contain artifacts such as blurriness or distortion.',
//                 style: _textStyle2,
//               ),
//               Text(
//                 '2. Unsupported Fonts: Certain fonts or styles may not be recognized accurately by the OCR system, leading to errors in text extraction.',
//                 style: _textStyle2,
//               ),
//               Text(
//                 '3. Complex Layouts: Documents with complex layouts, such as tables, columns, or mixed fonts, can pose challenges for OCR algorithms and result in incorrect text extraction.',
//                 style: _textStyle2,
//               ),
//               Text(
//                 '4. Handwritten Text: OCR systems are primarily designed for printed text and may struggle to accurately recognize handwritten text.',
//                 style: _textStyle2,
//               ),
//             ],
//           ),
          
//           const SizedBox(height: 20),
//           Text(
//             'Solutions',
//             style: _textStyle1,
//           ),
//           const SizedBox(height: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '1. Improve Image Quality: Ensure that input images are clear, well-lit, and have sufficient resolution. Avoid using images with excessive noise or compression artifacts.',
//                 style: _textStyle2,
//               ),
//               Text(
//                 '2. Use Supported Fonts: Whenever possible, use standard fonts and avoid decorative or obscure fonts that may not be recognized reliably by the OCR system.',
//                 style: _textStyle2,
//               ),
//               Text(
//                 '3. Simplify Layouts: If possible, preprocess documents to remove complex layouts or convert them into simpler formats before performing OCR. This can help improve accuracy and reduce errors.',
//                 style: _textStyle2,
//               ),
//               Text(
//                 '4. Consider Handwriting Recognition: For handwritten text, consider using specialized OCR models or handwriting recognition software that are optimized for recognizing handwritten characters.',
//                 style: _textStyle2,
//               ),
//             ],
//           ),

//           const SizedBox(height: 20),
//           Text(
//             'Support Contact',
//             style: _textStyle1,
//           ),
//           const SizedBox(height: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'If you encounter any issues with the OCR system that cannot be resolved using the provided solutions, please contact our support team for assistance:',
//                 style: _textStyle2,
//               ),
//               Text(
//                 'Email: rajamarkmarketing@gmail.com',
//                 style: _textStyle2,
//               ),
//               Text(
//                 'Phone: +1 (555) 123-4567',
//                 style: _textStyle2,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BestPractices extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle _textStyle1 = TextStyle(fontSize: 18);
//     final TextStyle _textStyle2 = TextStyle(fontSize: 14);

//     return Container(
//       padding: EdgeInsets.only(top: 0.0, right: 24.0, bottom: 28.0, left: 24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Best Practices',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'Grading Tips',
//             style: _textStyle1,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'RajaMark requires macOS Monterey (macOS 12) or later, Windows 10 or later or Linux.',
//             style: _textStyle2,
//           ),
//           const SizedBox(height: 20),
//           Text(
//             'Accuracy Recommendations',
//             style: _textStyle1,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'RajaMark requires macOS Monterey (macOS 12) or later, Windows 10 or later or Linux.',
//             style: _textStyle2,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Glossary extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle _textStyle1 = TextStyle(fontSize: 18);
//     final TextStyle _textStyle2 = TextStyle(fontSize: 14);

//     return Container(
//       padding: EdgeInsets.only(top: 0.0, right: 24.0, bottom: 28.0, left: 24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Glossary',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 20),
//           Container(
//             width: 800,
//             child: Table(
//             border: TableBorder.all(),
//             defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//             columnWidths: {
//               0: FlexColumnWidth(0.3),
//             },
//             children: [
//               TableRow(
//                 children: [
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Term'),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Definition'),
//                     ),
//                   ),
//                 ],
//               ),

//               TableRow(
//                 children: [
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Optical Character Recognition (OCR)'),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('The technology used to convert different types of documents, '
//                       'such as scanned paper documents, PDF files, or images captured by a digital camera, into editable and '
//                       'searchable data.')
//                     ),
//                   ),
//                 ],
//               ),

//               TableRow(
//                 children: [
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Resolution'),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('The level of detail that an image holds. In the context of scanning, it measures the '
//                       'number of pixels per inch (PPI) or dots per inch (DPI) in a digital image.')
//                     ),
//                   ),
//                 ],
//               ),

//               TableRow(
//                 children: [
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Layout'),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('The arrangement of text, images, and other elements on a document or webpage.')
//                     ),
//                   ),
//                 ],
//               ),

//               TableRow(
//                 children: [
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Handwriting Recognition'),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('The process of converting handwritten text into digital text. It involves analyzing '
//                       'and interpreting handwritten characters to recognize and convert them into machine-readable text.')
//                     ),
//                   ),
//                 ],
//               ),

//               TableRow(
//                 children: [
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Calibration'),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('The process of adjusting and fine-tuning equipment or software to ensure accuracy and '
//                       'consistency in performance. In the context of scanning, calibration may involve adjusting settings '
//                       'such as brightness, contrast, and color balance to optimize image quality.')
//                     ),
//                   ),
//                 ],
//               ),

//               TableRow(
//                 children: [
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Standardized Format'),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('A predefined layout or structure that follows specific guidelines or conventions. '
//                       'In the context of answer sheets, a standardized format ensures consistency in the presentation of '
//                       'questions and answers, facilitating accurate interpretation and grading.')
//                     ),
//                   ),
//                 ],
//               ),

//               TableRow(
//                 children: [
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Alignment'),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('The positioning of text or objects relative to a reference point or line. In the '
//                       'context of OCR, alignment ensures that text is accurately detected and interpreted within '
//                       'predefined boundaries or regions.')
//                     ),
//                   ),
//                 ],
//               ),

//               TableRow(
//                 children: [
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Noise'),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Random variations or interference in an image that can degrade quality and affect '
//                       'OCR accuracy.')
//                     ),
//                   ),
//                 ],
//               ),

//               TableRow(
//                 children: [
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Preprocessing'),
//                     ),
//                   ),
//                   TableCell(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('The process of applying various techniques to raw data, such as images or text, to '
//                       'improve quality, enhance features, or prepare it for further analysis.')
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class FAQ extends StatefulWidget {
//   @override
//   _FAQState createState() => _FAQState();
// }

// class _FAQState extends State<FAQ> {
//   final List<FAQItem> _faqs = [
//     FAQItem(
//       question: '1. Which platforms are RajaMark compatible with?', 
//       answer: 'RajaMark is designed to be compatible with multiple operating systems, which are Windows, '
//       'macOS, Linux, Android and iOS.'),
//     FAQItem(
//       question: '2. How does RajaMark automate answer sheet grading?', 
//       answer: 'RajaMark assumes the adherence of the answer sheets uploaded to a standardized format and '
//       'layout, and conducts recognition of students’ handwriting with OCR technology to compare the answers with '
//       'the sample provided.'),
//     FAQItem(
//       question: '3. What format should the answer sheets uploaded be in?', 
//       answer: 'The answer sheets (PNG) should have the answers consistently written next to the corresponding '
//       'question numbers in a predetermined manner and written in Capital Letters (e.g., letters A-E)'),
//     FAQItem(
//       question: '4. How does RajaMark ensure its accuracy in text recognition to compare uploaded answer sheets with '
//       'the sample answers?', 
//       answer: 'While we try our best to produce the most accurate text recognition results using OCR technology, it '
//       'is inevitable to face minor inaccuracies in detecting the handwritten answers. Hence, we highly advise users '
//       'to conduct a thorough checking of the graded answers and make the necessary corrections on the Student Answer Page.'),
//     FAQItem(
//       question: '5. Can I modify the grading system for a subject?', 
//       answer: 'Yes! After the user has created a subject under the Exam Details page, a default grade will be automatically '
//       'set for the subject and users can click “Edit” to amend the existing grading system.'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final TextStyle _textStyle1 = TextStyle(fontSize: 18);
//     final TextStyle _textStyle2 = TextStyle(fontSize: 14);

//     return Container(
//       width: 900,
//       padding: EdgeInsets.only(top: 0.0, right: 24.0, bottom: 28.0, left: 24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           const Text(
//             'Frequently Asked Questions',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),

//           for (int i=0; i<_faqs.length; i++)
//             GFAccordion(
//               collapsedIcon: Icon(Icons.add),
//               expandedIcon: Icon(Icons.minimize),
//               collapsedTitleBackgroundColor: const Color.fromARGB(255, 162, 180, 212),
//               expandedTitleBackgroundColor: const Color.fromARGB(255, 111, 143, 199),
//               title: _faqs[i].question,
//               content: _faqs[i].answer,
//             ),
//         ],
//       ),
//     );
//   }
// }

// class FAQItem {
//   String question;
//   String answer;
//   bool isExpanded;

//   FAQItem({required this.question, required this.answer, this.isExpanded = false});
// }