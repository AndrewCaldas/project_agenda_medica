<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Agenda M�dica Online - Login</title>


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

     <nav class="navbar rounded navbar-fixed-top navbar-inverse navbar-transparente">
        <div class="container">
          <!-- Header -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#barra-navegacao">
              <span class="sr-only">Alterar menu</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>            
            </button>         
            <a href="index.jsp" class="navbar-brand" class="sombra"><b>Agenda</b></span> Medica<span style="font-size: 10px"> Online</span></a>
          </div>
          
          <div class="collapse navbar-collapse" id="barra-navegacao">

            <ul class="nav navbar-nav navbar-right">
              <li> <a href="index.jsp">Home</a> </li>
              <li> <a href="#">Contato</a> </li>
              <li> <a href="#">Ajuda</a> </li>

                 <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  Minha Conta <span class="caret"></span>
                  </a>

                    <ul class="dropdown-menu">
                       <li><a href="#">Editar</a> </li>
                       <li><a href="index.jsp">Logout</a> </li>
                    </ul>

                 </li>
            </ul>
          </div>
        </div>
      </nav>


  <div class="container">

      

       <!-- Cadastro -->
    <div class="capa">
      <div class="texto-capa">
        <div class="card-centro card-efeito">

            <h3 class="text">Criar Conta</h3>
            <br>
            <h3 class="text">Escolha a op��o</h3>
            <br>

            <div>
              <a href="credenciado.jsp" class="btn btn-custom text btn-padrao btn-lg">Credenciado</a>
            </div>
            <br>
            <div>
              <a href="empresa.jsp" class="btn btn-custom btn-padrao btn-lg">Empresas</a>
            </div>
            <br>
            <div>
                <a href="clinico.jsp" class="btn btn-custom btn-padrao btn-lg">Cl�nicos</a>
            </div>
            <br>
            <div>
                <a href="atendente.jsp" class="btn btn-custom btn-padrao btn-lg">Atendente</a>
            </div>
            <br></br>
            <div>
                <a href="entrarRegistrar.jsp" class="btn btn-custom btn-pad btn-lg">Voltar</a>
            </div>

        </div>

      </div>

    </div>

    <br><br>

        <footer>
        <p>&copy; 2019 - Plus AMO Company</p>
        </footer>

  </div>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>