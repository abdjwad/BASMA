class Url{
static  const  String baseUrl="https://basma.icu/api/";
static  const  String register=baseUrl+"user_register/";
static  const  String login=baseUrl+"user_register/login";
static  const  String  verify=baseUrl+"user_register/verify";
static  const  String  resendCode=baseUrl+"user_register/resend";
//////////////////////////////////////////////
  static  const  String getAllPosts=baseUrl+"posts/";
  static  const  String createPost=baseUrl+"posts/";
  static  const  String  filterPost=baseUrl+"posts/post/filter";
  static  const  String  likePost=baseUrl+"posts/like";
  static  const  String  UnlikePost=baseUrl+"posts/remove/like";
  static  const  String  getUserPost=baseUrl+"posts/user/get_user_posts";
  ///////////////////////////////////////////////////
  static  const  String getAllClassRoom=baseUrl+"education/getAllClassroom";
  static  const  String getSubjectForClass=baseUrl+"education/getSubjectsForClassroom";
  static  const  String  getTitlesForSubjectClass=baseUrl+"education/getTitlesForSubjectClass";
  static  const  String  getAllOrderExplanations=baseUrl+"education/getAllOrderExplanations";
  static  const  String  approveorderExplanation=baseUrl+"education/approveorderExplanation";
  static  const  String  createExplanation=baseUrl+"education/approveorderExplanation";
  static  const  String  getUserPendingExplanations=baseUrl+"education/getUserPendingExplanations";
  static  const  String  getUserUploadedExplanations=baseUrl+"education/getUserUploadedExplanations";
  static  const  String  getUserRejectedExplanations=baseUrl+"education/getUserRejectedExplanations";
  static  const  String  getUserApprovedExplanations=baseUrl+"education/getUserApprovedExplanations";
  static  const  String  saveExplanationUrl=baseUrl+"education/saveExplanationUrl";
  static  const  String  generateSignature=baseUrl+"education/generateSignature";
  static  const  String  getExplanationsByTitle=baseUrl+"education/getExplanationsByTitle";

}