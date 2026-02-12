import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controllers/auth_controller.dart';
import 'controllers/learning_controller.dart';
import 'controllers/quiz_controller.dart';
import 'controllers/mock_test_controller.dart';
import 'controllers/rewards_controller.dart';
import 'controllers/analytics_controller.dart';
import 'controllers/interviews_controller.dart';
import 'controllers/notification_controller.dart';
import 'views/login_view.dart';
import 'views/signup_view.dart';
import 'views/home_view.dart';
import 'views/quiz_view.dart';
import 'views/quiz_result_view.dart';
import 'views/profile_view.dart';
import 'views/learning_view.dart';
import 'views/learning_category_view.dart';
import 'views/programming_languages_view.dart';
import 'views/learning_content_view.dart';
import 'views/mock_test_view.dart';
import 'views/mock_test_result_view.dart';
import 'views/rewards_view.dart';
import 'views/analytics_view.dart';
import 'views/interviews_view.dart';
import 'views/admin_view.dart';
import 'views/interview_detail_view.dart';
import 'views/interview_feedback_view.dart';
import 'views/videos_view.dart';
import 'views/video_player_view.dart';
import 'views/pdf_list_view.dart';
import 'views/pdf_reader_view.dart';
import 'views/quiz_selection_view.dart';
import 'views/aptitude_selection_view.dart';
import 'views/aptitude_detail_view.dart';
import 'views/coding_selection_view.dart';
import 'views/mock_interview_selection_view.dart';
import 'views/mock_interview_session_view.dart';
import 'views/mock_interview_feedback_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize all controllers
  Get.put(AuthController());
  Get.put(LearningController());
  Get.put(QuizController());
  Get.put(MockTestController());
  Get.put(RewardsController());
  Get.put(AnalyticsController());
  Get.put(InterviewsController());
  Get.put(NotificationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CareerCrack',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          primary: Colors.indigo,
          secondary: Colors.green,
          tertiary: Colors.orange,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
          primary: Colors.indigo,
          secondary: Colors.green,
          tertiary: Colors.orange,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ),
      themeMode: ThemeMode.system, // or light/dark based on preference
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => AuthWrapper()),
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/signup', page: () => SignupView()),
        GetPage(name: '/home', page: () => HomeView()),
        GetPage(name: '/quiz', page: () => QuizView()),
        GetPage(name: '/quiz_result', page: () => QuizResultView()),
        GetPage(name: '/profile', page: () => ProfileView()),
        GetPage(name: '/learning', page: () => LearningView()),
        GetPage(
          name: '/programming_languages',
          page: () => ProgrammingLanguagesView(),
        ),
        GetPage(name: '/learning_category', page: () => LearningCategoryView()),
        GetPage(name: '/learning_content', page: () => NotesView()),
        GetPage(name: '/mock_tests', page: () => MockTestView()),
        GetPage(name: '/mock_test_result', page: () => MockTestResultView()),
        GetPage(name: '/rewards', page: () => RewardsView()),
        GetPage(name: '/analytics', page: () => AnalyticsView()),
        GetPage(name: '/interviews', page: () => InterviewsView()),
        GetPage(name: '/interview_detail', page: () => InterviewDetailView()),
        GetPage(
          name: '/interview_feedback',
          page: () => InterviewFeedbackView(),
        ),
        GetPage(name: '/admin', page: () => AdminView()),
        GetPage(name: '/videos', page: () => VideosView()),
        GetPage(name: '/video_player', page: () => VideoPlayerView()),
        GetPage(name: '/pdfs', page: () => PdfListView()),
        GetPage(name: '/pdf_reader', page: () => PdfReaderView()),
        GetPage(name: '/quiz_selection', page: () => const QuizSelectionView()),
        GetPage(
          name: '/aptitude_selection',
          page: () => const AptitudeSelectionView(),
        ),
        GetPage(
          name: '/aptitude_detail',
          page: () => const AptitudeDetailView(),
        ),
        GetPage(
          name: '/coding_selection',
          page: () => const CodingSelectionView(),
        ),
        GetPage(
          name: '/mock_interview_selection',
          page: () => MockInterviewSelectionView(),
        ),
        GetPage(
          name: '/mock_interview_session',
          page: () => MockInterviewSessionView(),
        ),
        GetPage(
          name: '/mock_interview_feedback',
          page: () => MockInterviewFeedbackView(),
        ),
        // Add other routes later
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Obx(() {
      if (authController.user.value != null) {
        return HomeView();
      } else {
        return LoginView();
      }
    });
  }
}
