(function(){
  'use strict';

  $(document).ready(init);

  function init(){
    console.log(gon);
    populateCharts();
  }

  function populateCharts(){
    populateGoldEarnedvsGoldSpent();
    populateGoldPerMin();
  }

  function populateGoldEarnedvsGoldSpent(){
    $('#goldEarnedvsGoldSpent').highcharts({
      chart: {
            type: 'area'
        },
        title: {
            text: 'Gold Earned vs Gold Spent'
        },
        subtitle: {
          text: ''
        },
        xAxis: {
            title: {
              text: 'Matches'
            },
            categories: gon.gold_earned_vs_gold_spent.map(function(data){return data.creation})
        },
        yAxis: {
            title: {
                text: 'Gold'
            },
            labels: {
                formatter: function () {
                    return this.value;
                }
            }
        },
        tooltip: {
            pointFormat: '{series.name} <b>{point.y:,.0f}</b>'
        },
        plotOptions: {
            area: {
                marker: {
                    enabled: false,
                    symbol: 'circle',
                    radius: 2,
                    states: {
                        hover: {
                            enabled: true
                        }
                    }
                }
            }
        },
        series: [{
            name: 'Gold Earned',
            data: gon.gold_earned_vs_gold_spent.map(function(data){ return data.gold_earned;})
        }, {
            name: 'Gold Spent',
            data: gon.gold_earned_vs_gold_spent.map(function(data){ return data.gold_spent;})
        }]
    });
  }

  function populateGoldPerMin(){
    $('#goldPerMin').highcharts({
      chart: {
            type: 'area'
        },
        title: {
            text: 'Gold Per Minute'
        },
        subtitle: {
          text: ''
        },
        xAxis: {
            title: {
              text: 'Matches'
            },
            categories: gon.gold_per_min.map(function(data){return data.creation})
        },
        yAxis: {
            title: {
                text: 'Gold Per Minute'
            },
            labels: {
                formatter: function () {
                    return this.value;
                }
            }
        },
        tooltip: {
            pointFormat: '{series.name} <b>{point.y:,.0f}</b>'
        },
        plotOptions: {
            area: {
                marker: {
                    enabled: false,
                    symbol: 'circle',
                    radius: 2,
                    states: {
                        hover: {
                            enabled: true
                        }
                    }
                }
            }
        },
        series: [{
            name: 'Gold Per Minute',
            data: gon.gold_per_min.map(function(data){ return data.gold_per_min;})
        }]
    });
  }
})();
