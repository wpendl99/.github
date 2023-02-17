var count1 = 20;
let count2 = 20;

const outEl = document.querySelector('#out');

append('initial', count1, count2);

for (var count1 = 1; count1 < 3; count1++) {
  for (let count2 = 1; count2 <= 5; count2++) {
    append('loop', count1, count2);
  }
}

append('final', count1, count2);

function append(note, ...counts) {
  let r = counts.reduce((p, c, i) => {
    return p + `<span class='c${i}'>${c}</span>`;
  });
  outEl.innerHTML = outEl.innerHTML + `<li><b>${note}</b> ${r}</li>`;
}
