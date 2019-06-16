<%@page import="DAO.AtendenteDAOImpl"%>
<%@page import="DAO.EmpresaDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat, java.util.List, java.util.ArrayList, model.Atendente, model.Empresa"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Agenda Médica Online - Atendente</title>

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
		
		<%
			EmpresaDAOImpl empresaDAOImpl = new EmpresaDAOImpl();
			session.setAttribute("CLINICA", empresaDAOImpl.listarEmpresa() );
		%>
			
			
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
			Atendente atendente = (Atendente) session.getAttribute("CREDENCIADO");
			if (atendente == null) {
				atendente = new Atendente();
			}

			AtendenteDAOImpl atendenteDAOImpl = new AtendenteDAOImpl();
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
					<b>Cadastramento Atendente</b>
				</h3>
				<br> <br>
				<form action="../atendenteController" method="post">
					<!-- campo ID do registro -->
					<div hidden>
						<input type="text" name="id" class="form-control" value="<%=atendente.getId() %>">
					</div>
           			<div class="row">
						<!-- Nome do atendente -->
            	        <div class="form-group col-md-6">
        	            	<label for="nome">*Nome da(o) Atendente:</label>
    	                    <input type="text" name="nome" class="form-control" value="<%=atendente.getNome()%>">
	                        <small id="nomeHelp" class="form-text text-muted">Insira o nome completo, por favor.</small>
                    	</div>

                    	<!-- cpf -->
                    	<div class="form-group col-md-6">
                    		<label for="cpf">*CPF:</label>
                        	<input type="text" name="cpf" required maxlength="14" onkeydown="javascript: fMasc( this, mCPF );" class="form-control" value="<%=atendente.getCpf()%>">
                        	<small id="cpfHelp" class="form-text text-muted">Preenchimento do CPF, é obrigatorio!</small>
                    	</div>
					</div>
					
					<div class="row">
                	    <!-- CEP -->
            	        <div class="form-group col-md-6">
        	            	<label for="cep">*CEP:</label>
    	                    <input type="text" name="cep" class="form-control" maxlength="9" onkeydown="javascript: fMasc( this, mCEP );" value="<%=atendente.getCep()%>">
	                    </div>

            	        <!-- data de nascimento -->
        	            <div class="form-group col-md-3 text">
    	                	<label for="datanasc">*Data de Nascimento:</label>
	                        <input type="date" name="datanasc" class="form-control" value="<%=sdf.format(atendente.getDatanasc())%>">
                    	</div>
                    </div>

                    <!-- endereço -->
                    <div class="form-group">
                    	<label for="end">*Endereço:</label>
                    	<input type="text" name="end" class="form-control" placeholder="ex: Rua Aguiar Meira" value="<%=atendente.getEnd()%>">
                    	<small id="endereçoHelp" class="form-text text-muted">Insira um endereço existente, por favor.</small>
                    </div>

                    <!-- bairro -->
                    <div class="form-group">
                    	<label for="nome">*Bairro:</label>
                    	<input type="text" name="bairro" class="form-control" value="<%=atendente.getBairro()%>">
                    </div>

                	<div class="row">
                    	<!-- cidade -->
                        <div class="form-group col-md-6">
                        	<label for="cidade">*Cidade:</label>
                            <input type="text" name="cidade" class="form-control" value="<%=atendente.getCidade()%>">
                        </div>
                        
                        <!-- estado-->
                        <div class="form-group col-md-4">
                        	<label>*Estado:</label>
                            <br>
                            <select name="estado"> 
                                <option value="estado">Selecione o Estado</option>
								<option value="Acre" <%=atendente.getEstado().equals("Acre")?"selected" : ""%>>Acre</option>
								<option value="Alagoas" <%=atendente.getEstado().equals("Alagoas")?"selected" : ""%>>Alagoas</option>
								<option value="Amazonas" <%=atendente.getEstado().equals("Amazonas")?"selected" : ""%>>Amazonas</option>
								<option value="Amapa" <%=atendente.getEstado().equals("Amapa")?"selected" : ""%>>Amapá</option>
								<option value="Bahia" <%=atendente.getEstado().equals("Bahia")?"selected" : ""%>>Bahia</option>
								<option value="Ceara" <%=atendente.getEstado().equals("Ceara")?"selected" : ""%>>Ceará</option>
								<option value="Distrito" <%=atendente.getEstado().equals("Distrito")?"selected" : ""%>>Distrito Federal</option>
								<option value="Espirito Santo" <%=atendente.getEstado().equals("Espirito Santo")?"selected" : ""%>>Espírito Santo</option>
								<option value="Goias" <%=atendente.getEstado().equals("Goias")?"selected" : ""%>>Goiás</option>
								<option value="Maranhao" <%=atendente.getEstado().equals("Maranhao")?"selected" : ""%>>Maranhão</option>
								<option value="Mato Grosso" <%=atendente.getEstado().equals("Mato Grosso")?"selected" : ""%>>Mato Grosso</option>
								<option value="Mato Grosso do Sul" <%=atendente.getEstado().equals("Mato Grosso do Sul")?"selected" : ""%>>Mato Grosso do Sul</option>
								<option value="Minas Gerais" <%=atendente.getEstado().equals("Minas Gerais")?"selected" : ""%>>Minas Gerais</option>
								<option value="Para" <%=atendente.getEstado().equals("Para")?"selected" : ""%>>Pará</option>
								<option value="Paraiba" <%=atendente.getEstado().equals("Paraiba")?"selected" : ""%>>Paraíba</option>
								<option value="Parana" <%=atendente.getEstado().equals("Parana")?"selected" : ""%>>Paraná</option>
								<option value="Pernambuco" <%=atendente.getEstado().equals("Pernambuco")?"selected" : ""%>>Pernambuco</option>
								<option value="Piaui" <%=atendente.getEstado().equals("Piaui")?"selected" : ""%>>Piauí</option>
								<option value="Rio de Janeiro" <%=atendente.getEstado().equals("Rio de Janeiro")?"selected" : ""%>>Rio de Janeiro</option>
								<option value="Rio Grande do Norte" <%=atendente.getEstado().equals("Rio Grande do Norte")?"selected" : ""%>>Rio Grande do Norte</option>
								<option value="Rondonia" <%=atendente.getEstado().equals("Rondonia")?"selected" : ""%>>Rondônia</option>
								<option value="Rio Grande do Sul" <%=atendente.getEstado().equals("Rio Grande do Sul")?"selected" : ""%>>Rio Grande do Sul</option>
								<option value="Roraima" <%=atendente.getEstado().equals("Roraima")?"selected" : ""%>>Roraima</option>
								<option value="Santa Catarina" <%=atendente.getEstado().equals("Santa Catarina")?"selected" : ""%>>Santa Catarina</option>
								<option value="Sergipe" <%=atendente.getEstado().equals("Sergipe")?"selected" : ""%>>Sergipe</option>
								<option value="Sao Paulo" <%=atendente.getEstado().equals("Sao Paulo")?"selected" : ""%>>São Paulo</option>
								<option value="Tocantins" <%=atendente.getEstado().equals("Tocantins")?"selected" : ""%>>Tocantins</option>
                            </select>
                        </div>
                	</div>

					<div class="row">
                    	<!-- telefone -->
                    	<div class="form-group col-md-4">
                      		<label for="tel">*Telefone:</label>
                      		<input type="text" name="tel" required class="form-control" placeholder="ex: +55 11 24875698" maxlength="13" onkeydown="javascript: fMasc( this, mTel );" value="<%=atendente.getTel()%>">
                    	</div>

                    	<!-- celular -->
                    	<div class="form-group col-md-4">
                            <label for="cel">Celular:</label>
                            <input type="text" name="cel" class="form-control" placeholder="ex: +55 11 9 99999999" maxlength="14" onkeydown="javascript: fMasc( this, mTel );" value="<%=atendente.getCel()%>">
                    	</div>

                    	<!-- Clínica -->
                    	<div class="form-group col-md-6">
                        	<label for="cnpj">*Clínica:</label>
                        	<br>
                        	<select name="clinica">
                            	<option value="clinica">Selecione a Clínica</option>
                            	<% List<Empresa> lista_empresa = (List<Empresa>)session.getAttribute("CLINICA");
									if (lista_empresa == null) { 
										lista_empresa = new ArrayList<>();
									} else {
									for (Empresa emp : lista_empresa) {
								%>
                            	<option value="<%=emp.getId()%>" <%=atendente.getClinica() != 0 ? "selected" : ""%>><%=emp.getCnpj()%> - <%=emp.getNome()%></option>
                            	<%	}} %>
                        	</select>
                    	</div>
                	</div>
                	<br>

					<%if (atendente.getId() == 0) { %>
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
				List<Atendente> lista = (List<Atendente>)session.getAttribute("ENCONTRADOS");
					if (lista == null) { 
						lista = new ArrayList<>();
					} else { 
			%>
						<table class="table table-striped ">
						<thead>
							<tr>
								<th>Id</th>
								<th>Nome</th>
								<th>CPF</th>
								<th>Nascimento</th>
								<th>Endereço</th>
								<th>CEP</th>
								<th>Bairro</th>
								<th>Cidade</th>
								<th>Estado</th>
								<th>Telefone</th>
								<th>Celular</th>
								<th>Clinica</th>
							</tr>
						</thead>
						<tbody>
						<%
							for (Atendente ate : lista) { 	%>
							<tr>
								<td><%=ate.getId()%></td> 
								<td><%=ate.getNome()%></td> 
								<td><%=ate.getCpf()%></td> 
								<td><%=sdf.format(ate.getDatanasc())%></td>
								<td><%=ate.getEnd()%></td> 
								<td><%=ate.getCep()%></td>
								<td><%=ate.getBairro()%></td>
								<td><%=ate.getCidade()%></td>
								<td><%=ate.getEstado()%></td>
								<td><%=ate.getTel()%></td>
								<td><%=ate.getCel()%></td>
								<td><%=ate.getClinicaNome()%></td>        
								<td>
									<a href="../atendenteController?cmd=editar&id=<%=ate.getId()%>">Editar</a> - 
									<a href="../atendenteController?cmd=remover&id=<%=ate.getId()%>">Remover</a>
								</td>
							</tr>		
						<%	} %>
						</tbody>
						</table>
						<% }  %>

			<br> <br>

			<footer>
			<p>&copy; 2019 - Plus AMO Company</p>
			</footer>
	
		</div>
	</div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

</body>
</html>