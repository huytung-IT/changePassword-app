import 'package:flutter/material.dart';
import 'change_password_bloc.dart';
import 'change_password_state.dart';

class ChangePasswordScreen extends StatefulWidget{
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();

}
class _ChangePasswordScreenState extends State<ChangePasswordScreen>{
  late ChangePasswordBloc _bloc;
  TextEditingController _NewPasswordController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _bloc = ChangePasswordBloc();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('change Password'),
      ),
      body: Center(
        child: StreamBuilder<ChangePasswordState>(
          stream: _bloc.stateStream,
          initialData: ChangePasswordState(isLoading: false, message: ''),
          builder: (context, snapshot){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: TextField(
                    controller: _NewPasswordController,
                    decoration: const InputDecoration(labelText: 'New password'),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    onPressed:() {

                    },
                    child: Text('Change Password')
                ),
                SizedBox(height: 16),
                if (snapshot.data!.isLoading)
                  CircularProgressIndicator()
                else
                  Text(snapshot.data!.message),
              ],
            );
          },
        ),
      ),

    );
  }
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}