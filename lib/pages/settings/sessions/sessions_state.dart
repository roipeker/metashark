part of 'sessions.dart';

abstract class _SessionsState extends State<SessionsPage> {

  @override
  void initState(){
    super.initState();  
  }

  @override
  void dispose(){
    super.dispose();  
  }

  Future<void> onRefreshPull() async {
    await 2.seconds.delay();
  }

}
