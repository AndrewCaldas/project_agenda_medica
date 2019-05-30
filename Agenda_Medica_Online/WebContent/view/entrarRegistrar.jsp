<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Agenda M�dica Online - Registrar</title>


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
              <li> <a href="index.jsp">Home</a> </li>
              <li> <a href="#">Contato</a> </li>
              <li> <a href="#">Ajuda</a> </li>
              <li> <a href="entrarRegistrar.jsp">Entrar/Registrar</a> </li>
          </div>
        </div>
      </nav>

    <div class="container">

       <!-- Cadastro -->
      <div class="capa">
      
        <div class="col-sm-8 card-login card-efeito">
       
          <h3 class="text">Cadastre-se</h3>
                <form>

                    <div class="form-group">
                      <label for="nome">Nome</label>
                      <input type="text" class="form-control" id="nome">
                      <small id="nomeHelp" class="form-text text-muted">Nome completo, por favor.</small>
                    </div>

                    <div class="form-group">
                      <label for="email">E-mail</label>
                      <input type="email" class="form-control" id="email">
                      <small id="endere�oHelp" class="form-text text-muted">Digite um e-mail v�lido, por favor.</small>
                    </div>

                    <div class="form-group">
                      <label for="senha">Senha</label>
                      <input type="password" class="form-control" id="senha">
                      <small id="senhaHelp" class="form-text text-muted">Digite uma senha de at� 8 digitos, uma letra e um simbolo, por favor.</small>  
                    </div>

                    <div class="form-group">
                      <label for="confirmarsenha">Confirmar Senha</label>
                      <input type="password" class="form-control" id="confirmarsenha">
                      <small id="senhaHelp" class="form-text text-muted">Digite sua senha novamente.</small>
                    </div>

                    <div class="checkbox">
                      <label for="check">
                      <input type="checkbox" id="check"> Aceito os <a href="#">termos de servi�o.</a>
                      <small id="senhaHelp" class="form-text text-muted">Caso concorde com os termos.</small>
                      </label>
                    </div>

                    <div class="radio">
                      <label>
                        <input type="radio" name="sexo"> Masculino
                        <br>
                      </label>

                      <label>
                        <input type="radio" name="sexo"> Feminino
                      </label>
                    </div>

                    <a href="conta.jsp" type="submit" class="btn btn-custom2 btn-pad">Cadastrar</a>

                  </form>

        </div>

         <!-- Login -->
         <div class="col-sm-10 card-login card-efeito">
              
            <h3 class="text">Logar</h3>
            <br>
            
            <form>

              <div class="form-group">
                 <input type="e-mail" class="form-control" id="emailLogin" placeholder="Digite seu e-mail">        
              </div>

              <div class="form-group">
                 <input type="password" class="form-control" id="senhaLogin" placeholder="Digite sua senha">       
              </div>

              <div class="form-check">
                <label> <input type="checkbox" class="form-check-input" value=""> Lembre-me</label>
              </div>

              <div>
                <a href="trocar-senha.jsp">Esqueci minha senha?</a> 
                <small id="senhaHelp" class="form-text text-muted">Caso tenha esquecido sua senha.</small>
              </div>

              <br>
             
               <a href="conta.jsp" type="submit" class="btn btn-custom2 btn-pad">Logar</a>

              </form>

      </div>

      </div>

        <br><br>

        <footer>
        <p>&copy;2019 - Plus AMO Company</p>
        </footer>

    </div>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>