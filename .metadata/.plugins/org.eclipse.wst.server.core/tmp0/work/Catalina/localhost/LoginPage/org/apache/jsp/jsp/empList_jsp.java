/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.24
 * Generated at: 2024-07-04 12:49:34 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.login.dao.EmpDao;
import com.login.hibernate.Employee;
import java.util.List;

public final class empList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/jsp/nav.jsp", Long.valueOf(1717237377103L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.login.dao.EmpDao");
    _jspx_imports_classes.add("com.login.hibernate.Employee");
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("<title>Logout Page</title>\r\n");
      out.write("<!-- Bootstrap CSS -->\r\n");
      out.write("<link\r\n");
      out.write("\thref=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\"\r\n");
      out.write("\trel=\"stylesheet\">\r\n");
      out.write("<script src=\"/LoginPage/js/view.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("\thref=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css\">\r\n");
      out.write("<style>\r\n");
      out.write(".navbar {\r\n");
      out.write("\tbackground-color: #333;\r\n");
      out.write("\tpadding: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".navbar a {\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\tpadding: 14px 20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#hover:hover {\r\n");
      out.write("\tbackground: #ddd;\r\n");
      out.write("\tcolor: black;\r\n");
      out.write("\tborder-radius: 5px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".navbar .nav-link, .navbar .btn {\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\tpadding: 14px 20px;\r\n");
      out.write("\tborder: none;\r\n");
      out.write("\tbackground: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".navbar .btn {\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".container {\r\n");
      out.write("\tpadding: 20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dropdown .sub-menu {\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\ttop: calc(100% + 5px);\r\n");
      out.write("\tleft: 0;\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\tbackground-color: #30363f;\r\n");
      out.write("\tbox-shadow: 0 0 5px rgba(0, 0, 0, 0.25);\r\n");
      out.write("\tz-index: 1;\r\n");
      out.write("\ttransform-origin: top;\r\n");
      out.write("\ttransform: scaleY(0);\r\n");
      out.write("\tvisibility: hidden;\r\n");
      out.write("\topacity: 0;\r\n");
      out.write("\ttransition: all 0.5s ease;\r\n");
      out.write("\tdisplay: flex;\r\n");
      out.write("\tflex-direction: column;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dropdown:hover .sub-menu {\r\n");
      out.write("\topacity: 1;\r\n");
      out.write("\ttransform: scaleY(1);\r\n");
      out.write("\tvisibility: visible;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dropdown .sub-menu a {\r\n");
      out.write("\tpadding: 10px 24px;\r\n");
      out.write("\tcolor: #fff;\r\n");
      out.write("\tdisplay: block;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dropdown .sub-menu span {\r\n");
      out.write("\tbackground-image: linear-gradient(#fff, #fff);\r\n");
      out.write("\tbackground-size: 0 1px;\r\n");
      out.write("\tbackground-repeat: no-repeat;\r\n");
      out.write("\tbackground-position: 0 100%;\r\n");
      out.write("\ttransition: background-size 0.5s ease;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dropdown .sub-menu li:hover>a>span {\r\n");
      out.write("\tbackground-size: 100% 1px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".dropdown .sub-menu i {\r\n");
      out.write("\ttransform: rotate(-90deg);\r\n");
      out.write("\tright: 24px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".sub-menu li {\r\n");
      out.write("\tlist-style-type: none;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">\r\n");
      out.write("\t\t<a class=\"navbar-brand\" href=\"#\">Employee Management</a>\r\n");
      out.write("\t\t<div class=\"collapse navbar-collapse\" id=\"navbarNav\">\r\n");
      out.write("\t\t\t<ul class=\"navbar-nav\">\r\n");
      out.write("\t\t\t\t<li class=\"nav-item\"><a id=\"hover\" class=\"nav-link\"\r\n");
      out.write("\t\t\t\t\thref=\"employeeDetails.jsp\">Add Employee</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"nav-item\"><a id=\"hover\" class=\"nav-link\"\r\n");
      out.write("\t\t\t\t\thref=\"empList.jsp\">Employee List</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"nav-item dropdown\"><a id=\"hover\" class=\"nav-link\"\r\n");
      out.write("\t\t\t\t\thref=\"editEmp.jsp\">Edit Employee <i class=\"fa-solid fa-chevron-down\"></i></a>\r\n");
      out.write("\t\t\t\t\t<ul class=\"sub-menu\">\r\n");
      out.write("\t\t\t\t\t\t<li><a id=\"hover\" href=\"updateEmp.jsp\"><span>Update</span></a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a id=\"hover\" href=\"deletEmp.jsp\"><span>Delete</span></a></li>\r\n");
      out.write("\t\t\t\t\t</ul></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\t<ul class=\"navbar-nav ml-auto\">\r\n");
      out.write("\t\t\t\t<li class=\"nav-item\">\r\n");
      out.write("\t\t\t\t\t<button class=\"btn btn-outline-light\" onclick=\"logout();\">Logout</button>\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</nav>\r\n");
      out.write("\t<script src=\"https://kit.fontawesome.com/595a890311.js\"\r\n");
      out.write("\t\tcrossorigin=\"anonymous\"></script>\r\n");
      out.write("\t<!-- Bootstrap JS and jQuery -->\r\n");
      out.write("\t<script\r\n");
      out.write("\t\tsrc=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\r\n");
      out.write("\t<script\r\n");
      out.write("\t\tsrc=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script>\r\n");
      out.write("\t<script\r\n");
      out.write("\t\tsrc=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\r\n");
      out.write("\t<!-- Your JavaScript code -->\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"ISO-8859-1\">\r\n");
      out.write("<title>Employee List</title>\r\n");
      out.write("<link href=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.2/font/bootstrap-icons.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<style>\r\n");
      out.write("body {\r\n");
      out.write("    padding: 50px;\r\n");
      out.write("    justify-content: center;\r\n");
      out.write("    align-items: center;\r\n");
      out.write("}\r\n");
      out.write(".table {\r\n");
      out.write("    margin-bottom: 100px;\r\n");
      out.write("}\r\n");
      out.write(".mb-4 {\r\n");
      out.write("    margin-right: 30px;\r\n");
      out.write("}\r\n");
      out.write(".box {\r\n");
      out.write("    padding: 0;\r\n");
      out.write("    position: absolute;\r\n");
      out.write("    left: 90%;\r\n");
      out.write("}\r\n");
      out.write(".btn-lg-custom {\r\n");
      out.write("    padding: 15px 30px;\r\n");
      out.write("    font-size: 18px;\r\n");
      out.write("}\r\n");
      out.write(".search-container {\r\n");
      out.write("    display: flex;\r\n");
      out.write("    justify-content: space-between;\r\n");
      out.write("    align-items: center;\r\n");
      out.write("    margin-bottom: 20px;\r\n");
      out.write("}\r\n");
      out.write(".input-group {\r\n");
      out.write("    width: 300px;\r\n");
      out.write("    position: relative;\r\n");
      out.write("}\r\n");
      out.write(".input-group input {\r\n");
      out.write("    padding-right: 40px;\r\n");
      out.write("}\r\n");
      out.write(".input-group .input-group-append {\r\n");
      out.write("    position: absolute;\r\n");
      out.write("    right: 0;\r\n");
      out.write("    top: 0;\r\n");
      out.write("    height: 100%;\r\n");
      out.write("}\r\n");
      out.write(".input-group .btn {\r\n");
      out.write("    height: 100%;\r\n");
      out.write("    border-top-left-radius: 0;\r\n");
      out.write("    border-bottom-left-radius: 0;\r\n");
      out.write("}\r\n");
      out.write(".container {\r\n");
      out.write("    margin-top: 20px;\r\n");
      out.write("}\r\n");
      out.write(".btn:hover {\r\n");
      out.write("    color: #fff;\r\n");
      out.write("}\r\n");
      out.write(".input-text:focus {\r\n");
      out.write("    box-shadow: 0px 0px 0px;\r\n");
      out.write("    border-color: #f8c146;\r\n");
      out.write("    outline: 0px;\r\n");
      out.write("}\r\n");
      out.write(".form-control {\r\n");
      out.write("    border: 1px solid #f8c146;\r\n");
      out.write("}\r\n");
      out.write(".input-group-append #search {\r\n");
      out.write("    height: 38px;\r\n");
      out.write("    width: 60px;\r\n");
      out.write("    display: flex;\r\n");
      out.write("    align-items: center;\r\n");
      out.write("    justify-content: center;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    function redirectToupdateEmp() {\r\n");
      out.write("        window.location = \"editEmp.jsp\";\r\n");
      out.write("    }\r\n");
      out.write("    function redirectTosignup() {\r\n");
      out.write("        window.location = \"employeeDetails.jsp\";\r\n");
      out.write("    }\r\n");
      out.write("    function searchTable() {\r\n");
      out.write("        var input, filter, table, tr, td, i, j, txtValue;\r\n");
      out.write("        input = document.getElementById(\"myInput\");\r\n");
      out.write("        filter = input.value.toUpperCase();\r\n");
      out.write("        table = document.getElementById(\"empTable\");\r\n");
      out.write("        tr = table.getElementsByTagName(\"tr\");\r\n");
      out.write("\r\n");
      out.write("        for (i = 1; i < tr.length; i++) {\r\n");
      out.write("            tr[i].style.display = \"none\";\r\n");
      out.write("            td = tr[i].getElementsByTagName(\"td\");\r\n");
      out.write("            for (j = 0; j < td.length; j++) {\r\n");
      out.write("                if (td[j]) {\r\n");
      out.write("                    txtValue = td[j].textContent || td[j].innerText;\r\n");
      out.write("                    if (txtValue.toUpperCase().indexOf(filter) > -1) {\r\n");
      out.write("                        tr[i].style.display = \"\";\r\n");
      out.write("                        break;\r\n");
      out.write("                    }\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <h1>Employee List</h1>\r\n");
      out.write("    <div class=\"search-container\">\r\n");
      out.write("        <button class=\"btn btn-primary btn-lg-custom\" onclick=\"redirectTosignup();\">ADD</button>\r\n");
      out.write("        <div class=\"input-group\">\r\n");
      out.write("            <input type=\"text\" id=\"myInput\" class=\"form-control\" onkeyup=\"searchTable()\" placeholder=\"Search for employees...\">\r\n");
      out.write("            <div class=\"input-group-append\">\r\n");
      out.write("                <span class=\"input-group-text\"><i class=\"bi bi-search\"></i></span>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <table id=\"empTable\" class=\"table table-striped table-bordered mt-4\">\r\n");
      out.write("        <thead class=\"thead-dark\">\r\n");
      out.write("            <tr>\r\n");
      out.write("                <th>ID</th>\r\n");
      out.write("                <th>User Name</th>\r\n");
      out.write("                <th>Password</th>\r\n");
      out.write("                <th>Email</th>\r\n");
      out.write("                <th>Designation</th>\r\n");
      out.write("                <th>Salary</th>\r\n");
      out.write("                <th>Mobile Number</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </thead>\r\n");
      out.write("        <tbody>\r\n");
      out.write("            ");

                EmpDao empDao = new EmpDao();
                List<Employee> empList = empDao.getAllEmpDetails();
                if (empList != null && !empList.isEmpty()) {
                    for (Employee emp : empList) {
            
      out.write("\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td><label id=\"empId\">");
      out.print( emp.getId() );
      out.write("</label></td>\r\n");
      out.write("                <td><label id=\"nameId\">");
      out.print( emp.getuserName() );
      out.write("</label></td>\r\n");
      out.write("                <td><label id=\"passId\">");
      out.print( emp.getPassword() );
      out.write("</label></td>\r\n");
      out.write("                <td><label id=\"mailId\">");
      out.print( emp.getEmail() );
      out.write("</label></td>\r\n");
      out.write("                <td><label id=\"desId\">");
      out.print( emp.getDesignation() );
      out.write("</label></td>\r\n");
      out.write("                <td><label id=\"salId\">");
      out.print( emp.getSalary() );
      out.write("</label></td>\r\n");
      out.write("                <td><label id=\"numId\">");
      out.print( emp.getNumber() );
      out.write("</label></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            ");

                    }
                } else {
            
      out.write("\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td colspan=\"7\">No employees found.</td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            ");

                }
            
      out.write("\r\n");
      out.write("        </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("    <div class=\"box\">\r\n");
      out.write("        <button class=\"btn btn-primary btn-lg-custom\" onclick=\"redirectToupdateEmp();\">Edit</button>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- Bootstrap JS and jQuery -->\r\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script>\r\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
