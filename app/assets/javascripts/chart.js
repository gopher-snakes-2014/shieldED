
// loadChart = (function() {
  // google.load('visualization', '1.0', {'packages':['corechart']});
  google.setOnLoadCallback(drawChart);

        function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Type');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Physical', 3],
          ['Verbal', 1],
          ['Rumors', 1],
          ['Cyberbullying', 1],
          ['Exclusion', 2]
        ]);

        // Set chart options
        var options = {'title':'Reports of Bullying based on Keyword',
                       'width':900,
                       'height':400};

        // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
      chart.draw(data, options);
      }


// });


// $(document).ready(function() {
//   loadChart();
// });
