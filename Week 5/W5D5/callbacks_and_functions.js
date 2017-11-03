window.setTimeout(function () {
  alert('HAMMERTIME');
}, 5000);
//asynchronous

function hammerTime (time) {
  window.setTimeout(function () {
    alert(`${time} is hammertime!`);
  });
}
