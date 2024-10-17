import 'package:pocketbase/pocketbase.dart';
import '../models/member.dart';

class MemberService {
  final PocketBase pb = PocketBase('http://127.0.0.1:8090');

  Future<List<Member>> getAllMembers() async {
    final response = await pb.collection('members').getFullList();
    return response.map((e) {
      if (e is RecordModel) {
        return Member.fromJson(e.toJson());
      }
      throw Exception('Invalid data format');
    }).toList();
  }
}
