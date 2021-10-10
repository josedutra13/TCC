
import 'package:auresgate/app/data/providers/api.dart';

class MyRepository {

final Api api;

MyRepository(this.api);

// getAll(){
//   return api.getAll();
// }
getId(id){
  return api.getUser(id);
}
delete(id){
  return api.delete(id);
}
// edit(obj){
//   return api.edit( obj );
// }
// add(obj){
//     return api.add( obj );
// }

}