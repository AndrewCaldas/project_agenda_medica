<%@page import="DAO.EmpresaDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, java.util.ArrayList, model.Empresa"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Agenda Médica Online - Clínica</title>

	<!-- Imagehover CSS -->
	<link rel="stylesheet" href="../resources/css/imagehover.min.css">
	<!-- Bootstrap -->
	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../resources/css/estilo.css" rel="stylesheet">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript">
			function fMasc(objeto,mascara) {
				obj=objeto
				masc=mascara
				setTimeout("fMascEx()",1)
			}
			function fMascEx() {
				obj.value=masc(obj.value)
			}
			function mTel(tel) {
				tel=tel.replace(/\D/g,"")
				tel=tel.replace(/^(\d)/,"($1")
				tel=tel.replace(/(.{3})(\d)/,"$1)$2")
				if(tel.length == 9) {
					tel=tel.replace(/(.{1})$/,"-$1")
				} else if (tel.length == 10) {
					tel=tel.replace(/(.{2})$/,"-$1")
				} else if (tel.length == 11) {
					tel=tel.replace(/(.{3})$/,"-$1")
				} else if (tel.length == 12) {
					tel=tel.replace(/(.{4})$/,"-$1")
				} else if (tel.length > 12) {
					tel=tel.replace(/(.{4})$/,"-$1")
				}
				return tel;
			}
			function mCNPJ(cnpj){
				cnpj=cnpj.replace(/\D/g,"")
				cnpj=cnpj.replace(/^(\d{2})(\d)/,"$1.$2")
				cnpj=cnpj.replace(/^(\d{2})\.(\d{3})(\d)/,"$1.$2.$3")
				cnpj=cnpj.replace(/\.(\d{3})(\d)/,".$1/$2")
				cnpj=cnpj.replace(/(\d{4})(\d)/,"$1-$2")
				return cnpj
			}
			function mCPF(cpf){
				cpf=cpf.replace(/\D/g,"")
				cpf=cpf.replace(/(\d{3})(\d)/,"$1.$2")
				cpf=cpf.replace(/(\d{3})(\d)/,"$1.$2")
				cpf=cpf.replace(/(\d{3})(\d{1,2})$/,"$1-$2")
				return cpf
			}
			function mCEP(cep){
				cep=cep.replace(/\D/g,"")
				cep=cep.replace(/(\d{5})(\d{1,4})$/,"$1-$2")
				return cep
			}
			function mNum(num){
				num=num.replace(/\D/g,"")
				return num
			}
		</script>
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse navbar-transparente">
	<div class="container">
		<!-- Header -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#barra-navegacao">
				<span class="sr-only">Alterar menu</span> <span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a href="index.jsp" class="navbar-brand" style="color: white;" class="sombra"><b>Agenda</b></span> Medica<span style="font-size: 10px"> Online</span></a>
		</div>

		<div class="collapse navbar-collapse" id="barra-navegacao">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="#">Contato</a></li>
				<li><a href="#">Ajuda</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> Minha Conta <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Editar</a></li>
						<li><a href="index.jsp">Logout</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="container">
		<%
			Empresa empresa = (Empresa) session.getAttribute("EMPRESA");
			if (empresa == null) {
				empresa = new Empresa();
			}

			EmpresaDAOImpl empresaDAOImpl = new EmpresaDAOImpl();
			String msg = (String) session.getAttribute("MENSAGEM");
			if (msg != null) {
		%>
		<h3 style="color: red;"><%=msg%></h3>
		<%
			session.setAttribute("MENSAGEM", null);
			}
		%>

		<!-- Cadastro -->
		<div class="capa">
			<div class="col-sm-8 card-box">
				<h3 class="text">
					<b>Cadastramento Clínica</b>
				</h3>
				<br> <br>
				<form action="../empresaController" method="post">
					<!-- campo ID do registro -->
					<div hidden>
						<input type="text" name="id" class="form-control" value="<%=empresa.getId() %>">
					</div>
					
					<!-- Nome -->
                	<div class="form-group">
                  		<label for="nome">*Nome da Clínica:</label>
                  		<input type="text" name="nome" class="form-control" value="<%=empresa.getNome() %>">
                	</div>

	                <div class="row">
    	                <!-- cpf -->
        	            <div class="form-group col-md-6">
            	         	<label for="cnpj">*CNPJ:</label>
                	     	<input type="text" name="cnpj" class="form-control" maxlength="18" onkeydown="javascript: fMasc( this, mCNPJ );" value="<%=empresa.getCnpj() %>">
                    	 	<small id="CNPJHelp" class="form-text text-muted">Preenchimento do CNPJ, é obrigatorio!</small>
                    	</div>

                    	<!-- CEP -->
                    	<div class="form-group col-md-6">
                      		<label for="cep">*CEP:</label>
                      		<input type="text" name="cep" class="form-control" maxlength="9" onkeydown="javascript: fMasc( this, mCEP );" value="<%=empresa.getCep() %>">
                    	</div>
                	</div>

                	<!-- endereço -->
                	<div class="form-group">
                  		<label for="end">*Endereço:</label>
                  		<input type="text" name="end" class="form-control" placeholder="ex: Rua Aguiar Meira" value="<%=empresa.getEnd() %>">
                  		<small id="endereçoHelp" class="form-text text-muted">Insira um endereço existente, por favor.</small>
                	</div>

                	<!-- bairro -->
                	<div class="form-group">
                  		<label for="nome">*Bairro:</label>
                  		<input type="text" name="bairro" class="form-control" value="<%=empresa.getBairro() %>">
                	</div>

                	<div class="row">
                		<!-- cidade -->
                		<div class="form-group col-md-6">
                  			<label for="cidade">*Cidade:</label>
                  			<input type="text" name="cidade" class="form-control" value="<%=empresa.getCidade() %>">
                		</div>

                		<!-- estado-->
                		<div class="form-group col-md-4">
		                	<label>*Estado:</label>
    	              		<br>
        	          		<select name="estado"> 
            	          		<option value="estado">Selecione o Estado</option>
								<option value="Acre" <%=empresa.getEstado().equals("Acre")?"selected" : ""%>>Acre</option>
								<option value="Alagoas" <%=empresa.getEstado().equals("Alagoas")?"selected" : ""%>>Alagoas</option>
								<option value="Amazonas" <%=empresa.getEstado().equals("Amazonas")?"selected" : ""%>>Amazonas</option>
								<option value="Amapa" <%=empresa.getEstado().equals("Amapa")?"selected" : ""%>>Amapá</option>
								<option value="Bahia" <%=empresa.getEstado().equals("Bahia")?"selected" : ""%>>Bahia</option>
								<option value="Ceara" <%=empresa.getEstado().equals("Ceara")?"selected" : ""%>>Ceará</option>
								<option value="Distrito" <%=empresa.getEstado().equals("Distrito")?"selected" : ""%>>Distrito Federal</option>
								<option value="Espirito Santo" <%=empresa.getEstado().equals("Espirito Santo")?"selected" : ""%>>Espírito Santo</option>
								<option value="Goias" <%=empresa.getEstado().equals("Goias")?"selected" : ""%>>Goiás</option>
								<option value="Maranhao" <%=empresa.getEstado().equals("Maranhao")?"selected" : ""%>>Maranhão</option>
								<option value="Mato Grosso" <%=empresa.getEstado().equals("Mato Grosso")?"selected" : ""%>>Mato Grosso</option>
								<option value="Mato Grosso do Sul" <%=empresa.getEstado().equals("Mato Grosso do Sul")?"selected" : ""%>>Mato Grosso do Sul</option>
								<option value="Minas Gerais" <%=empresa.getEstado().equals("Minas Gerais")?"selected" : ""%>>Minas Gerais</option>
								<option value="Para" <%=empresa.getEstado().equals("Para")?"selected" : ""%>>Pará</option>
								<option value="Paraiba" <%=empresa.getEstado().equals("Paraiba")?"selected" : ""%>>Paraíba</option>
								<option value="Parana" <%=empresa.getEstado().equals("Parana")?"selected" : ""%>>Paraná</option>
								<option value="Pernambuco" <%=empresa.getEstado().equals("Pernambuco")?"selected" : ""%>>Pernambuco</option>
								<option value="Piaui" <%=empresa.getEstado().equals("Piaui")?"selected" : ""%>>Piauí</option>
								<option value="Rio de Janeiro" <%=empresa.getEstado().equals("Rio de Janeiro")?"selected" : ""%>>Rio de Janeiro</option>
								<option value="Rio Grande do Norte" <%=empresa.getEstado().equals("Rio Grande do Norte")?"selected" : ""%>>Rio Grande do Norte</option>
								<option value="Rondonia" <%=empresa.getEstado().equals("Rondonia")?"selected" : ""%>>Rondônia</option>
								<option value="Rio Grande do Sul" <%=empresa.getEstado().equals("Rio Grande do Sul")?"selected" : ""%>>Rio Grande do Sul</option>
								<option value="Roraima" <%=empresa.getEstado().equals("Roraima")?"selected" : ""%>>Roraima</option>
								<option value="Santa Catarina" <%=empresa.getEstado().equals("Santa Catarina")?"selected" : ""%>>Santa Catarina</option>
								<option value="Sergipe" <%=empresa.getEstado().equals("Sergipe")?"selected" : ""%>>Sergipe</option>
								<option value="Sao Paulo" <%=empresa.getEstado().equals("Sao Paulo")?"selected" : ""%>>São Paulo</option>
								<option value="Tocantins" <%=empresa.getEstado().equals("Tocantins")?"selected" : ""%>>Tocantins</option>
                  			</select>
                		</div>
	                </div>

    	            <div class="row">
        	            <!-- telefone -->
            	        <div class="form-group col-md-4">
                	     	<label for="tel">*Telefone:</label>
                    	 	<input type="text" name="tel" class="form-control" placeholder="ex: +55 11 24875698" maxlength="13" onkeydown="javascript: fMasc( this, mTel );" value="<%=empresa.getTel() %>">
                    	</div>
                	</div>

                	<div class="row">
                		<!-- responsavel -->
                		<div class="form-group col-md-8">
	                  		<label for="responsavel">*Responsável:</label>
    	              		<input type="text" name="responsavel" class="form-control" value="<%=empresa.getResponsavel() %>">
        	        	</div>

            	    	<!-- CPF Responsavel -->
                	    <div class="form-group col-md-4">
                    		<label for="cpfresponsavel">*CPF do Responsável:</label>
                    		<input type="text" name="cpfresponsavel" class="form-control" maxlength="14" onkeydown="javascript: fMasc( this, mCPF );" value="<%=empresa.getCpfResponsavel() %>">
                    	</div>
                	</div>
                
                	<br>

                	<%if (empresa.getId() == 0) { %>
							<input type="submit" name="cmd" value="Cadastrar" class="btn btn-custom btn-pad "/>
						 <%} else { %>
						 	<input type="submit" name="cmd" value="Salvar" class="btn btn-custom btn-pad "/>
						 	<!-- <div class="alert alert-warning">
  								<strong>Alerta!</strong> Credenciado já existe.
							</div> -->
						 <% }%>

					<a href="conta.jsp" class="btn btn-custom btn-pad ">Voltar</a>
				</form>
			</div>
			
			<%
				List<Empresa> lista = (List<Empresa>)session.getAttribute("ENCONTRADOS");
					if (lista == null) { 
						lista = new ArrayList<>();
					} else { 
			%>
						<table class="table table-striped ">
						<thead>
							<tr>
								<th>Id</th>
								<th>Nome</th>
								<th>CNPJ</th>
								<th>Endereço</th>
								<th>CEP</th>
								<th>Bairro</th>
								<th>Cidade</th>
								<th>Estado</th>
								<th>Telefone</th>
								<th>Responsavel</th>
								<th>CPF Responsavel</th>
							</tr>
						</thead>
						<tbody>
						<%
							for (Empresa emp : lista) { 	%>
							<tr>
								<td><%=emp.getId()%></td> 
								<td><%=emp.getNome()%></td> 
								<td><%=emp.getCnpj()%></td> 
								<td><%=emp.getEnd()%></td> 
								<td><%=emp.getCep()%></td>
								<td><%=emp.getBairro()%></td>
								<td><%=emp.getCidade()%></td>
								<td><%=emp.getEstado()%></td>
								<td><%=emp.getTel()%></td>
								<td><%=emp.getResponsavel()%></td>
								<td><%=emp.getCpfResponsavel()%></td>        
								<td>
									<a href="../empresaController?cmd=editar&id=<%=emp.getId()%>">Editar</a> - 
									<a href="../empresaController?cmd=remover&id=<%=emp.getId()%>">Remover</a>
								</td>
							</tr>		
						<%	} %>
						</tbody>
						</table>
						<% }  %>

		</div>

		<br> <br>

		<footer>
		<p>&copy; 2019 - Plus AMO Company</p>
		</footer>

	</div>
	
	


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

</body>
</html>