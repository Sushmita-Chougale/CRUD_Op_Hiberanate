<%@page import="com.Fertilizer.hibernate.TaxCreationBean"%>
<%@page import="com.Fertilizer.dao.TaxCreationDao"%>
<%boolean isHome = false;%>
<%@include file="commons/header.jsp"%>
<head>
<meta charset="utf-8">
<title>Tax Creation</title>
<script type="text/javascript" src="/Fertilizer/staticContent/js/taxCreation.js"></script>
<script type="text/javascript">
function taxlist()
	 {
	 window.location = "taxList.jsp";
	 }
	 function editTax() {
		 window.location = "TaxEdit.jsp";
}

</script>
</head>
 <div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading">Tax Details</h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
<div class="container col-sm-offset-2" >
        <form class="form-horizontal" method="post" action="" name="txc"><!-- Value of 'name' attribute is used in  taxCreation.js  -->
          <fieldset>
          		<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
				</div>
				 <div class="row form-group">
           				<label class="col-md-2 control-label" for="taxType">Tax Type<sup>*</sup></label>  
		           	 <div class="col-md-3">
            			<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
							<%
							TaxCreationDao cdd = new TaxCreationDao();
           						List cList =cdd.getAllTax();
							
							%>
							<input list="cat_drop" id="taxType"  class="form-control">
				<datalist id="cat_drop">
							<%
					           for(int i=0;i<cList.size();i++){
					        	   TaxCreationBean cat=(TaxCreationBean)cList.get(i);
							%>
		
							<option data-value="<%=cat.getTxId()%>" value="<%=cat.getTaxType()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div>

            	<label class="col-md-2 control-label" for="taxPercentage">Tax Percentage<sup>*</sup></label>  
            		<div class="col-md-3">
            			<div class="input-group">
							<span class="input-group-addon">
								%
							</span>
              				
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
							<%
							TaxCreationDao dao = new TaxCreationDao();
           						List taxPerList =dao.getAllTax();
							
							%>
							<input list="tax_per_drop" id="taxPercentage"  class="form-control">
				<datalist id="tax_per_drop">
							<%
					           for(int i=0;i<taxPerList.size();i++){
					        	   TaxCreationBean bean =(TaxCreationBean)taxPerList.get(i);
							%>
		
							<option data-value="<%=bean.getTxId()%>" value="<%=bean.getTaxPercentage()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
					</div>
				</div>
				<div class="form-group row">
           			<div class="col-md-10 text-center">
           			 <!--  txCreation() function is implemented in  taxCreation.js -->
					<input type="button" id="save" name="btn" style="font-size: 25" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="addTax()" value="Submit">
					<input id="save" name="btn" style="font-size: 25" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width"  type="reset"  onclick="reset()" value="Cancel">
					
					<input style=" height: 65px; width: 180; font-size: 25" type="button" value="Tax List" id="listBtn" class="btn btn-primary" onclick="taxlist()" /> 
              		<input style=" height: 65px; width: 180; font-size: 25" type="button" value="Edit" id="listBtn" class="btn btn-primary" onclick="editTax()" /> 
<!--              	 <button id="save" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="addTax()"><h4> Submit</h4></button>
              	<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
            		</div>
          		</div>
			</fieldset>
		</form>
	</div>
	
	<%@include file="commons/newFooter.jsp" %>
	
<%-- <%@include file="commons/footer.jsp" %> --%>