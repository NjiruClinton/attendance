import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:project/constants.dart';
class StorageMethods {
  Future<String> uploadImageToStorage (Uint8List file)async
  {
    Reference ref = FirebaseStorage.instance.ref().child('profile').child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask=ref.putData(file);
    TaskSnapshot taskSnapshot=await uploadTask.snapshot;
    String downloadUrl=await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}