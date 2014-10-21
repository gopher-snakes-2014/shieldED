
// loadChart = (function() {
  // google.load('visualization', '1.0', {'packages':['corechart']});
  google.setOnLoadCallback(drawChart);


  function drawChart() {

     var physical = $('.stasher').html();
     // var verbal = $('.stasher2').html();
     // console.log(physical)
      $.ajax({
        url: '/admins/dashboard',
        }).done(function(serverData) {
        console.log("success");
        console.log(serverData)
      });

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Type');
        data.addColumn('number', 'Total');
        data.addRows([
          ['Physical', physical],
          ['Verbal', 333],
          ['Rumors', 200],
          ['Cyberbullying', 151],
          ['Exclusion', 133]
        ]);

        // Set chart options
        var options = {'title':'Reports of Bullying based on Keyword',
                       'width':900,
                       'height':400};

        // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }






