(function(){
  'use strict';

  $(document).ready(init);

  function init(){
    console.log(gon);
    populateTimelineCharts();
  }

  function populateTimelineCharts(){
    populateCreepsPerMin();
    populateTimelineGoldPerMin();
  }

  function populateCreepsPerMin(){
    $('#creepsPerMin').highcharts({
      chart: {
            type: 'area'
        },
        title: {
            text: 'Creeps Per Minute'
        },
        subtitle: {
          text: ''
        },
        xAxis: {
            title: {
              text: 'Minutes'
            },
            categories: ["0-10", "10-20", "20-30", "30-end"]
        },
        yAxis: {
            title: {
                text: 'Creeps per Minute'
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
            name: 'Creeps',
            data: gon.timeline_data.creeps_per_min
        }]
    });
  }

  function populateTimelineGoldPerMin(){
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
              text: 'Minutes'
            },
            categories: ["0-10", "10-20", "20-30", "30-end"]
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
            data: gon.timeline_data.gold_per_min
        }]
    });
  }
})();
