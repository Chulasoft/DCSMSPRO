<%-- 
    Document   : newjsp
    Created on : May 17, 2017, 6:00:31 PM
    Author     : Jab-PC
--%>

<%@page import="DSST.Model.Model"%>
<%@page import="DSST.Model.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <thead>
                <tr style="text-align: center">
                    <th colspan="3"></th>
                        <%
                            ArrayList<Project> list = (ArrayList) request.getAttribute("list");
                            int oldSc_id = list.get(0).getSc_id();
                            int stop = -1;
                            for (int i = 0; stop != 0; i++) {
                                if (oldSc_id != list.get(i).getSc_id()) {
                                    stop++;
                                } else {
                        %>
                    <th><%=list.get(i).getAl_name()%></th>
                        <%
                                }
                            }
                        %>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Project> table = (ArrayList) request.getAttribute("table");
                    Model m = new Model();
                    int after = 0;
                    ArrayList<Model> mcri = new ArrayList();
                    int count = 0;
                    for (Project cri : table) {
                        if (after == 0 || after != cri.getCRI_ID()) {
                            mcri = m.getSubCriteriaByID(cri.getCRI_ID());
                        }
                        if (cri.getCRI_TYPE() == 1) {
                %>
                <tr>
                    <td rowspan = "<%=mcri.size() + 1%>"><%=cri.getCRITERIA_NAME()%></td>
                    <%
                    } else {
                        if (after == cri.getCRI_ID()) {
                    %>
                <tr>
                    <%
                        }
                    %>
                    <td><%=cri.getCRITERIA_NAME()%></td>
                    <td><%=cri.getGLOBAL_WEIGHT()%></td>
                     <%
                        while (count< list.size()) {
                            
                            if (oldSc_id != list.get(count).getSc_id()) {
                            oldSc_id = list.get(count).getSc_id();
                            break ;
                        }
                            System.out.print(count +" : ");
                            System.out.println(list.get(count).getSc_id());
                            
                    %>
                    <td><%=list.get(count).getWeight()%></td>
                    <%
                        count++;
                        }
                    %>
                </tr>
                </tr>
                <%
                        }
                        after = cri.getCRI_ID();
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
