<%@page import="com.Fertilizer.utility.NumToWord"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="java.util.Formatter"%>
<%@page import="javax.sound.midi.Soundbank"%>
<%@page import="com.itextpdf.text.pdf.codec.Base64.OutputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.awt.Desktop"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.util.List"%>
<%@ page import="com.itextpdf.text.Element"%>
<%@page import="java.util.List"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.pdf.PdfGState"%>

<%
	response.setContentType("application/pdf");
	 Long billno = (Long) session.getAttribute("FertilizerCrditCustBillNo");
	 //String creditCustomerName = (String) session.getAttribute("creditCustomerName"); 
 
	int a = 1;
	Double sum = 0d;
	Double tax = 0d;
	String taxVal = "";
	Double swachaTax = 0d;
	Double groTOT = 0d;
	String xx1 = "";
	String grossT = "";
	double iGST = 0d;
	double GST = 0d;
	double gstTotal =0d;
	double igstTotal =0d;
	Connection conn = null;

	try {

		// step 1
		Document document = new Document();

		// step 2

		PdfWriter.getInstance(document, response.getOutputStream());

		// step 3
		document.open();

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fertilizer", "root", "root");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select customer_details.first_name, customer_details.middle_name, customer_details.last_name ,fertilizer_billing.product_name, fertilizer_billing.village, fertilizer_billing.company, fertilizer_billing.weight, fertilizer_billing.quantity, fertilizer_billing.salePriceWithoutTax, fertilizer_billing.total_per_product, fertilizer_billing.total_all_product, fertilizer_billing.transportation_expense, fertilizer_billing.hamali_expense, fertilizer_billing.gross_total,fertilizer_billing.total_per_product, insert_date,fertilizer_billing.tax_percentage,fertilizer_billing.hsn,fertilizer_billing.igstPercentage  from fertilizer_billing  left join customer_details on fertilizer_billing.fk_customer_id = customer_details.pk_customer_id where bill_no =" + billno);

		rs.first();
		
		System.out.println("Query Execute");
		Date d1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("E");
		SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss  ");
		sdf2.setTimeZone(TimeZone.getTimeZone("IST"));

		Date billDate = new Date();
		SimpleDateFormat dateFormater = new SimpleDateFormat("dd-MM-yyyy");
		String StrBillDate = dateFormater.format(billDate);
		
		Date FertilizerBillDate = rs.getDate("insert_date");
		String strFertilizerBillDate = dateFormater.format(FertilizerBillDate);

		String stdver1 = (String) sdf.format(d1);
		String day = sdf1.format(d1.getDate());
		String Time = sdf2.format(d1.getTime());
		String dtfinl = stdver1;

		DecimalFormat df = new DecimalFormat("#.00");

		Font font15Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
		Font font15BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font12NoBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font font12BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);

		Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);

		Font Normalfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);

		// step 4

		PdfPTable table = new PdfPTable(3);
		table.setWidthPercentage(100);

		float[] columnWidths = { 0.2f, 0.3f, 0.2f };
		table.setWidths(columnWidths);

		PdfPCell table_cell;

		table_cell = new PdfPCell(new Phrase("Bill Cash/Credit Memorandum", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		//String shree = PropertiesHelper.marathiProperties.getProperty("firstName");
		table_cell = new PdfPCell(new Phrase("Subject To Bhainsa Jurisdiction"));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Fertilizers L.No.", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		//-----------------

		table_cell = new PdfPCell(new Phrase("GSTIN - 36BUPPK8280A1ZF", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Tax Invoice", font15Bold));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("ADB/17/ADA/FR/2013/9132", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		//--------

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("OM SAI AGRO AGENCIES", font15Bold));
		table_cell.setBorder(table_cell.NO_BORDER);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Cell - 9063926999, 9848059684",Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		
		//-------------

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("  DEALERS IN: Seeds,Pesticides & Fertilizers", Normalfont11));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(table_cell.NO_BORDER);
		table.addCell(table_cell);
		
		//-------------

		table_cell = new PdfPCell(new Phrase("Bill No: " + billno));
		table_cell.setBorder(Rectangle.BOTTOM);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Vill: UMRI(K). Mdi: Tanoor, Dist: Nirmal(T.S.)", Normalfont11));
		table_cell.setBorder(Rectangle.BOTTOM);
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(""));
		table_cell.setBorder(Rectangle.BOTTOM);
		table_cell.setPaddingBottom(20f);
		table.addCell(table_cell);

		document.add(table);

		/* table for customer name, village and date */

		PdfPTable smallTable = new PdfPTable(3);
		smallTable.setWidthPercentage(100);

		float[] smallTablecolumnWidths = { 0.4f, 0.2f, 0.2f };
		smallTable.setWidths(smallTablecolumnWidths);

		PdfPCell table_cell2;
		
		
		//String custName = String.valueOf(rs.getString("customer_name"));
		
		String fname = String.valueOf(rs.getString("first_name"));
		String mname = String.valueOf(rs.getString("middle_name"));
		String lname = String.valueOf(rs.getString("last_name"));
		
		String CreditCustomerName = fname + " " + mname + " " +lname;

		table_cell2 = new PdfPCell(new Phrase("Mr. " +CreditCustomerName , font12));
		table_cell2.setBorder(table_cell.NO_BORDER);
		smallTable.addCell(table_cell2);

		

		String expenses = String.valueOf(rs.getString("transportation_expense"));
		String HamaliExpence = String.valueOf(rs.getString("hamali_expense"));
		
		String gross_total = String.valueOf(rs.getString("gross_total"));

		table_cell2 = new PdfPCell(new Phrase("Village: " + rs.getString("village")));
		table_cell2.setBorder(table_cell.NO_BORDER);
		table_cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);
		smallTable.addCell(table_cell2);

		table_cell2 = new PdfPCell(new Phrase("Date: " + strFertilizerBillDate));
		table_cell2.setBorder(table_cell.NO_BORDER);
		table_cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);
		smallTable.addCell(table_cell2);

		document.add(smallTable);
		document.add(new Paragraph(" "));
		//Middle table

		PdfPTable table3 = new PdfPTable(10);
		table3.setWidthPercentage(100);

		float[] columnWidths3 = { 0.3f, 0.3f,0.2f, 0.2f, 0.1f, 0.2f, 0.2f, 0.2f,0.2f, 0.3f };
		table3.setWidths(columnWidths3);

		PdfPCell table_cell3;

		table_cell3 = new PdfPCell(new Phrase("Goods Details", font12));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("Company", font12));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("HSN", font12));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("Pkg(Kg)", font12));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("Qty", font12));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("Rate", font12));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("CGST %", font12));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		
		table_cell3 = new PdfPCell(new Phrase("SGST %", font12));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("IGST %", font12));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("Amount", font12));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		
		table_cell3 = new PdfPCell(new Phrase("\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		rs.beforeFirst();
		
		while (rs.next()) {
			String product_name = rs.getString("product_name");
			table_cell3 = new PdfPCell(new Phrase(product_name, font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);

			String manufacturing_company = rs.getString("company");
			table_cell3 = new PdfPCell(new Phrase(manufacturing_company, font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);

			String hsnNumber = rs.getString("hsn");
			table_cell3 = new PdfPCell(new Phrase(hsnNumber, font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			double weight = rs.getDouble("weight");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(weight), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);

			int quantity = rs.getInt("quantity");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(quantity), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			
			BigDecimal salePrice = rs.getBigDecimal("salePriceWithoutTax", 2);
			
			//double totalAmtOfProduct = (quantity * salePrice);

			String sale_price = String.valueOf(rs.getString("salePriceWithoutTax"));
			table_cell3 = new PdfPCell(new Phrase(sale_price, font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
		
			
		    GST = rs.getDouble("tax_percentage");
			double half = 2;
			double halfGST = GST/half;
			
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(halfGST), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(halfGST), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			iGST = rs.getDouble("igstPercentage");
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(iGST), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			
			double salep = rs.getDouble("salePriceWithoutTax");
			/* double taxAmount = (GST/100)*(salep);
			double newSalePrice = salep + taxAmount; */
			double total =  salep * quantity;
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(total), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			if( iGST == 5 || iGST == 12 || iGST == 18 || iGST == 28){
				double taxAmount = (iGST/100)*(salep);
				//double newSalePrice = salep + taxAmount;
				double igstAmount = taxAmount * quantity;
				 igstTotal = igstTotal + igstAmount;
				 System.out.println("igstTotal = = ="+igstTotal);
			}
			 if(GST == 5.00 || GST == 12.00 || GST == 18.00 || GST == 28.00){
				double taxAmount = (GST/100)*(salep);
				//double newSalePrice = salep + taxAmount;
				double gstAmount = taxAmount * quantity;
				gstTotal = gstTotal + gstAmount;
				System.out.println("gstTotal = = ="+gstTotal);
			}
		}

		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n\n"));
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		

		//-----------------------------------

		double halfGstTotal = (gstTotal)/2;
		
		table_cell3 = new PdfPCell(new Phrase("CGST Total Amount", font13Bold));
		table_cell3.setColspan(9);
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setPaddingBottom(5f);
		table_cell3.setPaddingTop(5f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase(df.format(halfGstTotal), font13Bold));
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setPaddingBottom(5f);
		table_cell3.setPaddingTop(5f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		
		table_cell3 = new PdfPCell(new Phrase("SGST Total Amount", font13Bold));
		table_cell3.setColspan(9);
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setPaddingBottom(5f);
		table_cell3.setPaddingTop(5f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase(df.format(halfGstTotal), font13Bold));
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setPaddingBottom(5f);
		table_cell3.setPaddingTop(5f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("IGST Total Amount", font13Bold));
		table_cell3.setColspan(9);
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setPaddingBottom(5f);
		table_cell3.setPaddingTop(5f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase(df.format(igstTotal), font13Bold));
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setPaddingBottom(5f);
		table_cell3.setPaddingTop(5f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("Transportation Expense", font13Bold));
		table_cell3.setColspan(9);
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setPaddingBottom(5f);
		table_cell3.setPaddingTop(5f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase(df.format(Double.parseDouble(expenses)), font13Bold));
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setPaddingBottom(5f);
		table_cell3.setPaddingTop(5f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("Hamali Expense", font13Bold));
		table_cell3.setColspan(9);
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setPaddingBottom(5f);
		table_cell3.setPaddingTop(5f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase(df.format(Double.parseDouble(HamaliExpence)), font13Bold));
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setPaddingBottom(5f);
		table_cell3.setPaddingTop(5f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("Gross Total(Including Tax)", font13Bold));
		table_cell3.setColspan(9);
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setPaddingBottom(5f);
		table_cell3.setPaddingTop(5f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase(df.format(Double.parseDouble(gross_total)), font13Bold));
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setPaddingBottom(5f);
		table_cell3.setPaddingTop(5f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		// Gross Total in Words
		long totalInLong = Math.round(Double.parseDouble(gross_total));
		String grossTotal = String.valueOf(totalInLong);
		int grossTotalInInteger = Integer.parseInt(grossTotal);
		NumToWord w = new NumToWord();
		String amtInWord = w.convert(grossTotalInInteger);

		table_cell3 = new PdfPCell(new Phrase("\n Rupees in words : "
				+ amtInWord + " Only/-\n "));
		table_cell3.setColspan(10);
		table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell3.setPaddingBottom(1f);
		table_cell3.setPaddingTop(1f);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n Goods once sold can not be taken back", font12NoBold));
		table_cell3.setColspan(10);
		table_cell3.setHorizontalAlignment(Element.ALIGN_JUSTIFIED);
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.TOP);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n\n\n Customer Sign                    (Agriculture Use Only)                From OM SAI AGRO AGENCIES", font12NoBold));
		table_cell3.setColspan(10);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);

		document.add(table3);
		// step 5 

		rs.close();
		stmt.close();
		conn.close();
		document.close();

	} catch (DocumentException de) {
		throw new IOException(de.getMessage());
	}
%>



