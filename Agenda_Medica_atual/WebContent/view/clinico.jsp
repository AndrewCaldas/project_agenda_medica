<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Agenda M�dica Online - clinico</title>

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
          <div class="col-sm-8 card-box">
           <h3 class="text"><b>Cadastramento Cl�nico</b></h3>
           <br><br>

            <form>

                <div class="row">

                     <!-- Nome do medico -->
                <div class="form-group col-md-6">
                        <label for="nome">*Nome do m�dico:</label>
                        <input type="text" id="nome" class="form-control">
                        <small id="nomeHelp" class="form-text text-muted">Insira o nome completo, por favor.</small>
                      </div>

                    <!-- cpf -->
                    <div class="form-group col-md-6">
                        <label for="cpf">*CPF:</label>
                        <input type="numeric" id="cpf" class="form-control">
                        <small id="cpfHelp" class="form-text text-muted">Preenchimento do CPF, � obrigatorio!</small>
                    </div>

                     <!-- crm-->
                     <div class="form-group col-md-6">
                            <label for="crm">*CRM:</label>
                            <input type="numeric" id="crm" class="form-control">
                            <small id="crmJHelp" class="form-text text-muted">Preenchimento do CRM, � obrigatorio!</small>
                          </div>


                    <!-- CEP -->
                    <div class="form-group col-md-6">
                      <label for="cep">*CEP:</label>
                      <input type="numeric" id="cep" class="form-control">
                    </div>
                </div>

                <!-- endere�o -->
                <div class="form-group">
                  <label for="end">*Endere�o:</label>
                  <input type="text" id="end" class="form-control" placeholder="ex: Rua Aguiar Meira">
                  <small id="endere�oHelp" class="form-text text-muted">Insira um endere�o existente, por favor.</small>
                </div>

                <!-- bairro -->
                <div class="form-group">
                  <label for="nome">*Bairro:</label>
                  <input type="text" id="bairro" class="form-control">
                </div>

                <div class="row">
                <!-- cidade -->
                <div class="form-group col-md-6">
                  <label for="cidade">*Cidade:</label>
                  <input type="text" id="cidade" class="form-control">
                </div>

                <!-- estado-->
                <div class="form-group col-md-4">

                  <label>*Estado:</label>
                  <br>
                  <select name="estado"> 
                      <option value="estado">Selecione o Estado</option> 
                      <option value="ac">Acre</option> 
                      <option value="al">Alagoas</option> 
                      <option value="am">Amazonas</option> 
                      <option value="ap">Amap�</option> 
                      <option value="ba">Bahia</option> 
                      <option value="ce">Cear�</option> 
                      <option value="df">Distrito Federal</option> 
                      <option value="es">Esp�rito Santo</option> 
                      <option value="go">Goi�s</option> 
                      <option value="ma">Maranh�o</option> 
                      <option value="mt">Mato Grosso</option> 
                      <option value="ms">Mato Grosso do Sul</option> 
                      <option value="mg">Minas Gerais</option> 
                      <option value="pa">Par�</option> 
                      <option value="pb">Para�ba</option> 
                      <option value="pr">Paran�</option> 
                      <option value="pe">Pernambuco</option> 
                      <option value="pi">Piau�</option> 
                      <option value="rj">Rio de Janeiro</option> 
                      <option value="rn">Rio Grande do Norte</option> 
                      <option value="ro">Rond�nia</option> 
                      <option value="rs">Rio Grande do Sul</option> 
                      <option value="rr">Roraima</option> 
                      <option value="sc">Santa Catarina</option> 
                      <option value="se">Sergipe</option> 
                      <option value="sp">S�o Paulo</option> 
                      <option value="to">Tocantins</option> 
                  </select>
                </div>

                </div>

                <div class="row">

                    <!-- telefone -->
                    <div class="form-group col-md-4">
                      <label for="tel">*Telefone:</label>
                      <input type="tel" id="tel" class="form-control" placeholder="ex: +55 11 24875698">
                    </div>

                     <!-- CPNJ Cl�nica -->
                     <div class="form-group col-md-6">
                            <label for="cnpj">*CNPJ da cl�nica:</label>
                            <br>
                            <select name="cpnjclinica">
                                <option value="cpnj-clinica">Selecione o CPNJ de sua cl�nica</option>
                                <option value="1">Clinica 1</option>
                                <option value="2">Clinica 2</option>
                                <option value="3">Clinica 3</option>
                                <option value="4">Clinica 4</option>
                                <option value="5">Clinica 5</option>
                                <option value="6">Clinica 6</option>
                                <option value="7">Clinica 7</option>
                                <option value="8">Clinica 8</option>
                                <option value="9">Clinica 9</option>
                                <option value="10">Clinica 10</option>
                            </select>
    
    
                         <!--  
                          <input type="numeric" id="cnpj" class="form-control">
                          <small id="CNPJHelp" class="form-text text-muted">Preenchimento do CNPJ da cl�nica, � obrigatorio!</small> -->
                        </div>

                </div>

                <br>

                <a href="#" class="btn btn-custom btn-pad ">Cadastrar Especialidade</a>

                <a href="conta.jsp" class="btn btn-custom btn-pad ">Voltar</a>
              

            </form>

          </div>

        </div>

        <br><br>

        <footer>
        <p>&copy; 2019 - Plus AMO Company </p>
        </footer>

    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>