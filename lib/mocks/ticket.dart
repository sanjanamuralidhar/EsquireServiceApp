import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons.dart';

class DumbTicket {
  static final getUsers = ['Anish', 'Ashiq', 'Mike', 'Teresa'];

  static final jobTypes = [
    'Collect Product',
    'Deliver Product',
    'Sent to Service Center',
    'Order Components',
    'Installation'
  ];

  static final getJobs = [
    {
      'name': 'COLLECT PRODUCT FROM CUSTOMER',
      'timeSlot': DateTime.now(),
    },
  ];
  static final getJobList = [
    {
      'name': 'TRANSFER TO WORK DESK',
      'timeSlot': DateTime.now(),
    },
    {
      'name': 'TRANSFER TO OUT SOURCE SERVICE',
      'timeSlot': DateTime.now(),
    },
    {
      'name': 'TAKING WORK FROM FRONT OFFICE EXECUTIVE',
      'timeSlot': DateTime.now(),
    },
    {
      'name': 'CALLING CUSTOMER FOR ORAL CONFIRMATION',
      'timeSlot': DateTime.now(),
    },
    {
      'name': 'TRANSFER TO DOA',
      'timeSlot': DateTime.now(),
    },
    {
      'name': 'COLLECTING FROMN WORK DESK',
      'timeSlot': DateTime.now(),
    },
    {
      'name': 'FEED BACK SENDING TO THE CUSTOMER',
      'timeSlot': DateTime.now(),
    },
    {
      'name': 'BILL SETTLEMENTS',
      'timeSlot': DateTime.now(),
    },
  ];
  static getJobsTags(String tag) {
    List<String> items = [];
    getJobList.forEach((element) {
      if (element['name'].toString().contains(tag)) {
        items.add(element['name']);
      }
    });
    return items;
  }
}
