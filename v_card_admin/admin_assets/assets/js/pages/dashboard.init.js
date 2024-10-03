
/*
Template Name: TechUI - Responsive Bootstrap 4 Admin Dashboard
Author: GetAppui
Version: 2.0.0
File: Dashboard init js
*/

import ApexCharts from 'apexcharts';
import 'jsvectormap';
import 'jsvectormap/dist/maps/world'
import 'jsvectormap/dist/css/jsvectormap.min.css';


! function ($) {
	"use strict";

	var Dashboard = function () {
		this.$body = $("body"),
			this.charts = []
	};


	Dashboard.prototype.initCharts = function () {
		window.Apex = {
			chart: {
				parentHeightOffset: 0,
				toolbar: {
					show: false
				}
			},
			grid: {
				padding: {
					left: 0,
					right: 0
				}
			},
			colors: ["#3980c0", "#0dcaf0", "#fa6374", "#212529"],
		};

		var colors = ["#3980c0", "#0dcaf0", "#fa6374", "#212529"];
		var dataColors = $("#balance_overview").data('colors');
		if (dataColors) {
			colors = dataColors.split(",");
		}

		var options = {
			series: [{
				name: "Revenue",
				data: [20, 45, 42, 48, 72, 100, 90, 120, 155, 184, 214, 260]
			}, {
				name: "Sales",
				data: [20, 35, 52, 59, 50, 90, 95, 85, 108, 112, 158, 202]
			}],
			chart: {
				height: 390,
				type: "area",
				toolbar: "false"
			},
			dataLabels: {
				enabled: !1
			},
			stroke: {
				curve: "smooth",
				width: 4
			},
			xaxis: {
				categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
			},
			yaxis: {
				labels: {
					formatter: function (e) {
						return "$" + e + "k"
					}
				},
				tickAmount: 5,
				min: 0,
				max: 260
			},
			colors: colors,
			fill: {
				opacity: 0,
				colors: colors,
				type: "solid"
			}
		};

		var chart = new ApexCharts(
			document.querySelector("#balance_overview"),
			options
		);

		chart.render();

		/////////////////////////////////////////////////
		var colors = ["#198754"];
		var dataColors = $("#total_profit").data('colors');
		if (dataColors) {
			colors = dataColors.split(",");
		}

		var options = {
			chart: {
				type: "area",
				height: 60,
				sparkline: {
					enabled: !0
				}
			},
			series: [{
				data: [25, 66, 41, 89, 63, 25, 44, 12, 36, 9, 54]
			}],
			stroke: {
				width: 2,
				curve: "smooth"
			},
			markers: {
				size: 0
			},
			colors: colors = dataColors ? dataColors.split(",") : colors,
			tooltip: {
				fixed: {
					enabled: !1
				},
				x: {
					show: !1
				},
				y: {
					title: {
						formatter: function (o) {
							return ""
						}
					}
				},
				colors: colors,
				fill: {
					opacity: 1,
					colors: colors,
					type: "solid"
				},
				marker: {
					show: !1
				}
			}
		};

		var chart = new ApexCharts(
			document.querySelector("#total_profit"),
			options
		);

		chart.render();

		/////////////////////////////////////////////////
		var colors = ["#198754"];
		var dataColors = $("#new_customers").data('colors');
		if (dataColors) {
			colors = dataColors.split(",");
		}

		var options = {
			chart: {
				type: "bar",
				height: 60,
				sparkline: {
					enabled: !0
				}
			},
			plotOptions: {
				bar: {
					columnWidth: "60%"
				}
			},
			colors: colors = dataColors ? dataColors.split(",") : colors,
			series: [{
				data: [25, 66, 41, 89, 63, 25, 44, 12, 36, 9, 54]
			}],
			labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
			xaxis: {
				crosshairs: {
					width: 1
				}
			},
			tooltip: {
				fixed: {
					enabled: !1
				},
				x: {
					show: !1
				},
				y: {
					title: {
						formatter: function (o) {
							return ""
						}
					}
				},
				marker: {
					show: !1
				}
			}
		};

		var chart = new ApexCharts(
			document.querySelector("#new_customers"),
			options
		);

		chart.render();

		/////////////////////////////////////////////////
		var colors = ["#fa6374"];
		var dataColors = $("#running_project").data('colors');
		if (dataColors) {
			colors = dataColors.split(",");
		}

		var options = {
			chart: {
				type: "bar",
				height: 60,
				sparkline: {
					enabled: !0
				}
			},
			plotOptions: {
				bar: {
					columnWidth: "60%"
				}
			},
			stroke: {
				width: 2,
				curve: "smooth"
			},
			colors: colors = dataColors ? dataColors.split(",") : colors,
			series: [{
				data: [45, 80, 35, 18, 20, 55, 45, 10, 16, 20, 12]
			}],
			xaxis: {
				crosshairs: {
					width: 1
				}
			},
			tooltip: {
				fixed: {
					enabled: !1
				},
				x: {
					show: !1
				},
				y: {
					title: {
						formatter: function (o) {
							return ""
						}
					}
				},
				marker: {
					show: !1
				}
			}
		};

		var chart = new ApexCharts(
			document.querySelector("#running_project"),
			options
		);

		chart.render();


		/////////////////////////////////////////////////
		var colors = ["#198754"];
		var dataColors = $("#expense_total").data('colors');
		if (dataColors) {
			colors = dataColors.split(",");
		}

		var options = {
			chart: {
				type: "area",
				height: 60,
				sparkline: {
					enabled: !0
				}
			},
			plotOptions: {
				bar: {
					columnWidth: "60%"
				}
			},
			stroke: {
				width: 2,
				curve: "smooth"
			},
			colors: colors = dataColors ? dataColors.split(",") : colors,
			series: [{
				data: [42, 95, 40, 96, 42, 38, 58, 20, 40, 44, 56]
			}],
			xaxis: {
				crosshairs: {
					width: 1
				}
			},
			tooltip: {
				fixed: {
					enabled: !1
				},
				x: {
					show: !1
				},
				y: {
					title: {
						formatter: function (o) {
							return ""
						}
					}
				},
				marker: {
					show: !1
				}
			}
		};

		var chart = new ApexCharts(
			document.querySelector("#expense_total"),
			options
		);

		chart.render();

		/////////////////////////////////////////////////
		var colors = ["#198754", "#3980c0"];
		var dataColors = $("#earning_report").data('colors');
		if (dataColors) {
			colors = dataColors.split(",");
		}

		var options = {
			chart: {
				height: 380,
				type: "bar",
				toolbar: {
					show: !1
				}
			},
			plotOptions: {
				bar: {
					columnWidth: '80%',
					borderRadius: 10,
					dataLabels: {
						position: "top"
					}
				}
			},
			stroke: {
				width: 1,
				colors: ['#adb5bd']
			},
			dataLabels: {
				enabled: false,
				formatter: function (t) {
					return t + "%"
				},
				offsetY: -25,
				style: {
					fontSize: "12px",
					colors: ["#8c98a5"]
				}
			},
			colors: colors = dataColors ? dataColors.split(",") : colors,
			legend: {
				show: !0,
				horizontalAlign: "center",
				offsetX: 0,
				offsetY: 0
			},
			series: [{
				name: "Last Year",
				data: [2, 1, 3, 1.8, 4.4, 2.6, 6.2, 3.3, 2.6, 1.8, 4.8, 2.6]
			}, {
				name: "This Year",
				data: [2.3, 1.1, 4, 3.1, 6.4, 4.6, 8.2, 6.3, 4.6, 2.8, 6.8, 3.6]
			}
			],
			xaxis: {
				categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				position: "top",
				labels: {
					offsetY: 0

				},
				axisBorder: {
					show: !1
				},
				axisTicks: {
					show: !1
				},
				crosshairs: {
					fill: {
						type: "gradient",
						gradient: {
							colorFrom: "#D8E3F0",
							colorTo: "#BED1E6",
							stops: [0, 100],
							opacityFrom: .4,
							opacityTo: .5
						}
					}
				},
				tooltip: {
					enabled: !0,
					offsetY: -10
				}
			},
			fill: {
				gradient: {
					enabled: !1,
					shade: "light",
					type: "horizontal",
					shadeIntensity: .25,
					gradientToColors: void 0,
					inverseColors: !0,
					stops: [50, 0, 100, 100]
				}
			},
			yaxis: {
				axisBorder: {
					show: !1
				},
				axisTicks: {
					show: !1
				},
				labels: {
					show: !1,
					formatter: function (t) {
						return t + "%"
					}

				}
			},
			grid: {
				row: {
					colors: ["transparent", "transparent"],
					opacity: .2
				},
				borderColor: "#f1f3fa"
			}
		};

		var chart = new ApexCharts(
			document.querySelector("#earning_report"),
			options
		);

		chart.render();
	},


		Dashboard.prototype.initMaps = function () {

			// World Map
			const map = new jsVectorMap({
				map: 'world',
				selector: '#world-map-markers',
				zoomOnScroll: false,
				zoomButtons: true,
				markersSelectable: true,
				markers: [
					{ name: "Greenland", coords: [72, -42] },
					{ name: "Canada", coords: [56.1304, -106.3468] },
					{ name: "Brazil", coords: [-14.2350, -51.9253] },
					{ name: "Egypt", coords: [26.8206, 30.8025] },
					{ name: "Russia", coords: [61, 105] },
					{ name: "China", coords: [35.8617, 104.1954] },
					{ name: "United States", coords: [37.0902, -95.7129] },
					{ name: "Norway", coords: [60.472024, 8.468946] },
					{ name: "Ukraine", coords: [48.379433, 31.16558] },
				],
				markerStyle: {
					initial: { fill: "#3980c0" },
					selected: { fill: "#3980c06e" }
				},
				labels: {
					markers: {
						render: marker => marker.name
					}
				}
			});
		},

		//initializing various components and plugins
		Dashboard.prototype.init = function () {
			var $this = this;

			// init charts
			this.initCharts();
			this.initMaps();
		},

		//init flotchart
		$.Dashboard = new Dashboard, $.Dashboard.Constructor = Dashboard
}(window.jQuery),

	//initializing Dashboard
	function ($) {
		"use strict";
		$(document).ready(function (e) {
			$.Dashboard.init();
		});
	}(window.jQuery);
