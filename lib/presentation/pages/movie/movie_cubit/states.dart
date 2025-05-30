abstract class MovieStates {}

class MovieInitialState extends MovieStates {}

class GetNowPlayingLoadingState extends MovieStates {}

class GetNowPlayingSuccessState extends MovieStates {}

class GetNowPlayingErrorState extends MovieStates {}

class GetPopularLoadingState extends MovieStates {}

class GetPopularSuccessState extends MovieStates {}

class GetPopularErrorState extends MovieStates {}

class GetTopRatedLoadingState extends MovieStates {}

class GetTopRatedSuccessState extends MovieStates {}

class GetTopRatedErrorState extends MovieStates {}