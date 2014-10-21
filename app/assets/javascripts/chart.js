google.setOnLoadCallback(drawChart);

  function drawChart() {

      $.ajax({
        url: '/admins/dashboard/charts',
        }).done(function(serverData) {
          fillPieChart(serverData);
      });

      fillPieChart = function(serverData) {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Type');
        data.addColumn('number', 'Total');
        data.addRows([
          ['Physical', serverData.totals[0]],
          ['Verbal', serverData.totals[1]],
          ['Rumors', serverData.totals[2]],
          ['Cyberbullying', serverData.totals[3]],
          ['Exclusion', serverData.totals[4]]
        ]);

        var options = {'title':'Reports of Bullying based on Keyword',
                       'width':900,
                       'height':400};

      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
      chart.draw(data, options);
      }
    }
// ChartController = function() {
//   this.view = new ChartView();
// }

// ChartView = function() {
//   this.options = {'title':'Reports of Bullying based on Keyword',
//                        'width':900,
//                        'height':400};
// }

// ChartView.prototype = {

//   stylePieChart: function(serverData) {
//         var data = new google.visualization.DataTable();
//         data.addColumn('string', 'Type');
//         data.addColumn('number', 'Total');
//         data.addRows([
//           ['Physical', serverData.totals[0]],
//           ['Verbal', serverData.totals[1]],
//           ['Rumors', serverData.totals[2]],
//           ['Cyberbullying', serverData.totals[3]],
//           ['Exclusion', serverData.totals[4]]
//         ]);

//   },
// }

// ChartController.prototype = {

//   fillChart: function() {
//     var view = this.view
//     var that = this;
//     $.ajax({
//         url: '/admins/dashboard/charts',
//         }).done(function(serverData) {
//           console.log("success")
//           that.view.stylePieChart(serverData);
//           that.drawChart(that.view.data, that.view.options)
//       });
//   },

//   drawChart: function(data, options) {
//      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
//      chart.draw(data, options);
//   }

// }


// var pieController = new ChartController;

// google.setOnLoadCallback(pieController.fillChart());


