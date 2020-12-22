import 'package:EsquireCallCenterExecutiveApp/blocs/activiti/activiti_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/blocs/initial/intial_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/core/configs/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActivitiForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ActivitiBloc _activitiBloc = BlocProvider.of<ActivitiBloc>(context);
    final IntialBloc _dataBloc = BlocProvider.of<IntialBloc>(context);

    final GlobalKey<FormBuilderState> _form = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: BlocBuilder<ActivitiBloc, ActivitiState>(
        builder: (context, state) {
          return state is FormDataLoadedState
              ? FormBuilder(
                  key: _form,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FormBuilderTextField(
                          attribute: 'taskId',
                          readOnly: true,
                          initialValue: _activitiBloc.taskId,
                          decoration: InputDecoration(labelText: 'Task Id'),
                        ),
                      ),
                      Expanded(
                        child: _activitiBloc
                                    .formVariable.formProperties.length >
                                0
                            ? ListView(
                                children: _activitiBloc
                                    .formVariable.formProperties
                                    .map((formField) {
                                if (formField.id == 'serviceType') {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FormBuilderDropdown(
                                        decoration: InputDecoration(
                                            labelText: formField.name),
                                        initialValue: _dataBloc.serviceTypes[0],
                                        attribute: formField.id,
                                        items: _dataBloc.serviceTypes
                                            .map((e) => DropdownMenuItem(
                                                  child: Text(e),
                                                  value: e,
                                                ))
                                            .toList()),
                                  );
                                } else if (formField.id == 'ticketStatus') {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FormBuilderDropdown(
                                        decoration: InputDecoration(
                                            labelText: formField.name),
                                        initialValue: _dataBloc.ticketStatus[0],
                                        attribute: formField.id,
                                        items: _dataBloc.ticketStatus
                                            .map((e) => DropdownMenuItem(
                                                  child: Text(e),
                                                  value: e,
                                                ))
                                            .toList()),
                                  );
                                } else if (formField.id == 'executiveId') {
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FormBuilderTextField(
                                      attribute: formField.id,
                                      readOnly: true,
                                      initialValue: Config.USER.id.toString(),
                                      decoration: InputDecoration(
                                          labelText: formField.name),
                                    ),
                                  );
                                } else if (formField.type == 'boolean') {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FormBuilderSwitch(
                                        initialValue: true,
                                        attribute: formField.id,
                                        label: Text(formField.name)),
                                  );
                                } else if (formField.id == 'userId') {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FormBuilderTextField(
                                      attribute: formField.id,
                                      readOnly: true,
                                      initialValue: Config.USER.id.toString(),
                                      decoration: InputDecoration(
                                          labelText: formField.name),
                                    ),
                                  );
                                } else if (formField.id == 'arrivalDate') {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FormBuilderDateTimePicker(
                                      decoration: InputDecoration(
                                          labelText: formField.name),
                                      attribute: formField.id,
                                      format: DateFormat('dd/MM/yyyy'),
                                      inputType: InputType.date,
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime(2100),
                                      valueTransformer: (value) =>
                                          DateFormat('dd/MM/yyyy')
                                              .format(value),
                                    ),
                                  );
                                } else if (formField.id == 'arrivalTime') {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FormBuilderDateTimePicker(
                                      decoration: InputDecoration(
                                          labelText: formField.name),
                                      attribute: formField.id,
                                      inputType: InputType.time,
                                      format: DateFormat('hh:mm:ss a'),
                                      initialTime: TimeOfDay.now(),
                                      valueTransformer: (value) =>
                                          DateFormat('hh:mm:ss a')
                                              .format(value),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FormBuilderTextField(
                                      attribute: formField.id,
                                      initialValue: '',
                                      decoration: InputDecoration(
                                          labelText: formField.name),
                                    ),
                                  );
                                }
                              }).toList())
                            : Container(),
                      ),
                      FlatButton(
                          onPressed: () {
                            if (_form.currentState.saveAndValidate()) {
                              Map<String, dynamic> formData =
                                  _form.currentState.value;
                              _activitiBloc
                                  .add(CompleteTaskEvent(data: formData));
                              Get.back();
                              print(_form.currentState.value.toString());
                            }
                          },
                          child: Text('Submit'))
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  // Widget executiveField(context) {
  //   return BlocBuilder<BranchBloc, BranchState>(
  //     builder: (context, branchState) {
  //       return branchState is SelectedBranch
  //           ? BlocProvider<SectionBloc>(
  //               create: (context) => SectionBloc(),
  //               child: Builder(builder: (context) {
  //                 final _sectionBloc = BlocProvider.of<SectionBloc>(context);
  //                 _sectionBloc.add(SwitchSectionEvent(
  //                     serviceSection: branchState.branch.serviceSections[0]));
  //                 return BlocBuilder<SectionBloc, SectionState>(
  //                   builder: (context, sectionState) {
  //                     return sectionState is SelectedSectionState
  //                         ? Column(
  //                             children: [
  //                               Padding(
  //                                 padding: const EdgeInsets.all(10.0),
  //                                 child: FormBuilderDropdown(
  //                                     onChanged: (value) {
  //                                       _sectionBloc.add(SwitchSectionEvent(
  //                                           serviceSection: value));
  //                                     },
  //                                     decoration:
  //                                         InputDecoration(labelText: 'Section'),
  //                                     initialValue:
  //                                         branchState.branch.serviceSections[0],
  //                                     attribute: formField.id,
  //                                     items: branchState.branch.serviceSections
  //                                         .map((e) {
  //                                       return DropdownMenuItem(
  //                                         child: Text(e.name),
  //                                         value: e,
  //                                       );
  //                                     }).toList()),
  //                               ),
  //                               _sectionBloc.serviceExecutives.length == 1
  //                                   ? Padding(
  //                                       padding: const EdgeInsets.all(10.0),
  //                                       child: FormBuilderDropdown(
  //                                           decoration: InputDecoration(
  //                                               labelText: formField.name),
  //                                           initialValue: _sectionBloc
  //                                               .serviceExecutives[0].name,
  //                                           attribute: formField.id,
  //                                           items: _sectionBloc
  //                                               .serviceExecutives
  //                                               .map((e) => DropdownMenuItem(
  //                                                     child: Text(e.name),
  //                                                     value: e.id,
  //                                                   ))
  //                                               .toList()),
  //                                     )
  //                                   : _sectionBloc.serviceExecutives.length == 0
  //                                       ? Container()
  //                                       : Padding(
  //                                           padding: const EdgeInsets.all(10.0),
  //                                           child: FormBuilderTextField(
  //                                             attribute: formField.id,
  //                                             readOnly: true,
  //                                             initialValue: _sectionBloc
  //                                                 .serviceExecutives[0].id
  //                                                 .toString(),
  //                                             decoration: InputDecoration(
  //                                                 labelText: formField.name),
  //                                           ),
  //                                         ),
  //                             ],
  //                           )
  //                         : Container();
  //                   },
  //                 );
  //               }),
  //             )
  //           : Container();
  //     },
  //   );
  // }
}
