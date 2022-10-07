import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/constants/strings.dart';
import 'package:productbox_flutter_exercise/controller/cubits/post_cubit/fetch_posts_cubit.dart';
import 'package:productbox_flutter_exercise/model/post_model.dart';
import 'package:productbox_flutter_exercise/view/widgets/dashboard_widgets/dashboard_body.dart';
import 'package:productbox_flutter_exercise/view/widgets/dashboard_widgets/error_widget.dart';
import 'package:productbox_flutter_exercise/view/widgets/loading_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    context.read<FetchPostsCubit>().fetchPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Strings.webSocketScreen);
          },
          elevation: 8,
          child: Icon(Icons.message, size: 30.sp),
          backgroundColor: Color(0xFF293462),
        ),
        body: SafeArea(
          child: BlocBuilder<FetchPostsCubit, FetchPostsState>(
            builder: (context, state) {
              if (state is FetchPostsLoadingState) {
                return loadingState(size: 50.sp, color: Color(0xFF293462));
              } else if (state is FetchPostsLoadedState) {
                final PostModel? postModel = state.postModel;
                return DashboardBody(postModel: postModel);
              } else if (state is FetchPostsErrorState) {
                return ErrorState();
              }
              return SizedBox();
            },
          ),
        ),
      );
}
