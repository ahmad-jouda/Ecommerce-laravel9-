import './bootstrap';

import Alpine from 'alpinejs';

window.Alpine = Alpine;

Alpine.start();

var channel = Echo.private(`App.Models.User.${userID}`);
channel.notification(function(data) {
    console.log(data);
    alert(data.body);
});

// public channel
// var channel = Echo.channel('my-channel');
// channel.listen('.my-event', function(data) {
//   alert(JSON.stringify(data));
// });