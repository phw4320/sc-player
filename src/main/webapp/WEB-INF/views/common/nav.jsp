<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

<style>
.navbar{background:#222222;}
.nav-item::after{content:'';display:block;width:0px;height:2px;background:#fec400;transition: 0.2s;}
.nav-item:hover::after{width:100%;}
.navbar-dark .navbar-nav .active > .nav-link, .navbar-dark .navbar-nav .nav-link.active, .navbar-dark .navbar-nav .nav-link.show, .navbar-dark .navbar-nav .show > .nav-link,.navbar-dark .navbar-nav .nav-link:focus, .navbar-dark .navbar-nav .nav-link:hover{color:#fec400;}
.nav-link{padding:15px 5px;transition:0.2s;}
.dropdown-item.active, .dropdown-item:active{color:#212529;}
.dropdown-item:focus, .dropdown-item:hover{background:#fec400;}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
            <a href="/url/playerinfo:list" class="navbar-brand">SC_PLAYER</a>
            <button class="navbar-toggler" type="button" data-target="#navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a href="/url/playerinfo:list" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="/url/playerinfo:insert" class="nav-link">Insert</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navdrop" role="button" data-toggle="dropdown" data-hover="dropdown">Services</a>
                        <div class="dropdown-menu" aria-labelledby="navdrop">
                            <a href="#" class="dropdown-item">---</a>
                            <a href="#" class="dropdown-item">Service2</a>
                            <a href="#" class="dropdown-item">Service3</a>
                        </div>
                        
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">Contact Us</a>
                    </li>
                </ul>
            </div>
        </nav>
</body>
<script>


</script>
</html>