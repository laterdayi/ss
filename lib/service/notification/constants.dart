part of '../index.dart';

// -------------------------------------------------------------------------------------------- > 新消息通知
const kAndroidDetailsNewMessage = AndroidNotificationDetails(
  'channelIdNewMessage', "新消息通知",
  // 优先级
  priority: Priority.max,
  // 通知可见性
  visibility: NotificationVisibility.public,
  // 震动
  enableVibration: true,
  // 声音
  playSound: true,
  // 显示徽章
  channelShowBadge: false,
);

const kAndroidChannelNewMessage = AndroidNotificationChannel(
  'channelIdNewMessage',
  '新消息通知',
  description: '新消息通知频道',
  // 重要性级别
  importance: Importance.max,
  // 震动
  enableVibration: true,
  // 声音
  playSound: true,
  // 显示徽章
  showBadge: false,
);
