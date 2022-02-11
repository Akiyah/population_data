var COLORS = [
  '#4C00FF',
  '#004CFF',
  '#00E5FF',
  '#00FF4D',
  '#4DFF00',
  '#E6FF00',
  '#FFFF00',
  '#FFDE59',
  '#FFE0B3',
];

function createDataset(label, backgroundColor, data) {
  return {
    label: label,
    lineTension: 0,
    backgroundColor: backgroundColor,
    borderColor: 'black',
    borderWidth: 1,
    data: data
  };
}
function createConfig(yms, datasets, title) {
  return {
    type: 'bar',
    data: {
      labels: yms,
      datasets: datasets
    },
    options: {
      title: {
        display: true,
        text: title,
      },
      scales: {
        xAxes: [{
          stacked: true,
        }],
        yAxes: [{
          stacked: true,
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  };
}

function createData(csv) {
  let data = [];
  csv.split('\n').forEach((line, i) => {
    if (i == 0) {
      return;
    }
    if (line == '') {
      return;
    }
    let row = line.split("\t");
    let year = Number(row[0]);
    let age = Number(row[1]);
    let male = Number(row[2]);
    let female = Number(row[3]);

    if (!data[year]) {
      data[year] = Array(101).fill().map((_, i) => [0, 0]);
    }
    data[year][age] = [male, female];
  });
  return data;
}

function drawChart(data, year) {
  let ages = Array(101).fill().map((_, i) => i);
  let datasets = [];
  
  datasets.push(createDataset(  'male', 'BLUE', data[year].map(counts => counts[0])));
  datasets.push(createDataset('female', 'RED', data[year].map(counts => counts[1])));

  let ctx = document.getElementById("chart").getContext("2d");
  return new Chart(ctx, createConfig(ages, datasets, "年齢（各歳），男女別人口"));
}

function updateChart(data, chart, year) {
  chart.data.datasets[0].data = data[year].map(counts => counts[0]);
  chart.data.datasets[1].data = data[year].map(counts => counts[1]);

  chart.update();
}

let data;
let chart;

let yearSlider = document.getElementById('yearSlider');
let yearLabel = document.getElementById('yearLabel');
yearSlider.addEventListener('input', (event) => {
  let year = Number(yearSlider.value);
  yearLabel.innerText = year;
  updateChart(data, chart, year);
});

let req = new XMLHttpRequest();
req.open("GET", 'tsv/population_data.tsv', true);
req.onload = function() {
  data = createData(req.responseText);
  chart = drawChart(data, 2020);
}
req.send(null);

