import 'package:EsquireCallCenterExecutiveApp/blocs/activiti/activiti_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/blocs/select/select_bloc.dart';
import 'package:EsquireCallCenterExecutiveApp/mocks/repo.dart';
import 'package:EsquireCallCenterExecutiveApp/mocks/ticket.dart';
import 'package:EsquireCallCenterExecutiveApp/presentation/pages/chat_page.dart';
import 'package:EsquireCallCenterExecutiveApp/core/utils/util.dart';
import 'package:EsquireCallCenterExecutiveApp/presentation/widgets/activiti_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:openapi/model/ticket.dart';

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;

  TicketDetailPage({this.ticket});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ActivitiBloc>(context).add(GetAllTaskEvent(ticket: ticket));
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Builder(builder: (context) {
            return FlatButton.icon(
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                color: Colors.blue,
                label: Text('PRODUCT'),
                icon: Icon(
                  Icons.add,
                ),
                onPressed: () {
                  _showStandbyProduct(context);
                });
          }),
        ),
        SizedBox(
          width: 10,
        ),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        //   child: Builder(builder: (context) {
        //     return FlatButton.icon(
        //         textTheme: ButtonTextTheme.primary,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(20))),
        //         color: Colors.blue,
        //         label: Text('JOBS'),
        //         icon: Icon(
        //           Icons.add,
        //         ),
        //         onPressed: () {
        //           _showJobModalBottomSheet(context);
        //         });
        //   }),
        // ),
        IconButton(
          icon: Icon(Icons.chat),
          onPressed: () {
            Get.to(ChatPage());
          },
        )
      ]),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Ticket ID - ' + ticket.id.toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: ticket.ticketHistories.last
                                                        .serviceStatus !=
                                                    'OPEN' ||
                                                ticket.ticketHistories.last
                                                        .serviceStatus !=
                                                    'CLOSED'
                                            ? Colors.red
                                            : ticket.ticketHistories.last
                                                        .serviceStatus ==
                                                    'OPEN'
                                                ? Colors.yellow
                                                : Colors.green,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        ticket
                                            .ticketHistories.last.serviceStatus,
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white),
                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'LAPCARE',
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ticket.product.product.name,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Black',
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      ticket.product.customer.name,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.warning,
                                          color: Theme.of(context).errorColor,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Warranty expired on ' +
                                            DateFormat('dd/MMyyyy')
                                                .format(DateTime.now()))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.warning,
                                          color: Theme.of(context).errorColor,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('AMC expires on ' +
                                            DateFormat('dd/MM/yyyy')
                                                .format(DateTime(2020)))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.green,
                    height: 2,
                    endIndent: 50,
                    indent: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 10,
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Customer Address',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ticket.product.customer.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    ticket.product.productLocation
                                        .locationAddressLineOne,
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Text(
                                    ticket.product.productLocation.districtName
                                            .district +
                                        ' ' +
                                        ticket.product.productLocation.stateName
                                            .state +
                                        ' ' +
                                        ticket.product.productLocation.pinCode
                                            .pinCode,
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Phone number',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                  ticket.product.customer.phone,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 10,
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Service details',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Issue',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(ticket.issue,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .color,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Description',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(ticket.ticketDescription,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    IconButton(
                                      icon: Icon(Icons.play_arrow),
                                      color: Colors.green,
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Expected delivery date',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    ticket.expectedDeliveryTime != null
                                        ? DateFormat('dd/MM/yyyy')
                                            .format(ticket.expectedDeliveryTime)
                                        : 'null',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Replacement',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('NO',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('Service Type'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ticket.product.serviceType,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            Column(
                              children: [
                                Text('Section'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'LAPCARE',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  //getServiceTypeAndStatus(context),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormBuilderTextField(
                            autofocus: false,
                            attribute: 'remarks',
                            decoration: const InputDecoration(
                              labelText: 'Remarks',
                            ),
                            initialValue: '',
                            onChanged: (val) {},
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            Util.showConfirmationsheet(context, () {
                              Get.back();
                            }, () {
                              Get.back();
                            });
                          },
                          child: Text(
                            'Update',
                            style: Theme.of(context).textTheme.button,
                          )),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black38,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('JOBS'),
                        ),
                      ),
                    ),
                  ),
                  getJobList(context)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getServiceTypeAndStatus(context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.refresh,
                        color: Colors.blue,
                        size: 17,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Status',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: BlocProvider(
                    create: (context) => SelectBloc(),
                    child: Builder(builder: (context) {
                      return BlocBuilder<SelectBloc, SelectState>(
                        builder: (context, state) {
                          final _dataDropdownBloc =
                              BlocProvider.of<SelectBloc>(context);
                          return DropdownButton(
                              hint: Text(state is SelectedState
                                  ? state.data
                                  : Repo.getAllTicketStatus[0]),
                              items: Repo.getAllTicketStatus
                                  .map((e) => DropdownMenuItem(
                                      value: e, child: Text(e)))
                                  .toList(),
                              underline: Container(),
                              onChanged: (val) {
                                Util.showConfirmationsheet(context, () {
                                  Get.back();
                                  Util.showSnackBar('Ticket status',
                                      'Ticket status updated succesfully');
                                  _dataDropdownBloc.add(NotSelectEvent());
                                  _dataDropdownBloc
                                      .add(SelectedEvent(data: val));
                                }, () {
                                  Get.back();
                                });
                              });
                        },
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getJobList(context) {
    //return Container();
    final ActivitiBloc _activitiBloc = BlocProvider.of<ActivitiBloc>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: BlocBuilder<ActivitiBloc, ActivitiState>(
        builder: (context, state) {
          return state is FormDataLoadedState &&
                  _activitiBloc.tasks != null &&
                  _activitiBloc.tasks.length > 0
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.verified_user,
                          color: Colors.green,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _activitiBloc.tasks[index]['name'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(DateFormat.yMEd()
                                    .format(DateTime.parse(_activitiBloc
                                        .tasks[index]['createTime']))
                                    .toString())
                              ],
                            ),
                          ),
                        ),
                        FlatButton(
                            onPressed: () {
                              Get.to(ActivitiForm());
                            },
                            child: Text('DONE'))
                      ],
                    ));
                  },
                  itemCount: DumbTicket.getJobs.length,
                )
              : Container();
        },
      ),
    );
  }

  _showStandbyProduct(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                child: Container(
                  child: ListTile(
                    leading: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          Get.back();
                        }),
                    title: Text('ADD STANDBY PRODUCT'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Brand',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Model',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Serial number',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Get.back();
                      Util.showSnackBar('', 'Standby product updated');
                    },
                    child: Text(
                      'SUBMIT',
                      style: Theme.of(context).textTheme.button,
                    )),
              )
            ],
          );
        });
  }

  _showJobModalBottomSheet(context) {
    showModalBottomSheet(
        //isScrollControlled: true,
        elevation: 20,
        context: context,
        builder: (context) {
          return BlocProvider<SelectBloc>(
            create: (context) => SelectBloc(),
            child: Builder(builder: (context) {
              final _selectBloc = BlocProvider.of<SelectBloc>(context);
              return BlocBuilder<SelectBloc, SelectState>(
                builder: (context, state) {
                  print(state is SelectedState ? state.data : '');
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2)),
                    child: FractionallySizedBox(
                      //width: 300,
                      widthFactor:
                          MediaQuery.of(context).size.width > 700 ? 0.36 : 1,
                      child: SingleChildScrollView(
                        primary: true,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                                child: Container(
                                  child: ListTile(
                                    leading: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        }),
                                    title: Text('ADD JOB'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Title',
                                  ),
                                  controller: TextEditingController(
                                      text: state is SelectedState
                                          ? state.data
                                          : ''),
                                  onChanged: (val) {},
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FormBuilderTextField(
                                  attribute: 'remarks',
                                  decoration: const InputDecoration(
                                    labelText: 'Remarks',
                                  ),
                                  initialValue: '',
                                  onChanged: (val) {},
                                  validators: [
                                    FormBuilderValidators.required(),
                                  ],
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              Wrap(
                                children: [
                                  'TRANSFER',
                                  'FRONT OFFICE',
                                  'CUSTOMER',
                                  'BILL',
                                  'FEED BACK',
                                  'WORK DESK'
                                ]
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: BlocProvider(
                                            create: (context) => SelectBloc(),
                                            child: Builder(builder: (context) {
                                              final _count =
                                                  BlocProvider.of<SelectBloc>(
                                                      context);
                                              return BlocBuilder<SelectBloc,
                                                  SelectState>(
                                                builder: (context, countState) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      if (countState
                                                          is NotSelectState) {
                                                        _selectBloc
                                                            .add(SelectedEvent(
                                                          data: DumbTicket
                                                              .getJobsTags(
                                                                  e)[0],
                                                        ));
                                                        _count.add(
                                                            SelectedEvent(
                                                                secondData: 1));
                                                      } else if (countState
                                                              is SelectedState &&
                                                          DumbTicket.getJobsTags(
                                                                      e)
                                                                  .length >
                                                              1) {
                                                        print(countState
                                                            .secondData
                                                            .toString());
                                                        _selectBloc
                                                            .add(SelectedEvent(
                                                          data: DumbTicket
                                                              .getJobsTags(
                                                                  e)[countState
                                                              .secondData],
                                                        ));
                                                        _count.add(SelectedEvent(
                                                            secondData: DumbTicket.getJobsTags(e)
                                                                            .length -
                                                                        1 !=
                                                                    countState
                                                                        .secondData
                                                                ? countState
                                                                        .secondData +
                                                                    1
                                                                : 0));
                                                      }
                                                    },
                                                    child: Chip(
                                                        labelPadding:
                                                            EdgeInsets.all(2),
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        label: Text(
                                                          e,
                                                          style: TextStyle(
                                                              fontSize: 11),
                                                        )),
                                                  );
                                                },
                                              );
                                            }),
                                          ),
                                        ))
                                    .toList(),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 30, 20, 10),
                                  child: Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100))),
                                    child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                          Util.showSnackBar(
                                              'Job', 'Job created');
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Theme.of(context)
                                              .primaryIconTheme
                                              .color,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          );
        });
  }
}
