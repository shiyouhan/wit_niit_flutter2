import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:wit_niit_flutter2/app/modules/bench/controllers/add_live_controller.dart';
import 'package:wit_niit_flutter2/app/modules/bench/views/live_view.dart';

class AddLive extends GetView<AddLiveController> {
  const AddLive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _form = GlobalKey<FormState>();

    void _validate() {
      _form.currentState!.validate();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('开启直播'),
        centerTitle: true,
      ),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              TextFormField(
                validator:
                    ValidationBuilder().minLength(1).maxLength(20).build(),
                decoration: InputDecoration(
                  labelText: '直播名称',
                  helperText: '不能为空',
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: ,
      bottomNavigationBar: FloatingActionButton(
        onPressed: (){
          _validate;
          Get.to(()=>LiveView());
        },
        tooltip: 'Next',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
