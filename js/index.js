function isSmartPhone() {
  return (window.matchMedia && window.matchMedia('(max-device-width: 640px)').matches);
}

function createDataset(label, backgroundColor, data) {
  return {
    label: label,
    backgroundColor: backgroundColor,
    barPercentage: 1.0,
    categoryPercentage: 1.0,
    borderWidth: 0,
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
      indexAxis: 'y',
      animation: {
        duration: 0
      },
      aspectRatio: isSmartPhone() ? 1 : 2,
      scales: {
        x: {
          stacked: true,
          min: -1500,
          max: 1500,
          stepSize: 100,
          ticks: {
            callback: (value, index, values) => `${Math.abs(value)}`
          },
        },
        y: {
          stacked: true
        }
      },
      plugins: {
        title: {
          display: true,
          text: title,
        },
        tooltip: {
          yAlign: 'bottom',
          callbacks: {
            label: (context) => `${context.dataset.label}: ${Math.abs(context.raw)}`
          }
        }
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
      data[year] = {
        male: Array(101).fill().map((_, i) => 0),
        female: Array(101).fill().map((_, i) => 0)
      };
    }
    data[year].male[age] = -male;
    data[year].female[age] = female;
  });

  data.forEach((yearData, i) => {
    yearData.male.reverse();
    yearData.female.reverse();
  });

  return data;
}

function drawChart(data, year) {
  let ages = Array(101).fill().map((_, i) => i).reverse();
  let datasets = [];
  
  datasets.push(createDataset('male', 'BLUE', data[year].male));
  datasets.push(createDataset('female', 'RED', data[year].female));

  let ctx = document.getElementById("chart").getContext("2d");
  return new Chart(ctx, createConfig(ages, datasets, "年齢（各歳），男女別人口"));
}

function updateChart(data, chart, year) {
  chart.data.datasets[0].data = data[year].male;
  chart.data.datasets[1].data = data[year].female;

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
req.onload = () => {
  data = createData(req.responseText);
  chart = drawChart(data, 2020);
};
req.send(null);

