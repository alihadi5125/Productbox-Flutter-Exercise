import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:productbox_flutter_exercise/controller/repositories/post_repository.dart';
import 'package:productbox_flutter_exercise/model/post_model.dart';

part 'fetch_posts_state.dart';

class FetchPostsCubit extends Cubit<FetchPostsState> {
  FetchPostsCubit() : super(FetchPostsInitial());

  /// Fetch Post
  Future<void> fetchPost() async {
    emit(FetchPostsLoadingState());

    try {
      final postList = await PostRepository.fetchPost();

      if (postList != null) {
        emit(FetchPostsLoadedState(postModel: postList));
      } else {
        emit(FetchPostsErrorState(error: 'Cannot fetch the list of posts.'));
      }
    } on Exception catch (e) {
      emit(FetchPostsErrorState(
          error: 'Exception occurred while fetching the list of posts.'));
    }
  }
}
