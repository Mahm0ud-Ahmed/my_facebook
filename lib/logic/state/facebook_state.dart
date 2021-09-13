abstract class FacebookState {}

class InitialFacebookState extends FacebookState {}

// User State
class LoadingUserFacebookState extends FacebookState {}

class SuccessUserFacebookState extends FacebookState {}

class ErrorUserFacebookState extends FacebookState {}

// Story State
class LoadingStoryFacebookState extends FacebookState {}

class SuccessStoryFacebookState extends FacebookState {}

class ErrorStoryFacebookState extends FacebookState {}

// Post State
class LoadingPostFacebookState extends FacebookState {}

class SuccessPostFacebookState extends FacebookState {}

class ErrorPostFacebookState extends FacebookState {}

class ChangeTextLineState extends FacebookState {}
