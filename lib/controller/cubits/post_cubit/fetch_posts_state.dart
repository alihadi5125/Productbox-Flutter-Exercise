part of 'fetch_posts_cubit.dart';

abstract class FetchPostsState extends Equatable {
  const FetchPostsState();
}

class FetchPostsInitial extends FetchPostsState {
  @override
  List<Object> get props => [];
}

class FetchPostsLoadingState extends FetchPostsState {
  @override
  List<Object> get props => [];
}

class FetchPostsLoadedState extends FetchPostsState {
  final PostModel? postModel;

  FetchPostsLoadedState({this.postModel});

  @override
  List<Object> get props => [postModel!];
}

class FetchPostsErrorState extends FetchPostsState {
  final String? error;

  FetchPostsErrorState({this.error});

  @override
  List<Object> get props => [error!];
}
