const countdown = () => {
  const countDate = new Date("#time-id").getTime();
  const now = new Date().getTime();
  const gap = now - countDate < 86000 * 1000;

  const second = 1000;
  const minute = second * 60;
  const hour = minute * 60;
  const day = hour * 24;

  const textHour = Math.floor(gap / hour);
  const textMinute = Math.floor((gap % hour) / minute);
  const textSecond = Math.floor((gap % minute) /second);

  document.querySelector(".hour").innerText = textHour;
  document.querySelector(".minute").innerText = textMinute;
  document.querySelector(".second").innerText = textSecond;
};

setInterval(countdown, 1000);
