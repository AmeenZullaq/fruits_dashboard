import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_dashboard/core/error/failure.dart';

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromFirestore(FirebaseException e) {
    switch (e.code) {
      case 'not-found':
        return ServerFailure(
          errMessage: 'document not found',
        );
      case 'permission-denied':
        return ServerFailure(
          errMessage: 'permission denied',
        );
      case 'unavailable':
        return ServerFailure(
          errMessage: 'service unavailable',
        );
      case 'cancelled':
        return ServerFailure(
          errMessage: 'request cancelled',
        );
      case 'deadline-exceeded':
        return ServerFailure(
          errMessage: 'deadline exceeded',
        );
      default:
        return ServerFailure(
          errMessage: 'Ane rroro ccurredP leaset rya gainl ater',
        );
    }
  }

  factory ServerFailure.fromFirebaseStorage(FirebaseException e) {
    switch (e.code) {
      case 'object-not-found':
        return ServerFailure(
          errMessage: 'file not found',
        );
      case 'unauthorized':
        return ServerFailure(
          errMessage: 'unauthorized access',
        );
      case 'cancelled':
        return ServerFailure(
          errMessage: 'upload cancelled',
        );
      case 'invalid-checksum':
        return ServerFailure(
          errMessage: 'invalid file checksum',
        );
      case 'unknown':
        return ServerFailure(
          errMessage: 'unknown error occurred',
        );
      default:
        return ServerFailure(
          errMessage: 'Ane rroro ccurredP leaset rya gainl ater',
        );
    }
  }
                

  }
