<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Cabbage Corp</title>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<!-- DataTable -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<!-- custom style sheet -->
<link rel="stylesheet" href="main.css">
</head>

<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
	
	<table hidden id="datatable">
    	<thead>
        	<tr>
        		<th></th>
        		<th>Amt In Stock</th>
        		<th>Reorder Amt</th>      		
      		</tr>
    	</thead>
    	<tbody>
    	
    	</tbody>
    </table>
	
	
	<span id="test"></span>
	<div id="stock"></div>
	<div id="profit"></div>
</div>
</body>
<script type="text/javascript">



$(function () {
    $(document).ready(function () {
    	$.ajax({
    		async: false,
			url: "getProducts.do",
			method: "GET",
			success: function(resp) {
				products = JSON.parse(resp);
				$.each(products, function(i, item){
					$("tbody").append("<tr><th>" + item.productName + "</th>" +
					"<td>" + item.quantityOnHand + "</td><td>" + item.reorderQuantity + "</td></tr>");
				})
				$(function () {
				    $('#stock').highcharts({
				        data: {
				            table: 'datatable'
				        },
				        chart: {
				            type: 'column'
				        },
				        title: {
				            text: 'Quantity in Stock'
				        },
				        yAxis: {
				            allowDecimals: false,
				            title: {
				                text: 'Units'
				            }
				        },
				        tooltip: {
				            formatter: function () {
				                return '<b>' + this.series.name + '</b><br/>' +
				                    this.point.y + ' ' + this.point.name;
				            }
				        }
				    });
				});
			},
			error: function() {alert("error in getProducts()")}
		})
        // Build the chart
        $('#profit').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Top 5 Products'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: [{
                    name: products[0].productName,
                    y: 56.33
                }, {      	
                    name: products[1].productName,
                    y: 24.03
                }, {
                    name: products[2].productName,
                    y: 10.38
                }, {
                    name: products[3].productName,
                    y: 4.77
                }, {
                    name: products[4].productName,
                    y: 0.91
                }, {
                    name: 'Other',
                    y: 0.2
                }]
            }]
        });
    });
});
</script>
</html>
