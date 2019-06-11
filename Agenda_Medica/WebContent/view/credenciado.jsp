<%@page import="DAO.CredenciadoDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat, java.util.List, java.util.ArrayList, model.Credenciado, model.Estado"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Agenda Médica Online - Credenciado</title>

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
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Credenciado credenciado = (Credenciado) session.getAttribute("CREDENCIADO");
			if (credenciado == null) {
				credenciado = new Credenciado();
				//estado = new Estado();
			}

			CredenciadoDAOImpl credenciadoDAOImpl = new CredenciadoDAOImpl();
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
					<b>Cadastramento Credenciado</b>
				</h3>
				<br> <br>
				<form action="../credenciadoController" method="post">
					<!-- campo ID do registro -->
					<div hidden>
						<input type="numeric" name="id" class="form-control" value="<%=credenciado.getId() %>">
					</div>
           			
					<!-- Nome -->
					<div class="form-group">
						<label for="nome">*Nome:</label>
						<input type="text" name="nome" class="form-control" value="<%=credenciado.getNome()%>">
						<small id="nomeHelp" class="form-text text-muted">Insira o nome completo, por favor.</small>
					</div>

					<!-- cpf -->
					<div class="row">
						<div class="form-group col-md-6">
							<label for="cpf">*CPF:</label>
							<input type="numeric" name="cpf" class="form-control" value="<%=credenciado.getCpf()%>">
							<small id="cpfHelp" class="form-text text-muted">Preenchimento do CPF é obrigatorio!</small>
						</div>

						<!-- data de nascimento -->
						<div class="form-group col-md-3 text">
							<label for="datanasc">*Data de Nascimento:</label>
							<input type="date" name="datanasc" class="form-control" value="<%=sdf.format(credenciado.getDatanasc())%>">
						</div>
					</div>

					<div class="row">
						<!-- endereço -->
						<div class="form-group col-md-8">
							<label for="end">*Endereço:</label> 
							<input type="text" name="end" class="form-control" placeholder="ex: Rua Joaquim Santos" value="<%=credenciado.getEnd()%>">
							<small id="endereçoHelp" class="form-text text-muted">Insira um endereço existente, por favor.</small>
						</div>

						<!-- CEP -->
						<div class="form-group col-md-4">
							<label for="cep">*CEP:</label>
							<input type="numeric" name="cep" class="form-control" value="<%=credenciado.getCep()%>">
						</div>
					</div>

					<!-- bairro -->
					<div class="form-group">
						<label for="nome">*Bairro:</label> 
						<input type="text" name="bairro" class="form-control" value="<%=credenciado.getBairro()%>">
					</div>

					<div class="row">
						<!-- cidade -->
						<div class="form-group col-md-6">
							<label for="cidade">*Cidade:</label>
							<input type="text" name="cidade" class="form-control" value="<%=credenciado.getCidade()%>">
						</div>

						<!-- estado-->
						<div class="form-group col-md-4">
							<label>*Estado:</label> <br>
							<select name="estado">
								<option value="estado">Selecione o Estado</option>
								<option value="Acre" <%=credenciado.getEstado().equals("Acre")?"selected" : ""%>>Acre</option>
								<option value="Alagoas" <%=credenciado.getEstado().equals("Alagoas")?"selected" : ""%>>Alagoas</option>
								<option value="Amazonas" <%=credenciado.getEstado().equals("Amazonas")?"selected" : ""%>>Amazonas</option>
								<option value="Amapa" <%=credenciado.getEstado().equals("Amapa")?"selected" : ""%>>Amapá</option>
								<option value="Bahia" <%=credenciado.getEstado().equals("Bahia")?"selected" : ""%>>Bahia</option>
								<option value="Ceara" <%=credenciado.getEstado().equals("Ceara")?"selected" : ""%>>Ceará</option>
								<option value="Distrito" <%=credenciado.getEstado().equals("Distrito")?"selected" : ""%>>Distrito Federal</option>
								<option value="Espirito Santo" <%=credenciado.getEstado().equals("Espirito Santo")?"selected" : ""%>>Espírito Santo</option>
								<option value="Goias" <%=credenciado.getEstado().equals("Goias")?"selected" : ""%>>Goiás</option>
								<option value="Maranhao" <%=credenciado.getEstado().equals("Maranhao")?"selected" : ""%>>Maranhão</option>
								<option value="Mato Grosso" <%=credenciado.getEstado().equals("Mato Grosso")?"selected" : ""%>>Mato Grosso</option>
								<option value="Mato Grosso do Sul" <%=credenciado.getEstado().equals("Mato Grosso do Sul")?"selected" : ""%>>Mato Grosso do Sul</option>
								<option value="Minas Gerais" <%=credenciado.getEstado().equals("Minas Gerais")?"selected" : ""%>>Minas Gerais</option>
								<option value="Para" <%=credenciado.getEstado().equals("Para")?"selected" : ""%>>Pará</option>
								<option value="Paraiba" <%=credenciado.getEstado().equals("Paraiba")?"selected" : ""%>>Paraíba</option>
								<option value="Parana" <%=credenciado.getEstado().equals("Parana")?"selected" : ""%>>Paraná</option>
								<option value="Pernambuco" <%=credenciado.getEstado().equals("Pernambuco")?"selected" : ""%>>Pernambuco</option>
								<option value="Piaui" <%=credenciado.getEstado().equals("Piaui")?"selected" : ""%>>Piauí</option>
								<option value="Rio de Janeiro" <%=credenciado.getEstado().equals("Rio de Janeiro")?"selected" : ""%>>Rio de Janeiro</option>
								<option value="Rio Grande do Norte" <%=credenciado.getEstado().equals("Rio Grande do Norte")?"selected" : ""%>>Rio Grande do Norte</option>
								<option value="Rondonia" <%=credenciado.getEstado().equals("Rondonia")?"selected" : ""%>>Rondônia</option>
								<option value="Rio Grande do Sul" <%=credenciado.getEstado().equals("Rio Grande do Sul")?"selected" : ""%>>Rio Grande do Sul</option>
								<option value="Roraima" <%=credenciado.getEstado().equals("Roraima")?"selected" : ""%>>Roraima</option>
								<option value="Santa Catarina" <%=credenciado.getEstado().equals("Santa Catarina")?"selected" : ""%>>Santa Catarina</option>
								<option value="Sergipe" <%=credenciado.getEstado().equals("Sergipe")?"selected" : ""%>>Sergipe</option>
								<option value="Sao Paulo" <%=credenciado.getEstado().equals("Sao Paulo")?"selected" : ""%>>São Paulo</option>
								<option value="Tocantins" <%=credenciado.getEstado().equals("Tocantins")?"selected" : ""%>>Tocantins</option>
							</select>
						</div>
					</div>

					<div class="row">					
						<!-- telefone -->
						<div class="form-group col-md-5">
							<label for="tel">*Telefone Residencial:</label>
							<input type="tel" name="tel" class="form-control" placeholder="ex: +55 11 24875698" value="<%=credenciado.getTel()%>">
						</div>

						<!-- celular -->
						<div class="form-group col-md-5">
							<label for="cel">*Celular:</label>
							<input type="tel" name="cel" class="form-control" placeholder="ex: +55 11 945878653"  value="<%=credenciado.getCel()%>">
						</div>
					</div>

					<!-- conveniado  -->
					<div class="radio">
						<label class="text">Conveniado: </label>
						<label class="text">
							<input type="radio" name="escolha" value="S"> Sim
						</label>
						<label class="text">
							<input type="radio" name="escolha" value="N"> Não
						</label>
						<%=credenciado.getEscolha()%>
					</div>

					<br> <%if (credenciado.getId() == 0) { %>
							<input type="submit" name="cmd" value="Cadastrar" class="btn btn-custom btn-pad "/>
						 <%} else { %>
						 	<div class="alert alert-warning">
  								<strong>Alerta!</strong> Credenciado já existe.
							</div>
						 <% }%>

					<a href="conta.jsp" class="btn btn-custom btn-pad ">Voltar</a>

				</form>

			</div>

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