<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>@yield('title')</title>
    </head>
    <body>
      <header>
        <nav>
          <a href="/">Home</a>
          <a href="/blog">Blog</a>
        </nav>
      </header>
      <br>


        @yield('content')


        <br>
        <footer>
        <p>
          &copy; Laravel & sekolah koding 2018
        </p>
      </footer>
    </body>
</html>
