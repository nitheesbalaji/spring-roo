<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description"
      content="${r"#{info_description}"}" />
    <meta name="author"
      content="${r"#{info_author}"}" />

    <link rel="shortcut icon" href="../../static/public/img/favicon.ico"
      data-th-href="@{/public/img/favicon.ico}" />

    <link rel="apple-touch-icon" href="../../static/public/img/apple-touch-icon.png"
      data-th-href="@{/public/img/apple-touch-icon.png}" />

    <title data-layout-title-pattern="$DECORATOR_TITLE - $CONTENT_TITLE" data-th-text="${r"${projectName}"}">Spring Roo application</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css"
        data-th-href="@{/webjars/bootstrap/3.3.6/dist/css/bootstrap.css}">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link rel="stylesheet" type="text/css"
      href="https://maxcdn.bootstrapcdn.com/css/ie10-viewport-bug-workaround.css"
      data-th-href="@{/public/css/ie10-viewport-bug-workaround.css}">

    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css"
      data-th-href="@{/webjars/font-awesome/4.6.2/css/font-awesome.min.css}">

    <!-- Bootswatch CSS custom -->
    <link rel="stylesheet" type="text/css"
      href="../../static/public/css/theme.css"
      data-th-href="@{/public/css/theme.css}">

    <!-- Roo CSS -->
    <link rel="stylesheet" type="text/css"
      href="../../static/public/css/springroo.css"
      data-th-href="@{/public/css/springroo.css}">

   <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

<#if userManagedComponents?has_content && userManagedComponents["body"]??>
  ${userManagedComponents["body"]}
<#else>
  <body id="body">

     <header role="banner">
        <div data-layout-include="fragments/header :: header">
          <!-- Content replaced by the header template fragment header.html -->
          <h1>Sample page header for direct display of the template</h1>
        </div>

        <div data-layout-include="fragments/menu :: menu-languages">
          <!-- Content replaced by the menu template fragment menu.html -->
          <span>Application menu</span>
        </div>

    </header>

    <div class="container bg-container">
      <section data-layout-fragment="content">
        <!-- Content replaced by the content fragment of the page displayed -->
        <h2>Sample static body for direct display of the template</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent
          scelerisque neque neque, ac elementum quam dignissim interdum. Phasellus et
          placerat elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
          Praesent scelerisque neque neque, ac elementum quam dignissim interdum.
          Phasellus et placerat elit.</p>
      </section>
    </div>

    <footer class="container" data-layout-include="fragments/footer :: footer">
      <!-- Content replaced by the footer template fragment footer.html -->
      &copy; 2016 Spring Roo (footer for example for direct display of the template)
    </footer>

    <!-- JavaScript
     ================================================== -->
    <!-- Placed at the end of the document so that the pages load faster -->
    <!-- JQuery -->
    <script type="text/javascript" charset="utf8"
      src="https://code.jquery.com/jquery-1.12.3.js"
      data-th-src="@{/webjars/jquery/1.12.3/dist/jquery.js}"></script>

    <!-- Bootstrap -->
    <script type="text/javascript"
      src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.js"
      data-th-src="@{/webjars/bootstrap/3.3.6/dist/js/bootstrap.js}"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../static/public/js/ie10-viewport-bug-workaround.js"
      data-th-src="@{/public/js/ie10-viewport-bug-workaround.js}">
      </script>

    <!-- MomentJS - date format -->
    <script
       src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.js"
       data-th-src="@{/webjars/momentjs/2.13.0/moment.js}">
      </script>
    <script
       src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/locale/es.js"
       data-th-src="@{/webjars/momentjs/2.13.0/locale/}+ ${r"${#"}locale.language${r"}"}+'.js'"
       data-th-if="${r"${#"}locale.language${r"}"} != 'en'">
      </script>
    <script src="../../static/public/js/moment-defaults.js"
      data-th-src="@{/public/js/moment-defaults.js}">
      </script>

    <div data-layout-fragment="javascript">
      <!-- This includes javascript own code of each page -->
    </div>

    <!-- Application -->
    <script src="../../static/public/js/main.js"
      data-th-src="@{/public/js/main.js}">
      </script>
  </body>
</#if>
</html>
