Highcharts.chart('chart', {
    title: {
        text: ''
    },
    legend:{   enabled: false},
    xAxis: [{
        title: { text: '' },
         min:0,
         max:3000,
         tickInterval: 250,
        tickmarkPlacement: 'on',
        alignTicks: false
    }],

    yAxis: [{
        title: { text: '' },
        tickPixelInterval: 10
       
    }],
      plotOptions: {
        series: {
        	 borderWidth: 0,
            binWidth:50
            
        }
    },

    series: [{
        name: '',
        type: 'histogram',
        baseSeries: 's1',
        zIndex: -1,
        data: chartData,
        id: 's1'
         
    }]
});