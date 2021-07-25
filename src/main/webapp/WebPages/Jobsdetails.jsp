<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html  ng-app="app">
<head>
<meta charset="ISO-8859-1">
<title>Appied Job</title>
         <!-- All Plugin Css --> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plugins.css">
		
		<!-- Style & Common Css --> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
        
        <!-----------------------------------------------ANGUARJS----------------------------------------------->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
	
        <!---------------------------------- API URL ------------------------------------------------------>
        <script src="${pageContext.request.contextPath}/resources/API_URL.js"></script> 
        
       	<!----------------------------------------------JQUERY------------------------------------------------------>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script> 
        <script src="${pageContext.request.contextPath}/resources/node_modules/jquery/dist/jquery.min.js"></script> 
        
         <!-- Datatables css-->
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet"  type="text/css"/>


		<script type="text/javascript" language="javascript"  src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" language="javascript" src="bootstrap.js"></script>

<style>
.jobs {
    padding: 3px 0;
}
.inner-banner {

    padding: 4% 0;
}
.btn.view-job {
    padding: 0.5em 1em;
    margin-top: 10px;
}
section {
    padding: 30px 0px 40px 0px !important;
}
</style>
<script type="text/javascript">
var jDataTable;
var jData;
var app = angular.module("app", []);
app.controller("GetDataController", ['$scope','$http','$window', function(scope,http,window) {
	
	
	/*******************************getJobLocation****************************************/
   
	    http.get(apiURL+'getJobLocation').
		success(function(data, status) {
		if(data != null)
			{
			if(data.status==1){
		              
				scope.getJobLocation= data.myObjectList;
						
	         }else{}  
	   }else{
	     	
	      }      		       		
		}).
		error(function(data,status) {
		     
		});
		/*******************************getjobsSkill****************************************/
	    
	   http.get(apiURL+'getjobsSkill').
		success(function(data, status) {
		if(data != null)
			{
			if(data.status==1){
		              
				scope.getjobsSkill= data.myObjectList;
						
	         }else{}  
	   }else{
	     	
	      }      		       		
		}).
		error(function(data,status) {
		     
		});
	  
		/*******************************getjobsType****************************************/

	   http.get(apiURL+'getjobsType').
		success(function(data, status) {
		if(data != null)
			{
			if(data.status==1){
		              
				scope.getjobsType= data.myObjectList;

	         }else{}  
	   }else{
	     	
	      }      		       		
		}).
		error(function(data,status) {
		     
		});
	   
	 
		/*******************************render all Applied job****************************************/

	   http.get(apiURL+'getjobapplied').
		success(function(data, status) {
		if(data != null)
			{
			if(data.status==1){
                jData = [];
         		jData= data.myObjectList;
         		scope.joblist=data.myObjectList;
         		scope.totalJobs=data.myObjectList.length;
                jDataTable.clear().rows.add(jData).draw();
        }else{
    	 jData = [];
   	     jDataTable.clear().rows.add(jData).draw();
           } 
	
	   }else{
	     	
	      }      		       		
		}).
		error(function(data,status) {
		     
		});
	   
		/* filter button */
	   scope.btnfilter = function(ReportModel){
		  
		     scope.dataRequest= {
   			      "job_id": ReportModel.joblist.job_id
 			       
   			  }
 	         scope.requestedData = {
		  		     "data" : JSON.stringify(scope.dataRequest)
				      };
 	 
			  http({
					method :'POST',
					url :apiURL+'getjobId',
					data :scope.requestedData
					}).success(function(data,response) {	
		            if(data != null)
			        {
			        if(data.status==1){
                    jData = [];
       		        jData= data.myObjectList;
       		        scope.totalJobs=data.myObjectList.length;
                    jDataTable.clear().rows.add(jData).draw();
                    
				    }else{
				  	 jData = [];
				 	 jDataTable.clear().rows.add(jData).draw();
				    } 
					}else{ }      		       		
				}).
				error(function(data,status) {
				});
	   
 	   
	   };
	   
	   /*********************************Job DATA*************************************/
		$(document).ready(function() {
			 jDataTable = $('#users').DataTable({ 
		 		 	data: jData,
		 		 	columns: [
			         	    {'data':'job_id'},
			                
			             {'data':'job_name', 'render':function(job_name){
	         				
		             		 if(job_name!=null)
	             			 {
		             			if(job_name!=""){
	 	         					return job_name;

		         				}else{
		         					return '<p>__</p>';
		         				}
	             			 }else{
	             				return '<p>__</p>';
	             			 }
	         			}},
			         		{'data':'companyName', 'render':function(companyName){
		         				
		             		 if(companyName!=null)
	             			 {
		             			if(companyName!=""){
	 	         					return companyName
	  	         				}else{
	  	         					return '<p>__</p>';
	  	         				}
	             			 }else{
	             				return '<p>__</p>';
	             			 }
	         			}},
	         			{'data':'job_type', 'render':function(job_type){
	         				
		             		 if(job_type!=null)
	            			 {
		             			if(job_type!=""){
		         					return job_type.name;
	 	         				}else{
	 	         					return '<p>__</p>';
	 	         				}
	            			 }else{
	            				return '<p>__</p>';
	            			 }
	        			}},
	        			{'data':'mlocation', 'render':function(mlocation){
	         				
		             		 if(mlocation!=null)
	            			 {
		             			if(mlocation!=""){
		         					return mlocation.lcity;
	 	         				}else{
	 	         					return '<p>__</p>';
	 	         				}
	            			 }else{
	            				return '<p>__</p>';
	            			 }
	        			}},
	        			{'data':'experience', 'render':function(experience){
	         				
		             		 if(experience !=null)
	            			 {
		             			if(experience!=""){
		             				
		         					return experience;
		         					
	 	         				}else{
	 	         					return experience;
	 	         				}
	            			 }else{
	            				return '<p>__</p>';
	            			 }
	        			}},
	        			{'data':'salary', 'render':function(salary){
	         				
		             		 if(salary !=null)
	            			 {
		             			if(salary!=""){
		             				
		         					return salary;
		         					
		         				}else{
		         					return salary;
		         				}
	            			 }else{
	            				return '<p>__</p>';
	            			 }
	        			}},
	        			
	        			{'data':'description', 'render':function(description){
	         				
		             		 if(description !=null)
	            			 {
		             			if(description!=""){
		             				
		         					return description;
		         					
		         				}else{
		         					return description;
		         				}
	            			 }else{
	            				return '<p>__</p>';
	            			 }
	        			}},
	        			
	        			
	        			
	        			{'data':'emailId', 'render':function(emailId){
	         				
		             		 if(emailId!=null)
	            			 {
		             			if(emailId!=""){
		         					return emailId;
	 	         				}else{
	 	         					return '<p>__</p>';
	 	         				}
	            			 }else{
	            				return '<p>__</p>';
	            			 }
	        			}},
	        			
	        			{  data: 'jobSkill[,].skill_level'
	         				
		             		
	        			}
	        			 
	        		
			            ],
			           buttons: [
			        	    'copy', 'excel', 'pdf'
			        	  ],
		
			 	             "ordering": false,
			 	             "searching": false,
			 	             "deferRender": true,
			 	             "autoWidth": false,
			 	            "lengthChange": false,
			 	             "language": {
			     	    		"infoEmpty": "No records to show",
			         	    	"emptyTable": "no record found",
			     	    	    }
			    	        }); 
		  }); 
			
}]);

</script>
</head>

 <body ng-controller="GetDataController">
	
	<!-- Navigation End  -->
			<%@ include file="sidebar.jsp"%>
		
		<!-- Inner Banner -->
		<section class="inner-banner" style="backend:#242c36 url(https://via.placeholder.com/1920x600)no-repeat;">
			<div class="container"  style="margin-top: 0px;">
				<div class="caption">
                    <h2 style="font-size: 50px;">Online Job Portal</h2>
					<p> <span>{{totalJobs}} Applied job</span></p>
				</div>
			</div>
		</section>
		
		<section class="jobs">
			<div class="container" style="width: 95%;"  id="JobTable"> 
				<div class="row heading">
					<h2>Applied Job</h2>
				</div> 
<form>
						<fieldset>
						
						<div class="col-md-3 col-sm-3 ">
							
							<select class="select2 form-control input-lg" ng-model="add_Job.joblist" ng-options="s as s.job_name for s in joblist track by s.job_id"  id="companyName" required>
						<option value="" disabled selected>Select designation </option></select>
					</div><!-- <div class="col-md-3 col-sm-3 ">
							
							<select class="select2 form-control input-lg" ng-model="add_Job.job_name" ng-options="s as s.job_name for s in joblist track by s.job_id"  id="mVehicleClass" required>
						<option value="" disabled selected>Select Category </option></select>
					</div>
														<div class="col-md-3 col-sm-3 ">
							
							<select class="select2 form-control input-lg" ng-model="add_Job.job_type" ng-options="s as s.name for s in getjobsType track by s.id"  id="mVehicleClass" required>
						<option value="" disabled selected>Select Employment Type </option></select>
							</div>		 -->					
						
							<div class="col-md-3 col-sm-3 ">
								<input type="submit" class="btn btn-lg btn-primary" ng-click="btnfilter(add_Job)" value="Search" />
							</div>
						</fieldset>
					</form>
				<div class="companies">
				<section class="widget">
                  
                    <div class="widget-body">
                    <div class="table-responsive">
                      <table class="table table-striped dataTable  table-lg mt-lg mb-0" id="users">
                      <thead class=" text-primary">
                      <tr>
                                	<th data-visible="false">ID</th>
                                	       <th style=" text-transform: revert; font-size: 15px;">Job Title</th>
											<th style=" text-transform: revert; font-size: 15px;">Company</th>
											<th style=" text-transform: revert; font-size: 15px;">Emploment_type</th>
											
											<th style=" text-transform: revert; font-size: 15px;">Location</th>
											<th style=" text-transform: revert; font-size: 15px;">Experience</th>
											<th style=" text-transform: revert; font-size: 15px;">Salary</th>
											
											<th style=" text-transform: revert; font-size: 15px;">Job Description</th>
											<th style=" text-transform: revert; font-size: 15px;">Email</th>
											 <th style=" text-transform: revert; font-size: 15px;">Skills Required</th>
											
											
						 </tr>
                         </thead>
                       </table>
                        </div>
                        <div class="clearfix">
                     </div>
                    </div>
                </section>
            </div>
					
				</div>
				
			</div>
		</section>


		
		 
		<script type="${pageContext.request.contextPath}/resources/text/javascript" src="js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		<script type="${pageContext.request.contextPath}/resources/text/javascript" src="js/owl.carousel.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootsnav.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    </body>
</html>