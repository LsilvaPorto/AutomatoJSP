<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String palavra= request.getParameter("palavra");
String resultado;
char[] letras = palavra.toCharArray();
boolean palavraAceita = true;
int estado=0;

for (int i = 0; i < letras.length; i++){
	
	//Q0
	switch(estado){
	
	case 0:
		if (letras[i]== 'a')
			estado=2;
		else
			if(letras[i]=='b')
				estado=1;
			else{
				palavraAceita = false;
				i = letras.length;
			}
		
			break;
			
	//Q1
	case 1:
		if (letras[i]== 'a')
			estado = 1;
		else
			if(letras[i]=='b')
				estado = 0;
			else{
				palavraAceita = false;
				i = letras.length;
			}
			break;			
	//Q2
	case 2:
		if (letras[i]== 'a')
			estado = 4;
		else
			if(letras[i]=='b')
				estado = 3;
			else{
				palavraAceita = false;
				i = letras.length;
			}
			break;			
	//Q3		
	case 3:
		if (letras[i]== 'a')
			estado = 2;
		else
			if(letras[i]=='b')
				estado = 5;
			else{
				palavraAceita = false;
				i = letras.length;
			}
			break;			
	//Q4		
	case 4:
		if (letras[i]== 'a')
			estado = 5;
		else
			if(letras[i]=='b')
				estado = 2;
			else{
				palavraAceita = false;
				i = letras.length;
			}
			break;			
	//Q5		
	case 5:
		if (letras[i]== 'a')
			estado = 3;
		else
			if(letras[i]=='b')
				estado = 4;
			else{
				palavraAceita = false;
				i = letras.length;
			}
			break;			
			
	}
}
if (palavraAceita == true && (estado == 3  || estado == 4))
	resultado = " foi aceita pelo automato";
else
	resultado =" não foi aceita pelo autômato";


%>
<h2>Resultado: </h2>
<h4>A palavra "<%= palavra %>"<%=resultado %></h4>
<h4>Estado Final: Q<%= estado %></h4>
<% palavra=null;%>
</body>
</html>