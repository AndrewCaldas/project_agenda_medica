<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Agenda M�dica Online - Trocar senha</title>


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
              <span class="sr-only">Alterar menu</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>            
            </button>         
            <a href="index.jsp" class="navbar-brand" class="sombra"><b>Agenda</b></span> Medica<span style="font-size: 10px"> Online</span></a>
          </div>
          
          <div class="collapse navbar-collapse" id="barra-navegacao">

            <ul class="nav navbar-nav navbar-right">
              <li> <a href="login.jsp">Home</a> </li>
              <li> <a href="#">Contato</a> </li>
              <li> <a href="#">Ajuda</a> </li>

                 <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  Minha Conta <span class="caret"></span>
                  </a>

                    <ul class="dropdown-menu">
                       <li><a href="#">Editar</a> </li>
                       <li><a href="#">Logout</a> </li>
                    </ul>

                 </li>
            </ul>
          </div>
        </div>
      </nav>

    <div class="container">

       <!-- Recuperador de senha -->
        <div class="capa">
          <div class="texto-left col-md-6 card-box">
           <h3 class="text">Recupera��o de Senha</h3>
           <br>
          
              <form>
                <div class="form-group">
                  
                  <label for="cpf">Digite seu CPF:</label>
                  <input type="numeric" class="form-control" id="cpf">
                  <small id="Help" class="form-text text-muted">
                      <br>
                      <p>*Ap�s clicar no bot�o Enviar, verifique o seu e-mail para a recupera��o de sua senha, caso n�o localize, verificar
                      a sua �rea de spam.</p>
                      <br>
                  </small>
                
                </div>
              </form>

              <a href="#" class="btn btn-custom2 btn-pad ">Enviar</a>

              <a href="entrarRegistrar.jsp" class="btn btn-custom btn-pad ">Voltar</a>

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