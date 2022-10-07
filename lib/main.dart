import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/constants/strings.dart';
import 'package:productbox_flutter_exercise/constants/theme_data.dart';
import 'package:productbox_flutter_exercise/controller/cubits/documents_progress_bar_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/login_cubit/login_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/post_cubit/fetch_posts_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/certificate_cubit/certificate_file_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/driving_license_cubit/driving_license_file_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/passport_file_cubit/passport_file_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/upload_documents_cubit/profile_picture_cubit/profile_picture_cubit.dart';
import 'package:productbox_flutter_exercise/controller/cubits/web_socket_cubit/web_socket_chat_cubit.dart';
import 'package:productbox_flutter_exercise/view/screens/dashboard_screen.dart';
import 'package:productbox_flutter_exercise/view/screens/login_screen.dart';
import 'package:productbox_flutter_exercise/view/screens/upload_document.dart';
import 'package:productbox_flutter_exercise/view/screens/web_socket_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => DocumentsProgressBarCubit(),
        ),
        BlocProvider(
          create: (context) => FetchPostsCubit(),
        ),
        BlocProvider(
          create: (context) => ProfilePictureCubit(),
        ),
        BlocProvider(
          create: (context) => DrivingLicenseFileCubit(),
        ),
        BlocProvider(
          create: (context) => CertificateFileCubit(),
        ),
        BlocProvider(
          create: (context) => PassportFileCubit(),
        ),
        BlocProvider(
          create: (context) => WebSocketChatCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'ProductBox Flutter Exercise',
            theme: MyThemeData.themeData,
            //onGenerateRoute: widget.router.generateRoute,
            routes: {
              Strings.loginScreen: (context) => LoginScreen(),
              Strings.uploadDocumentScreen: (context) => UploadDocument(),
              Strings.dashboardScreen: (context) => DashboardScreen(),
              Strings.webSocketScreen: (context) => WebSocketScreen(),
            },
            //home: WebSocketScreen(),
          );
        },
      ),
    );
  }
}
