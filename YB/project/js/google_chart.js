google.charts.load('current', { packages: ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

    // Data formatting...
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Topping');
    data.addColumn('number', 'Slices');
    data.addRows([
        ['data1', 10],
        ['data2', 20],
        ['data3', 30],
        ['data4', 40],
        ['data5', 50]
    ]);

    // Options
    var options = {
        'title': 'TEST TITLE',
        'width': 400,
        'height': 300
    };

    // viable
    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);