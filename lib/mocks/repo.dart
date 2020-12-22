import 'package:EsquireCallCenterExecutiveApp/mocks/message.dart';

class Repo {
  static final getAllTicketStatus = ['PENDING', 'MARK AS DONE'];
  static final getAllServiceType = ['ONSITE', 'INHOUSE'];
  static final getAllJobStatus = [
    'OPEN',
    'IN PROGRESS',
    'PENDING',
    'CANCELLED',
    'CLOSE'
  ];
  static final getAllMessages = [
    Message(message: 'hai', isSender: true),
    Message(message: 'hellow', isSender: false),
    Message(message: 'how are you', isSender: true),
    Message(message: 'fine', isSender: false)
  ];

  static final getAllTickets = [
    // {
    //   'id': '23124234',
    //   'customer': 'john',
    //   'name': 'HardDisk',
    //   'product': 'WD 1.5 TB Wired External Hard Disk Drive',
    //   'image':
    //       'https://rukminim1.flixcart.com/image/416/416/jv19qq80/external-hard-drive/hdd/j/u/7/seagate-sthn2000400-original-imafgyvd4umvytzw.jpeg',
    //   'complaint': 'Can,t Format',
    //   'date': DateTime.now(),
    //   'status': 'In progress',
    //   'progress': 1,
    //   'location': 'Manavalasery',
    //   'route': 'Irinjalakuda'
    // },
    // {
    //   'id': '37482641',
    //   'customer': 'Albert',
    //   'name': 'Keyboard',
    //   'product':
    //       'HP Multimedia Slim Wireless Keyboard & Mouse Combo Wireless Laptop Keyboard ',
    //   'image':
    //       'https://rukminim1.flixcart.com/image/416/416/jwi518w0/keyboard-refurbished/t/h/4/u-multimedia-slim-wireless-keyboard-mouse-combo-hp-original-imaffkamsdrsgemr.jpeg',
    //   'complaint': 'Keyborad not working',
    //   'date': DateTime.now(),
    //   'status': 'Pending',
    //   'progress': 1,
    //   'location': 'Nadavaramba',
    //   'route': 'Irinjalakuda'
    // },
    // {
    //   'id': '12647835',
    //   'customer': 'Simon',
    //   'name': 'Monitor',
    //   'product': 'LG 24 inch Full HD LED Backlit IPS Panel Monitor (24MK600M)',
    //   'image':
    //       'https://rukminim1.flixcart.com/image/416/416/je1pa4w0/monitor/v/g/g/gn246hl-gn246hl-acer-original-imaf2sg2mu2r7cuh.jpeg',
    //   'complaint': 'Display not working',
    //   'date': DateTime.now(),
    //   'status': 'Completed',
    //   'progress': 3,
    //   'location': 'Kottat',
    //   'route': 'Thrissur town'
    // },
    // {
    //   'id': '37483643',
    //   'customer': 'Alexandra',
    //   'name': 'Camera',
    //   'product':
    //       'Canon M50 Mirrorless Camera Body with Single Lens EF-M 15-45 mm IS STM',
    //   'image':
    //       'https://rukminim1.flixcart.com/image/416/416/point-shoot-camera/d/z/q/powershot-sx430-is-sx430-is-canon-original-imaerzagfxnfmtyr.jpeg',
    //   'complaint': 'Blacked out disply',
    //   'date': DateTime.now(),
    //   'status': 'In progress',
    //   'progress': 1,
    //   'location': 'koratty',
    //   'route': 'Chalakudy'
    // },
    {
      'id': '2937467',
      'customer': 'Warren	',
      'name': 'Headphones',
      'product': 'boAt Bassheads 242 Wired Headset',
      'image':
          'https://rukminim1.flixcart.com/image/416/416/k0vbgy80pkrrdj/headphone/w/y/z/boat-bassheads-242-original-imafhbjuwkzr9tzg.jpeg',
      'complaint': 'Speaker not working',
      'date': DateTime.now(),
      'status': 'Pending',
      'progress': 1,
      'location': 'Koorkenchery',
      'route': 'Chalakudy'
    },
    {
      'id': '7887364',
      'customer': 'Sue	',
      'name': 'Camera',
      'product':
          'Canon M50 Mirrorless Camera Body with Single Lens EF-M 15-45 mm IS STM',
      'image':
          'https://rukminim1.flixcart.com/image/416/416/point-shoot-camera/d/z/q/powershot-sx430-is-sx430-is-canon-original-imaerzagfxnfmtyr.jpeg',
      'complaint': 'Blacked out disply',
      'date': DateTime.now(),
      'status': 'In progress',
      'progress': 1,
      'location': 'koratty',
      'route': 'Chalakudy',
      'callCenterExecutive': 'Mary',
      'serial': 542875613787493
    },
  ];
}
