
class UserModel{
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final String grade;
  final String totalClasses;
  final String presents;
  final String absents;
  final String leave;
  final String leavesLeft;
  UserModel(
    this.uid, this.name, this.email, this.photoUrl, this.grade, this.totalClasses, this.presents, this.absents, this.leave, this.leavesLeft
  );
  Map<String,dynamic> toJson()=>{
    'uid': uid,
    'name': name,
    'email': email,
    'photoUrl': photoUrl,
    'grade': grade,
    'totalClasses': totalClasses,
    'presents': presents,
    'absents': absents,
    'leave': leave,
    'leavesLeft': leavesLeft,
  };
}