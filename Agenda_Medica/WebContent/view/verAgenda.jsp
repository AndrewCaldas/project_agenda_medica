<%@page import="DAO.CredenciadoDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat, java.util.List, java.util.ArrayList, model.Credenciado"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Agenda Médica Online - Menu</title>


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
    
    <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
    
  </head>

  <body>

      <nav class="navbar navbar-fixed-top navbar-inverse navbar-transparente">
        <div class="container">
          <!-- Header -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#barra-navegacao">
              <span class="sr-only">Alterar menu</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>            
            </button>         
            <a href="index.jsp" class="navbar-brand" style="color: white;" class="sombra"><b>Agenda</b></span> Medica<span style="font-size: 10px"> Online</span></a>
          </div>
          
          <div class="collapse navbar-collapse" id="barra-navegacao">

            <ul class="nav navbar-nav navbar-right">
              <li> <a href="entrarRegistrar.jsp">Home</a> </li>
              <li> <a href="#">Contato</a> </li>
              <li> <a href="#">Ajuda</a> </li>

              <li class="dropdown">
                <a href="" class="dropdown-toggle" data-toggle="dropdown-menu">Minha Conta 
                  <span class="caret"></span>
                </a>

                <ul class="dropdown-menu">
                  <a href="#">Link 1</a>
                  <a href="#">Link 2</a>
                  <a href="#">Link 3</a>
                </ul> 
              </li>

                 <!-- <li class="dropdown">
                  <a href="" class="dropdown-toggle" data-toggle="#dropdown">
                  Minha Conta <span class="caret"></span>
                  </a>

                    <ul class="dropdown-menu" id="dropdown">
                       <li><a href="#">Editar</a> </li>
                       <li><a href="#">Logout</a> </li>
                    </ul>

                 </li> -->
            </ul>
          </div>
        </div>
      </nav>

      <!-- <div class="container barrinha"></div> -->

    <div class="grid-container ">
            
        <div class="row top">
          <!-- <div class="barrinha top"></div> -->
            
            <div class="fixed">
                  <a href="#">
                    <div class="colum-picture">
                      <label style="margin: 16.5rem 2px 2px 1.8rem; font-size: 12px;">Nome do Credenciado</label>
                    </div>
                  </a>
                    <!-- <div class="colum-buttom"></div> -->
                      <div class="text-custom text">
                        <a href="agendar.jsp" id="agenda" data-element="#agendar"> 
                          <div class="colum-buttom">Agendar</div>
                        </a>
                        <a href="" onclick="status()" id="veragenda" data-element=#ver>
                          <div class="colum-buttom">Ver Agenda</div>
                        </a>
                        <a href="#" id="reagenda" data-element="#reagenda">
                          <div class="colum-buttom">Re-agendar</div>
                        </a>
                        <a href="#" class="editar" id="editar" data-element="#editar">
                          <div class="colum-buttom">Editar Cadastro</div>
                        </a>
                    </div>
            </div>
        </div>
        
        <!-- Esconder class, apenas adicione "hidden a classe" -->

         <div class="row top">                             
                        <div class="card-form m" id="ver">
                          <%
                         Credenciado credenciado = (Credenciado) session.getAttribute("CREDENCIADO");
				List<Credenciado> lista = (List<Credenciado>)session.getAttribute("ENCONTRADOS");
					if (lista == null) { 
						lista = new ArrayList<>();
					} else { 
			%>
			
						
							<div class="col-md-6"> 
								<input type="text" name="nome" class="form-control" placeholder="Digite sua pesquisa" ></input>
								<br>
							</div>
							<div>
								<a class="btn btn-pad" href="../credenciadoController?cmd=pesquisar&id=<%//=credenciado.getId()%>">Pesquisar</a>
								<!-- <input type="submit" class="btn btn-pad" name="cmd" value="Pesquisar"/> -->
							</div>
						
						
						
						<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>Id</th>
								<th>Nome</th>
								<th>CPF</th>
								<th>Nascimento</th>
								<th>Endere�o</th>
								<th>CEP</th>
								<th>Bairro</th>
								<th>Cidade</th>
								<th>Estado</th>
								<th>Telefone</th>
								<th>Celular</th>
								<th>Convenio</th>
							</tr>
						</thead>
						<tbody>
						<% for (Credenciado c : lista) { 	%>
							<tr>
								<td><%=c.getId()%></td> 
								<td><%=c.getNome()%></td> 
								<td><%=c.getCpf()%></td> 
								<td><%=sdf.format(c.getDatanasc())%></td>
								<td><%=c.getEnd()%></td> 
								<td><%=c.getCep()%></td>
								<td><%=c.getBairro()%></td>
								<td><%=c.getCidade()%></td>
								<td><%=c.getEstado()%></td>
								<td><%=c.getTel()%></td>
								<td><%=c.getCel()%></td>
								<td><%=c.getEscolha()%></td>        
								<td>
									<a href="../credenciadoController?cmd=editar&id=<%=c.getId()%>">Editar</a>  
									<a href="../credenciadoController?cmd=remover&id=<%=c.getId()%>">Remover</a>
								</td>
							</tr>		
						<%	} %>
						</tbody>
						</table>
						<% }  %>
                        </div>
                </div>
        </div>
    </div>

    <!-- --- FOOTER --- -->

    <!-- <footer class="colum-barra"></footer> -->


    <!-- --- SCRIPTS --- -->

    <!-- <script src="../js/scroll-nav.js"></script> -->
    
    <!-- jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>


    <script type="text/javascript">
      
        $(function(){
          $(".btn-toggle").click(function(e){
              e.preventDefault();
              el = $(this).data('element');
              pop = $(this).data('teste');
              $(el).toggle();
          });
        })

        function status(){
          alert("Você já está em ver agenda!")
          // console.log("teste: ")
        }

    </script>

    </body>
</html>
