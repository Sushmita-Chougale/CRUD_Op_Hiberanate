/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.24
 * Generated at: 2024-05-25 09:55:12 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class userLogin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>Login Page</title>\r\n");
      out.write("    <!-- Bootstrap CSS -->\r\n");
      out.write("    <link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"/LoginPage/js/view.js\"></script>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css\"\r\n");
      out.write("        integrity=\"sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==\"\r\n");
      out.write("        crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\">\r\n");
      out.write("    <script>\r\n");
      out.write("        function redirectTosignup() {\r\n");
      out.write("            window.open(\"/LoginPage/jsp/employeeDetails.jsp\")\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
      out.write("    <style>\r\n");
      out.write("        body {\r\n");
      out.write("            background-image: url('https://mdbootstrap.com/img/new/standard/nature/111.jpg'); \r\n");
      out.write("            background-size: cover;\r\n");
      out.write("            background-repeat: no-repeat;\r\n");
      out.write("            background-attachment: fixed;\r\n");
      out.write("            background-position: center;\r\n");
      out.write("            font-family: 'Arial', sans-serif;\r\n");
      out.write("            color: #333;\r\n");
      out.write("        }\r\n");
      out.write("        .container {\r\n");
      out.write("            max-width: 500px;\r\n");
      out.write("            background:  transparent;\r\n");
      out.write("            border:2px solid rgba(255,255,255, .2);\r\n");
      out.write("            backdrop-filter:blur(10px);\r\n");
      out.write("            padding: 40px;\r\n");
      out.write("            border-radius: 10px;\r\n");
      out.write("            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);\r\n");
      out.write("            margin-top: 100px;\r\n");
      out.write("        }\r\n");
      out.write("        .form-control {\r\n");
      out.write("            border-radius: 25px;\r\n");
      out.write("            padding: 10px 20px;\r\n");
      out.write("            border: 1px solid #ced4da;\r\n");
      out.write("        }\r\n");
      out.write("        .form-group label {\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("        }\r\n");
      out.write("        .btn {\r\n");
      out.write("            border-radius: 25px;\r\n");
      out.write("            padding: 10px 20px;\r\n");
      out.write("            font-size: 16px;\r\n");
      out.write("            transition: background-color 0.3s;\r\n");
      out.write("        }\r\n");
      out.write("        .btn-success {\r\n");
      out.write("            background-color: #28a745;\r\n");
      out.write("            border-color: #28a745;\r\n");
      out.write("        }\r\n");
      out.write("        .btn-primary {\r\n");
      out.write("            background-color: #007bff;\r\n");
      out.write("            border-color: #007bff;\r\n");
      out.write("        }\r\n");
      out.write("        .btn:hover {\r\n");
      out.write("            opacity: 0.9;\r\n");
      out.write("        }\r\n");
      out.write("        .text-center {\r\n");
      out.write("            margin-bottom: 30px;\r\n");
      out.write("        }\r\n");
      out.write("        .button-text {\r\n");
      out.write("            display: flex;\r\n");
      out.write("            align-items: center;\r\n");
      out.write("        }\r\n");
      out.write("        .text {\r\n");
      out.write("            margin-left: 10px;\r\n");
      out.write("        }\r\n");
      out.write("        .box {\r\n");
      out.write("            display: flex;\r\n");
      out.write("            justify-content: center;\r\n");
      out.write("            align-items: center;\r\n");
      out.write("            margin-top: 20px;\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("       \r\n");
      out.write("        <div class=\"d-flex align-items-center mb-3 pb-1\">\r\n");
      out.write("                    <i class=\"fas fa-cubes fa-2x me-3\" style=\"color: #ff6219;\"></i>\r\n");
      out.write("                    <span class=\"h1 fw-bold mb-0\">Login</span>\r\n");
      out.write("                  </div>\r\n");
      out.write("\r\n");
      out.write("                  <h5 class=\"fw-normal mb-3 pb-3\" style=\"letter-spacing: 1px;\">Sign into your account</h5>\r\n");
      out.write("        <div class=\"form-group\">\r\n");
      out.write("            <label for=\"username\">User Name: <i class=\"fa-solid fa-user\"></i></label>\r\n");
      out.write("            <input type=\"text\" class=\"form-control\" id=\"username\" name=\"username\" required>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"form-group\">\r\n");
      out.write("            <label for=\"password\">Password: <i class=\"fa-solid fa-lock\"></i></label>\r\n");
      out.write("            <input type=\"password\" class=\"form-control\" id=\"password\" name=\"password\" required>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"pt-1 mb-4\">\r\n");
      out.write("                    <button data-mdb-button-init data-mdb-ripple-init class=\"btn btn-dark btn-lg btn-block\" type=\"button\"class=\"btn btn-success\" onclick=\"login();\">Login</button>\r\n");
      out.write("                  </div>\r\n");
      out.write("        <p class=\"mb-5 pb-lg-2\" style=\"color: black;\">Don't have an account? <a href=\"#!\"\r\n");
      out.write("                      style=\"color: #393f81;\"onclick=\"redirectTosignup();\">Register here</a></p>\r\n");
      out.write("        </div>\r\n");
      out.write("    <!-- Bootstrap JS -->\r\n");
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
