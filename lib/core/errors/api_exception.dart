class ApiException implements Exception {
  final String message;
 

 const ApiException(this.message);

  
}
class RemoteExcption extends ApiException{
   const RemoteExcption(super.message);
  }

  class localExcption extends ApiException{
    const localExcption(super.message);
  }
