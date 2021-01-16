/*
    This script's original form is by 汀力 in zhihu.
    The URL is https://zhuanlan.zhihu.com/p/169566930.
*/

/*
    This file is aimed to elaborate some functionality:
    ! 1. To add some support for user-specified calendar (not supported)
      ? However, it's impossible, because Calendar.presentPicker()
      ? only can be used once in a script, it's a static Promise.
      ? So when fulfilled, it cannot be called again.
      * So reminders' names have to be the same with events' names. 

    ! 2. To achieve full synchronization
      * When deleting reminders, delete the corresponding events (new)
      * When adding reminders, add the corresponding events
      
    ! 3. However, when the reminder's name is not the same with event' name
    ! Just put the events in the default calendar.
*/

const dur_month = 1;

const startDate = new Date();
startDate.setMonth(startDate.getMonth() - dur_month);

const endDate = new Date();
endDate.setMonth(endDate.getMonth() + dur_month);

const reminders = await Reminder.allDueBetween(startDate, endDate);

var calendar = await Calendar.forEvents();

const defaultEventCalendar = await Calendar.defaultForEvents();

var m_dict = {};
for (cal of calendar) {
  m_dict[cal.title] = cal;
}

const events = await CalendarEvent.between(startDate, endDate, calendar);

// ! To achieve adding
for (const reminder of reminders) {
  const targetNote = `[Reminder] ${reminder.identifier}`;
  const [targetEvent] = events.filter(e => e.notes != null && (e.notes.indexOf(targetNote) != -1));
  let event = undefined;
  let cal = undefined;
  if (targetEvent) {
    event = targetEvent;
  } else {
    console.warn(`创建事项 ${reminder.title} 到 ${reminder.calendar.title}`)
    event = new CalendarEvent();
  }
  if (m_dict[reminder.calendar.title]) {
    cal = m_dict[reminder.calendar.title];
  } else {
    cal = defaultEventCalendar;
    console.warn(`找不到日历${reminder.calendar.title},将创建事项${reminder.title}保存到默认的日历`);
  }
  newEventFunc(event, reminder, targetNote, cal);
  updateEvent(event, reminder);
}

// ! To achieve deleting.
for (const event of events) {
  const eventNote = event.notes;
  const [reminder] = reminders.filter(r => r.identifier != null && (eventNote.indexOf(r.identifier) != -1));
  if (reminder) {
    continue;
  } else {
    console.warn(`删除日历${reminder.title}`);
    event.remove();
  }

}

Script.complete();

function newEventFunc(event, reminder, note, calendar) {
  if (reminder.notes === undefined) {
    event.notes = note + "\n";
  } else {
    event.notes = note + "\n" + reminder.notes;
  }
  event.title = `${reminder.title}`;
  event.calendar = calendar;
  event.save();
}

function updateEvent(event, reminder) {
  if (reminder.isCompleted) {
    event.title = `✅${reminder.title}`;
    event.isAllDay = false;
    event.startDate = reminder.completionDate;
    var ending = new Date(reminder.completionDate);
    ending.setHours(ending.getHours() + 1);
    event.endDate = ending;
    var period = (reminder.dueDate - reminder.completionDate) / 1000 / 3600 / 24;
    period = period.toFixed(1);
    if (period < 0) {
      period = -period;
      event.location = " 延期" + period + "天完成";
    } else if (period == 0) {
      event.location = " 准时完成";
    } else {
      event.location = " 提前" + period + "天完成";
    }
  } else {
    const nowtime = new Date();
    var period = (reminder.dueDate - nowtime) / 1000 / 3600 / 24;
    period = period.toFixed(1);
    if (period < 0) {
      event.location = " 延期" + (-period) + "天";
      if (reminder.dueDate.getDate() != nowtime.getDate()) {
        event.title = `❌${reminder.title}`;
        event.startDate = nowtime;
        event.endDate = nowtime;
        event.isAllDay = true;
      } else {
        event.title = `⭕️${reminder.title}`;
        event.isAllDay = false;
        event.startDate = reminder.dueDate;
        var ending = new Date(reminder.dueDate);
        ending.setHours(ending.getHours() + 1);
        event.endDate = ending;
      }
      console.log(`【${reminder.title}】待办顺延${-period}天`);
    } else {
      event.title = `⭕️${reminder.title}`;
      event.isAllDay = false;
      event.location = "还剩" + period + "天";
      event.startDate = reminder.dueDate;
      var ending = new Date(reminder.dueDate);
      ending.setHours(ending.getHours() + 1);
      event.endDate = ending;
    }
  }
  event.save();
}