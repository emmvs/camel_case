const countdown = () => {
  const TargetTime = document.getElementById("time_id");

  const countDate = new Date(TargetTime.dataset.time).getTime() + 24 * 3_600_000;
  const now = new Date().getTime();
  const gap = countDate - now;

  const second = 1000;
  const minute = second * 60;
  const hour = minute * 60;

  const textHour = Math.floor(gap / hour);
  const textMinute = Math.floor((gap % hour) / minute);
  const textSecond = Math.floor((gap % minute) / second);

  document.querySelector(".hour").innerText = `${textHour}:`;
  document.querySelector(".minute").innerText = `${textMinute}:`;
  document.querySelector(".second").innerText = `${textSecond}`;
};

export { countdown };
