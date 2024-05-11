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
          
          // Account Setup
          const SizedBox(height: 20),
          Text(
            'Account Setup', 
            style: _textStyle1,
          ),

          // Register
          const SizedBox(height: 15),
          Text(
            'i. Register',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            '\t\t1. Upon first launch into the system, you will be asked to enter your email and password to log into your existing account in the Login page.',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'images/reg1.png', 
          ),
           Text(
            '\n\t\t2. If you have not set up an account before, click the “Don’t have an account? Register here” button. If you have already registered an account, go to Login.',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'images/reg2.png', 
          ),
           Text(
            '\n\t\t3. You will be asked to give your email and password that you intend to use. Upon completing the registration, you will have to enter your password once again for confirmation.',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'images/reg3.png', 
          ),
           Text(
            '\n\t\t4. Click the “Register” button once you have filled up the required information for registration.',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
           Text(
            '\t\t5. You will be redirected to the Login if you have registered successfully.',
            style: _textStyle2,
          ),
          
          //Login
          const SizedBox(height: 15),
          Text(
            'ii. Login',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            '\t\t1. In the Login page, fill in your email or username and password then click on the “Log in” button.',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'images/login1.png', 
            height:400,
          ),
           Text(
            '\n\t\t2. If you have forgotten your password and wish to create a new one, proceed to Forget Password.',
            style: _textStyle2,
          ),
          
          // Forget Password
          const SizedBox(height: 15),
          Text(
            'iii. Forget Password',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            '\t\t1. Click on the “Forgot Password?” button.',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'images/reg2.png', 
          ),
           Text(
            '\n\t\t2. Enter your registered email address to receive a password reset link to change your password.',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'images/forgetpass2.png', 
            height:400,
          ),
           Text(
            '\n\t\t3. You will be shown with this message if you have entered a valid email address.',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'images/forgetpass3.png', 
            height:400,
          ),

          //LogOut
          const SizedBox(height: 15),
          Text(
            'iv. Logout',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            '\t\t1. After successfully logged in, you will now see the Homepage (dashboard page) like the picture below:',
            style: _textStyle2,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'images/homepage.png', 
            width:700,
          ),
           Text(
            '\n\t\t2. If you wish to log out, navigate to the navigation bar located at the leftmost of the screen and click on the “LogOut” button. You will then be redirected to the Login page again.',
            style: _textStyle2,
          ),

          const SizedBox(height: 20),
          Text(
            'Navigation',
            style: _textStyle1,
          ),
          Image.asset(
            'images/nav.png', 
            width:700,
          ),
          const SizedBox(height: 10),
          Text(
            '1.\t\tExam Page\n\nThe Exam Page contains all exams that have been created. The exams can be edited or deleted from this table. The date of creation will also be displayed on this page. It is also possible to create a new exam from this page.\n\n'
            '2.\t\tAccount Page\n\nThe Account Page will display the user’s information. Users will also be able to check and manage their account subscription on this page.\n\n'
            '3.\t\tUser Manual Page\n\nThe User Manual Page contains the documentation of the user manual that provides detailed instructions on how to use this system effectively.\n\n'
            '4.\t\tLogout\n\nNavigate to the navigation bar located at the leftmost of the screen and click on the “LogOut” button if you wish to log out from your account.',
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
    final TextStyle textStyle1 = TextStyle(fontSize: 18);
    final TextStyle textStyle2 = TextStyle(fontSize: 14);

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
          SizedBox(height: 20),
          Text(
            'Exam Creation',
            style: textStyle1,
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              _buildStepWithImage(
                  '1. Go to the exam management page.',
                  ''),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '2. Click on the “Create” button to create a new examination/quiz.',
                  'EC1.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '3. Enter the examination’s details and grading’s criteria.',
                  'EC2.png'),
              _buildStepWithImage(
                  '4. Scroll down to enter the answer scheme.',
                  'EC3.png'),
              _buildStepWithImage(
                  '5. Click the “save” button to create the examination record.',
                  ''),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '6. Exam Created.',
                  ''),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Edit Examination',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              _buildStepWithImage(
                  '1. Click on the “edit” icon on the specific exam.',
                  'EE1.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '2. Directed into the edit exam page, enter the changes required.',
                  'EE2.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '3. Scroll down and click the “save” button to apply the changes.',
                  ''),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Manage student’s answer',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              _buildStepWithImage(
                  '1. Click on the “eye” icon to view the exam’s details.',
                  'MSA1.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '2. Directed into the exam details page, click into the “eye” icon to view the student’s detail, “note” icon to edit the student’s details or “trash” icon to delete the student’s information.',
                  'MSA2.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '3. Student’s detail’s view page, click the “edit result” button to make changes to the student’s details.',
                  'MSA3'),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Upload Sample Answer',
            style: _textStyle1,
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              _buildStepWithImage(
                  '1. Click on the “eye” icon to view the exam’s details.',
                  'USAns1.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '2. Click on the “upload answer” button to upload the sample answer scheme.',
                  'USAns2.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '3. Directed into the answer scheme page, click the “+” icon to upload the sample answer scheme.',
                  'USAns3.png'),
              _buildStepWithImage(
                  '4. Upload the answer scheme file.',
                  'USAns4.png'),
              _buildStepWithImage(
                  '5. If you fail, try to upload another file of the answer scheme.',
                  'USAns5.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '6. Wait for the file to be processed.',
                  'USAns6.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '7. Click the “confirm” button to apply the answer scheme.',
                  'USAns8.png'),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Upload Student Answer',
            style: textStyle1,
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              _buildStepWithImage(
                  '1. Navigate to "Exams” and select the exam you wish to grade.',
                  'USA1.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '2. In the student column, locate and click the "Add" button to input student data.',
                  'USA2.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '3. Enter the student\'s ID and name into the designated fields.',
                  ''),
              _buildStepWithImage(
                  '4. Click the "Upload" button to update the student\'s answer sheet.',
                  'USA3.png'),
              _buildStepWithImage(
                  '5. To add the student\'s answer sheet, either drag a file or use the "Choose files" option to select the file from your computer.',
                  'USA4.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '6. After selecting a file, refer to Image Preprocessing for more details.',
                  'USA4.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '7. The student\'s details will be displayed on the page for confirmation.',
                  'USA5.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '8. Repeat steps 2 to 7 to add more students as necessary.',
                  ''),
              _buildStepWithImage(
                  '9. Once you have finished adding all students, click the "Save" button to save the student records.',
                  ''),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Image Preprocessing',
            style: textStyle1,
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              _buildStepWithImage(
                  '1. Once a file is selected for upload, the system will begin processing the image.',
                  'IP1.png'),
              SizedBox(height: 10),
              Text(
                '2. After successful processing, users are required to enter a file name for saving and the author\'s name. (In case of processing failure, refer to Troubleshooting for more info)',
                style: textStyle2,
              ),
              _buildStepWithImage(
                  '3.  Click on "Extract this file" to initiate OCR processing.',
                  'IP2.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '4. The system will commence extracting text from the image.',
                  'IP3.png'),
              SizedBox(height: 10),
              _buildStepWithImage(
                  '5. Upon successful extraction, the extracted text (answers) will be displayed.',
                  ''),
              Text(
                '6. If the extracted data is incorrect, users may request a reupload. Otherwise, proceed to Step 7 of Upload Student Answer if no issues arise.',
                style: textStyle2,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Score Calculation and Reporting',
            style: textStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            '1. Navigate to "Exam" and select the eye icon of the exam you wish to view.\n2. Upon uploading students\' answers, the system will automatically calculate the score for each student and calculate the mean and median score of the class. (Refer to Upload Student Answer to know more about uploading student’s answer)\n3. To generate a report, click on the "Generate Report" button. \n4. The report will include statistical measures such as the median, mean, and other relevant statistics.',
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget _buildStepWithImage(String text, String imageName) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
          if (imageName.isNotEmpty)
            Image.asset(
              'assets/images/$imageName', // Assuming the images are in the assets folder
              width: 500,
              height: 300,
              fit: BoxFit.contain,
            ),
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
                        child: Text('NO'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Issues'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Issue Description'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Solution'),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('1'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'Poor Image Quality')),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'OCR accuracy may decrease if the input images are of low resolution or contain artifacts such as blurriness or distortion.')),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'Ensure that input images are clear, well-lit, and have sufficient resolution. Avoid using images with excessive noise or compression artifacts.')),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('2'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'Unsupported Fonts')),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'Certain fonts or styles may not be recognized accurately by the OCR system, leading to errors in text extraction.')),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'Whenever possible, use standard fonts and avoid decorative or obscure fonts that may not be recognized reliably by the OCR system.')),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('3'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'Complex Layouts')),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'Documents with complex layouts, such as tables, columns, or mixed fonts, can pose challenges for OCR algorithms and result in incorrect text extraction.')),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'If possible, preprocess documents to remove complex layouts or convert them into simpler formats before performing OCR. This can help improve accuracy and reduce errors.')),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('4'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'Handwritten Text')),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'OCR systems are primarily designed for printed text and may struggle to accurately recognize handwritten text.')),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'For handwritten text, consider using specialized OCR models or handwriting recognition software that are optimized for recognizing handwritten characters.')),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Support Contact',
            style: _textStyle1,
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'If you encounter any issues with the OCR system that cannot be resolved using the provided solutions, please contact our support team for assistance:',
                style: _textStyle2,
              ),
              Text(
                "",
                style: _textStyle2,
              ),
              Text(
                'Email: spqprojectmanager@gmail.com',
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
    final List<BestPracticeItem> bestPractices = [
      BestPracticeItem(
        title: 'Grading Tips',
        items: [
          PracticeItem(
            description: '1. Ensure students format answers consistently and legibly to aid OCR accuracy.',
            imagePath: 'assets/images/tip1.png', 
          ),
          PracticeItem(
            description: '2. Advise clear separation of answers for each question to minimize ambiguity.',
            imagePath: 'assets/images/tip2.png', 
          ),
          PracticeItem(
            description: '3. Caution against overlapping answers to enhance OCR interpretation.',
            imagePath: 'assets/images/tip3.png', 
          ),
          PracticeItem(
            description: '4. Scan answers at high resolution in well-lit conditions for optimal recognition.',
          ),
          PracticeItem(
            description: '5. Encourage manual review of extracted text for clarity before submission.',
          ),
          PracticeItem(
            description: '6. Ensure students use dark, bold pens or pencils for writing to improve OCR readability.',
            imagePath: 'assets/images/tip4.png', 
          ),
          PracticeItem(
            description: '7. Remind students to avoid excessive use of decorative elements or symbols that may interfere with OCR recognition.',
            imagePath: 'assets/images/tip5.png', 
          ),
          PracticeItem(
            description: '8. Provide guidelines for students to write numbers and symbols clearly, especially those prone to misinterpretation.',
          ),
          PracticeItem(
            description: '9. Advise against folding or creasing answer sheets, as it can distort text and hinder OCR accuracy.',
          ),
          PracticeItem(
            description: '10. Recommend students to use a ruler or straight edge for neat alignment of answers to improve OCR alignment.',
            imagePath: 'assets/images/tip6.png', 
          ),
        ],
      ),
      BestPracticeItem(
        title: 'Accuracy Recommendations',
        items: [
          PracticeItem(
            description: '1. Provide clear handwriting guidelines to optimize OCR recognition; for example, require all multiple-choice answers to be in capital letters.',
          ),
          PracticeItem(
            description: '2. Conduct regular practice sessions to familiarize students with handwriting recognition and improve their writing.',
          ),
          PracticeItem(
            description: '3. Offer constructive feedback to students to enhance handwriting quality and OCR accuracy.',
          ),
          PracticeItem(
            description: '4. Provide comprehensive user training to educators to address accuracy challenges effectively.',
          ),
          PracticeItem(
            description: '5. Develop a standardized answer sheet template with clear instructions and designated areas for answers to facilitate OCR processing.',
          ),
          PracticeItem(
            description: '6. Encourage students to practice writing in a consistent style and size to aid OCR recognition.',
          ),
        ],
      ),
    ];

    final TextStyle textStyle1 = TextStyle(fontSize: 18);
    final TextStyle textStyle2 = TextStyle(fontSize: 14);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Best Practices',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                for (final practice in bestPractices)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        practice.title,
                        style: textStyle1,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: practice.items.map((item) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.description,
                                style: textStyle2,
                              ),
                              if (item.imagePath != null) // Only show image if imagePath is provided
                                SizedBox(height: 10),
                              if (item.imagePath != null)
                                Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.5, // Adjust the percentage as needed
                                    child: Image.asset(
                                      item.imagePath!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 20),
                            ],
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BestPracticeItem {
  final String title;
  final List<PracticeItem> items;

  BestPracticeItem({required this.title, required this.items});
}

class PracticeItem {
  final String description;
  final String? imagePath;

  PracticeItem({required this.description, this.imagePath});
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
                          child: Text(
                              'The technology used to convert different types of documents, '
                              'such as scanned paper documents, PDF files, or images captured by a digital camera, into editable and '
                              'searchable data.')),
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
                          child: Text(
                              'The level of detail that an image holds. In the context of scanning, it measures the '
                              'number of pixels per inch (PPI) or dots per inch (DPI) in a digital image.')),
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
                          child: Text(
                              'The arrangement of text, images, and other elements on a document or webpage.')),
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
                          child: Text(
                              'The process of converting handwritten text into digital text. It involves analyzing '
                              'and interpreting handwritten characters to recognize and convert them into machine-readable text.')),
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
                          child: Text(
                              'The process of adjusting and fine-tuning equipment or software to ensure accuracy and '
                              'consistency in performance. In the context of scanning, calibration may involve adjusting settings '
                              'such as brightness, contrast, and color balance to optimize image quality.')),
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
                          child: Text(
                              'A predefined layout or structure that follows specific guidelines or conventions. '
                              'In the context of answer sheets, a standardized format ensures consistency in the presentation of '
                              'questions and answers, facilitating accurate interpretation and grading.')),
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
                          child: Text(
                              'The positioning of text or objects relative to a reference point or line. In the '
                              'context of OCR, alignment ensures that text is accurately detected and interpreted within '
                              'predefined boundaries or regions.')),
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
                          child: Text(
                              'Random variations or interference in an image that can degrade quality and affect '
                              'OCR accuracy.')),
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
                          child: Text(
                              'The process of applying various techniques to raw data, such as images or text, to '
                              'improve quality, enhance features, or prepare it for further analysis.')),
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
        answer:
            'RajaMark is designed to be compatible with multiple operating systems, which are Windows, '
            'macOS, Linux, Android and iOS.'),
    FAQItem(
        question: '2. How does RajaMark automate answer sheet grading?',
        answer:
            'RajaMark assumes the adherence of the answer sheets uploaded to a standardized format and '
            'layout, and conducts recognition of students’ handwriting with OCR technology to compare the answers with '
            'the sample provided.'),
    FAQItem(
        question: '3. What format should the answer sheets uploaded be in?',
        answer:
            'The answer sheets (PNG) should have the answers consistently written next to the corresponding '
            'question numbers in a predetermined manner and written in Capital Letters (e.g., letters A-E)'),
    FAQItem(
        question:
            '4. How does RajaMark ensure its accuracy in text recognition to compare uploaded answer sheets with '
            'the sample answers?',
        answer:
            'While we try our best to produce the most accurate text recognition results using OCR technology, it '
            'is inevitable to face minor inaccuracies in detecting the handwritten answers. Hence, we highly advise users '
            'to conduct a thorough checking of the graded answers and make the necessary corrections on the Student Answer Page.'),
    FAQItem(
        question: '5. Can I modify the grading system for a subject?',
        answer:
            'Yes! After the user has created a subject under the Exam Details page, a default grade will be automatically '
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
          for (int i = 0; i < _faqs.length; i++)
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              collapsedTitleBackgroundColor:
                  const Color.fromARGB(255, 162, 180, 212),
              expandedTitleBackgroundColor:
                  const Color.fromARGB(255, 111, 143, 199),
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
