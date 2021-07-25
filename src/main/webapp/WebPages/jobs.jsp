<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html  ng-app="app">
<head>
<meta charset="ISO-8859-1">
<title>Jobs</title>
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
.companies {
     margin-top: 3px !important; 
}
.btn.view-job {
    
    padding: 0.5em 1em !important;
    margin-top: 5px !important;
   
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
	   
	/*******************************getUser****************************************/
   
	   http.get(apiURL+'getJobs').
		success(function(data, status) {
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
	
	   }else{
	     	
	      }      		       		
		}).
		error(function(data,status) {
		     
		});
	   
	   /*******************************Jobs render****************************************/
	   		$(document).ready(function() {
			 jDataTable = $('#Jobstable').DataTable({ 
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
	         				
		             		
	        			},
	        			 {'data': "job_id", 'render':function(job_id){
	        				 if(job_id!=null){
	         				   return '<div class="col-md-12 col-sm-12"><button type="submit" id="edit" class="btn view-job" name="View Job">Apply Job</button></div>';

	         				}
		             		 
		         				
		         				
		         			}}  
	        		
			             	   
	         			
			       
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
		
		$('#Jobstable').on('click','#edit', function () {
	   		
	  		var tr = $(this).closest('tr');
	  		var selectedData = jDataTable.row(tr).data();
	  		$("#User_tab").show();
	  		$("#JobTable").hide();
	   		scope.UserModel =selectedData;
	   		scope.companyname=selectedData.companyName;
	  		scope.$apply();
			}); 
	     
		 scope.submitForm = function(){
			
			   if(typeof scope.apply_job  !== 'undefined'){
	      		 
	     		  if(scope.apply_job.hasOwnProperty("username")){
	     			 scope.username = scope.apply_job.username;
		    	  	 }else{
		    	  		 scope.username ="";
		    	  	   }
	    		  
	    		  if(scope.apply_job.hasOwnProperty("email")){
		    	  		   scope.email = scope.apply_job.email;
		    	  	   }else{
		    	  		   scope.email ="";
		    	  	   }
	    		  if(scope.apply_job.hasOwnProperty("usernumber")){
		  		            scope.usernumber = scope.apply_job.usernumber;
		  	            }else{
		  		             scope.usernumber ="";
		  	            }
			  
	    		  
	      		scope.dataRequest = {
						"username": scope.username,
						"useremail":scope.email,
						"usernumber": scope.username,
						"mJob":scope.UserModel
						
						
			    };
	       	  
				scope.requestedData = {
						"data" : JSON.stringify(scope.dataRequest)

					};
				//VALIDATION
			
		        		
				        http({
						method :'POST',
						url :apiURL+'addUser',
						data :scope.requestedData
						}).success(function(response) {	
		 					if(response.status==1){
		 						
		 						scope.response_message = response.message;
		 						alert(scope.response_message);
								window.location.href = '${pageContext.servletContext.contextPath}/Jobs'; 
		 					
								
							}else if(response.status==0)
							{
								scope.message = response.message;
								alert(scope.message);
								window.location.href = '${pageContext.servletContext.contextPath}/Jobs'; 
							
		 						
							}else{
								scope.message = response.message;
		 						
						    } 
								
		  					      
		 				}).error(function(response) {			 
						});   
					 
			   }
	       };
	   		
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
					<p>Get your Popular jobs <span>{{totalJobs}} New job</span></p>
				</div>
			</div>
		</section>
		
		<section class="jobs">
			<div class="container"  style="width: 95%;"    id="JobTable"> 
				<div class="row heading">
					<h2>Job List</h2>
				</div> 

				<div class="companies">
				<section class="widget">
                  
                    <div class="widget-body">
                    <div class="table-responsive">
                      <table class="table table-striped dataTable  table-lg mt-lg mb-0" id="Jobstable">
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
											<th style=" text-transform: revert; font-size: 15px;">Apply</th>
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
				
				
				
				<div class="container" id="User_tab" name="apply_job" Style="display:none;">
				<div class="col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2">
					<form>
					 <h3>Apply to {{companyname}}</h3>
					 
					  	<input type="text" class="form-control input-lg" ng-model="apply_job.username" placeholder="User Name">
					  	<input type="text" class="form-control input-lg" ng-model="apply_job.usernumber" placeholder="EnterPhone">	
					  	<input type="text" class="form-control input-lg" ng-model="apply_job.email" placeholder="Email id">
					    <button type="submit"ng-click="submitForm()" class="btn btn-primary">Apply</button>
					</form>
					
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