<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboardcombine.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>biz era dashboard</title>

    <!-- Bootstrap core CDN -->
    <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">-->

    <!--boostrap css-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="bootstrap-4.3.1-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/linktable.css" />
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="css/dashboardstylesheet.css" rel="stylesheet" type="text/css" />
    <link href="css/dashboardfilter.css" rel="stylesheet" type="text/css" />
</head>

<main role="main">

    <body class="bg-light">
        <form id="form1" runat="server">
            <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
                <a class="navbar-brand mr-auto mr-lg-0" href="#">Biz Era</a>
                <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                    <ul class="navbar-nav mr-auto">
                        <!--
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home<span class="sr-only">(current)</span></a>
                    </li>
                    -->
                        <li class="nav-item active">
                            <asp:Label class="nav-link" ID="Label1" runat="server" Text="Label"><span class="sr-only">(current)</span>
                            </asp:Label>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">Notifications<span class="badge badge-danger">5</span></a>
                            <!-- Will be added later as a seperate pproject to show the notification -->
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="http://www.office.biz-era.net:8088/office/Profile.cfm">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.aspx">Log out</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">Settings</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown01">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>
                    </ul>
                    <formview>
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"/>
                    </formview>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>

                </div>
            </nav>

            <!--start of filter icons-->

            <div class="container">
                <div class="">
                    <h2>Biz Era Applications</h2>
                </div>
                <!--change the photo,graphic and web-design to anything-->
                <div>
                    <button class="btn btn-primary filter-button" data-filter="all">All</button>
                    <button class="btn btn-default filter-button" data-filter="management">Management Applications</button>
                    <button class="btn btn-default filter-button" data-filter="staff">Staff Applications</button>
                    <button class="btn btn-default filter-button" data-filter="admin">Admin Applications</button>
                    <button class="btn btn-default filter-button" data-filter="dev">Developer Dept</button>
                    <button class="btn btn-default filter-button" data-filter="si">System Integration Dept</button>
                </div>
                <br />

                <!-- rmb to change the category description when changing the filter names-->
                <div class="row">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>

                            <div class="col-md-3 filter <%# Eval("iconFilter").ToString() %>">
                                <div class="each-item">
                                    <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
                                        <image width="140" height="140" xlink:href="pictures/<%# Eval("iconImageFile").ToString() %>"
                                            alt="vacation Icon">
                                    </svg>
                                    <h3><%# Eval("iconTitle").ToString() %></h3>
                                    <p><%# Eval("iconDescription").ToString() %></p>
                                    <p>
                                        <%--<a class="btn btn-secondary" id="counter" href="<%# Eval("iconLink").ToString() %>"
                    role="button"><%# Eval("iconButton").ToString() %>&raquo;

                    </a>--%>
                                        <asp:Label ID="Label3" runat="server" Text="<%# Container.ItemIndex %>" Visible="false"></asp:Label>
                                        <asp:LinkButton CssClass="btn btn-secondary" ID="link2"
                                            CommandName='<%# Eval("iconLink").ToString() %>' runat="server" OnClick="abc">
                      <%# Eval("iconButton").ToString() %></asp:LinkButton>

                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>

                    </asp:Repeater>

                    <%--<div class="col-md-3 filter photo">
          <div class="each-item">
            <!-- <div class="col-lg-4">-->
            <!--<img class="port-image" src="http://www.newdesignfile.com/postpic/2009/09/microsoft-word-2013-icon_96502.png"/>-->
            <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
              <!--<title>Placeholder</title>-->
              <image class="port-image" width="140" height="140" xlink:href="pictures/office365.jpeg"
                alt="office365 Icon">
            </svg>
            <h3>office 365</h3>
            <p>Online versions of Microsoft Word, PowerPoint, Excel, and OneNote</p>
            <p><a class="btn btn-secondary" href="#" role="button">office 365 &raquo;</a></p>
            <!--</div>-->
            <!-- /.col-lg-4 -->
            <!-- ONLY IF YOU WANT THE FADE IN EFFECT-->
            <%--<div class="cap1">
                    <h3>Microsoft Word</h3>
                    <p>Word description</p>
                </div>
                <div class="cap2">
                    <p class="text-center">Visit</p>
                </div>

          </div>

        </div>

        <div class="col-md-3 filter graphic photo">
          <div class="each-item">

            <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
              <image class="port-image" width="140" height="140" xlink:href="pictures/tickets.png" alt="ticket Icon">
            </svg>
            <h3>Biz Ticket</h3>
            <p>biz ticket description</p>
            <p><a class="btn btn-secondary" href="#" role="button">Biz ticket &raquo;</a></p>

          </div>
        </div>

        <div class="col-md-3 filter webdesign">
          <div class="each-item">
            <!--<img class="port-image" src="https://cdn.freebiesupply.com/logos/large/2x/microsoft-excel-2013-logo-png-transparent.png"/>-->

            <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
              <image class="port-image" width="140" height="140" xlink:href="pictures/telephone.png" alt="phone Icon">
            </svg>
            <h3>Phone log</h3>
            <p>Phone log description</p>
            <p><a class="btn btn-secondary" href="#" role="button">Phone Log &raquo;</a></p>

          </div>
        </div>

        <div class="col-md-3 filter graphic photo">
          <div class="each-item">

            <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
              <image class="port-image" width="140" height="140" xlink:href="pictures/book.png" alt="knowledge Icon">
            </svg>
            <h3>Knowledge</h3>
            <p>Big Database of Info</p>
            <p><a class="btn btn-secondary" href="#" role="button">Knowledge &raquo;</a></p>

          </div>
        </div>

        <div class="col-md-3 filter webdesign graphic">
          <div class="each-item">
            <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
              <image class="port-image" width="140" height="140" xlink:href="pictures/people.png" alt="people Icon">
            </svg>
            <h3>Staff</h3>
            <p>People in the company</p>
            <p><a class="btn btn-secondary" href="#" role="button">Staff details &raquo;</a></p>
          </div>
        </div>

        <div class="col-md-3 filter photo">
          <div class="each-item">
            <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
              <image width="140" height="140" xlink:href="pictures/vacation.png" alt="vacation Icon">
            </svg>
            <h3>Leave</h3>
            <p>Info Tech HR software link</p>
            <p><a class="btn btn-secondary" href="#" role="button">Apply for leave &raquo;</a></p>
          </div>
        </div>
      </div>
            </div>--%>
                    <!--end of filter icons-->


                    <!-- icons
      ================================================== -->
                    <!-- Wrap the rest of the page in another container to center all the content. -->

                    <%-- <div class="container icons">
      <!-- Three columns of text below the navbar -->
      <div class="row">
        <div class="col-lg-4">
          <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
            <!--<title>Placeholder</title>-->
            <image width="140" height="140"
              xlink:href="https://www.clipartmax.com/png/middle/92-924663_managed-office365-logo-microsoft-office-icon-2015.png"
              alt="office365 Icon">
          </svg>

          <h2>office 365</h2>
          <p>Online versions of Microsoft Word, PowerPoint, Excel, and OneNote</p>
          <p><a class="btn btn-secondary" href="#" role="button">office 365 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->

        <div class="col-lg-4">
          <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
            <!--<title>Placeholder</title>-->
            <image width="140" height="140"
              xlink:href="https://therockandblues.com/wp-content/uploads/2018/07/tickets.png" alt="ticket Icon">
          </svg>
          <h2>Biz Ticket</h2>
          <p>biz ticket description</p>
          <p><a class="btn btn-secondary" href="#" role="button">Biz ticket &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
            <image width="140" height="140"
              xlink:href="https://i.pinimg.com/originals/b5/d7/19/b5d7198734ee5174b581630628ecfdd6.png"
              alt="phone Icon">
          </svg>
          <!--<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>-->
          <h2>Phone log</h2>
          <p>Phone log description</p>
          <p><a class="btn btn-secondary" href="#" role="button">Phone Log &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->


      <!-- Three columns of text below the 1st row -->
      <div class="row">
        <div class="col-lg-4">
          <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
            <image width="140" height="140"
              xlink:href="https://banner2.kisspng.com/20180419/xwe/kisspng-knowledge-base-knowledge-management-information-knowledge-clipart-5ad858aca46459.7957653315241279166734.jpg"
              alt="knowledge Icon">
          </svg>
          <h2>Knowledge</h2>
          <p>Big Database of Info</p>
          <p><a class="btn btn-secondary" href="#" role="button">Knowledge &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
            <image width="140" height="140"
              xlink:href="https://radixcloud.com/wp-content/uploads/2015/08/featured_staff.png" alt="knowledge Icon">
          </svg>
          <h2>Staff</h2>
          <p>People in the company</p>
          <p><a class="btn btn-secondary" href="#" role="button">Staff details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
            <image width="140" height="140"
              xlink:href="https://www.pngarts.com/files/1/Vacation-Beach-Free-PNG-Image.png" alt="knowledge Icon">
          </svg>
          <h2>Leave</h2>
          <p>Info Tech HR software link</p>
          <p><a class="btn btn-secondary" href="#" role="button">Apply for leave &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
                    --%>


                    <!--favourite and recommended sites-->


                    <%--<div class="row mb-2">
                <div class="col-md-6">
                    <div class="card flex-md-row mb-6">
                        <div class="card-body d-flex flex-column align-items-start">
                            <strong class="d-inline-block mb-2 text-primary">Favourite</strong>
                            <h3 class="mb-0">
                                <a class="text-dark" href="#">Favourite Sites</a>
                            </h3>
                            <div class="mb-1 text-muted">date</div>
                            <p class="card-text mb-auto">description</p>
                            <!--<a href="#">Continue reading</a>-->

                            <!-- Basic dropdown -->
                            <button class="btn btn-primary dropdown-toggle mr-4" type="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                List</button>

                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">1)link 1</a>
                                <a class="dropdown-item" href="#">2)link 2</a>
                                <a class="dropdown-item" href="#">3)link 3</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">More</a>
                            </div>
                            <!-- Basic dropdown -->
                        </div>
                        <%--<img class="card-img-right flex-auto d-none d-md-block" data-src="holder.js/200x250?theme=thumb" alt="Card image cap">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card flex-md-row mb-6 ">
                        <div class="card-body d-flex flex-column align-items-start">
                            <strong class="d-inline-block mb-2 text-success">Recommended</strong>
                            <h3 class="mb-0">
                                <a class="text-dark" href="#">Recommended sites</a>
                            </h3>
                            <div class="mb-1 text-muted">date</div>
                            <p class="card-text mb-auto">description</p>
                            <!-- Basic dropdown -->
                            <button class="btn btn-primary dropdown-toggle mr-4" type="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                List</button>


                            <div class="dropdown-menu">
                                <asp:Repeater ID="Repeater3" runat="server">
                                    <ItemTemplate>
                                        <a class="dropdown-item" href="<%# Eval("favLink").ToString() %>"><%# Eval("favTitle").ToString() %></a>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">More</a>
                            </div>

                            <!-- Basic dropdown -->
                        </div>
                        <%--<img class="card-img-right flex-auto d-none d-md-block" data-src="holder.js/200x250?theme=thumb" alt="Card image cap">
                    </div>
                </div>
            </div>--%>

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6">

                                <strong class="d-inline-block mb-2 text-primary">Favourite</strong>
                                <h3 class="mb-0">
                                    <a class="text-dark" href="#">Favourite Sites</a>
                                </h3>
                                <%-- <div class="mb-1 text-muted">date</div>
                        <p class="card-text mb-auto">description</p>
                        <a href="#">Continue reading</a>--%>
                                <label for="textInput">Title of Website</label>
                                <asp:TextBox ID="textInput" class="form-control mb-4" placeholder="Text input" runat="server"></asp:TextBox>
                                <label for="textInput">Website URL</label>
                                <asp:TextBox ID="textInput1" class="form-control mb-4" placeholder="Text input" runat="server"></asp:TextBox>

                                <%--<button type="submit" class="btn btn-labeled btn-success" runat="server" onclick="qwe">
                                    <span class="btn-label">
                                        <i class="glyphicon glyphicon-ok"></i>
                                    </span>Add
                                </button>
                                <button type="submit" class="btn btn-labeled btn-danger">
                                    <span class="btn-label"><i class="glyphicon glyphicon-remove"></i></span>Remove</button>--%>

                                <asp:Button ID="Button1" CssClass="btn btn-labeled btn-success" runat="server" Text="Add" OnClick="qwe"></asp:Button>
                                <asp:Button ID="Button2" CssClass="btn btn-labeled btn-danger" runat="server" Text="Remove" />
                                <br />

                                <label for="textInput">List of Websites</label>
                                <select class="browser-default custom-select mb-4" id="select" onchange="location=this.value;">
                                    <option value="" disabled="" selected="">Choose your option</option>
                                    <asp:Repeater ID="Repeater3" runat="server">
                                        <ItemTemplate>
                                            <option value="<%# Eval("favLink").ToString() %>"><%# Eval("favTitle").ToString() %></option>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </select>


                            </div>
                            <div class="col-sm-6">
                                <strong class="d-inline-block mb-2 text-success">Recommended</strong>
                                <%--<h3 class="mb-0">
                                    <a class="text-dark" href="#">Recommended sites</a>
                                </h3>--%>
                                <%--<div class="mb-1 text-muted">date</div>
                                <p class="card-text mb-auto">description</p>--%>

                                <!-- start of link table -->
                                <div class="container">
                                    <div class="table-wrapper">
                                        <div class="table-title">
                                            <div class="row">
                                                <div class="col-sm-8">
                                                    <h2>Recommended <b>Sites</b></h2>
                                                </div>
                                                <div class="col-sm-4">

                                                    <!-- Button trigger modal -->
                                                    <button type="button" class="btn btn-info add-new" data-toggle="modal" data-target="#basicExampleModal">
                                                        Add New
                                                    </button>

                                                    <!-- Modal -->
                                                    <div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Add new recommended website</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <%--start stuff to put inside the modal body--%>
                                                                    <label for="textInput">Title of Website</label>
                                                                    <asp:TextBox ID="TextInput2" class="form-control mb-4" placeholder="Text input" runat="server"></asp:TextBox>
                                                                    <label for="textInput">Website URL</label>
                                                                    <asp:TextBox ID="TextInput3" class="form-control mb-4" placeholder="Text input" runat="server"></asp:TextBox>
                                                                    <%--end of the modal body--%>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                    <asp:Button ID="Button3" CssClass="btn btn-success" runat="server" Text="Save Changes" OnClick="addrecwebsite"></asp:Button>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Title</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="Repeater4" runat="server">
                                                    <ItemTemplate>
                                                        <tr>

                                                            <td><%# Eval("favTitle").ToString() %></td>
                                                            <td>

                                                                <a class="add" title="Add" data-toggle="tooltip">
                                                                    <i class="material-icons">&#xE03B;</i>
                                                                </a>
                                                                <a class="edit" title="Edit" data-toggle="tooltip">
                                                                    <i class="material-icons">&#xE254;</i>
                                                                </a>
                                                                <a class="delete" title="Delete" data-toggle="tooltip">
                                                                    <i class="material-icons">&#xE872;</i>
                                                                      <asp:Button ID="Button2" CssClass="btn btn-labeled btn-danger" runat="server" Text="Remove" />
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- End of link table -->

                                <!-- Basic dropdown -->
                                <button class="btn btn-primary dropdown-toggle mr-4" type="button" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                    List</button>

                                <div class="dropdown-menu">
                                    <asp:Repeater ID="Repeater2" runat="server">
                                        <ItemTemplate>
                                            <a class="dropdown-item" href="<%# Eval("favLink").ToString() %>"><%# Eval("favTitle").ToString() %></a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">More</a>
                                </div>

                                <!-- Basic dropdown -->
                            </div>
                        </div>

                        <!-- START THE FEATURETTES -->

                        <!-- /END THE FEATURETTES -->

                    </div>
                    <!-- /.container -->
        </form>
    </body>


    <!-- START OF FOOTER-->
    <footer class="container">
        <p class="float-right">
            <a href="#">Back to top</a>
        </p>
        <p>
            &copy; 2000~2019 Biz Era &middot;
        <a href="#">Privacy</a> &middot; <a href="#">Terms</a>
        </p>
    </footer>
    <!--END OF FOOTER-->
</main>
<!-- Placed at the end of the document so the pages load faster -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!--
        <script type="text/javascript" src="js/jquery-3.3.1.slim.min.js"></script>
        <script src="node_modules/popper.js/dist/popper.min.js"></script>
        <script src="bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
        <!-- Just to make our placeholder images work. -->
<script src="holder/holder.min.js"></script>
<!--

    Place the following <script>s near the end of your pages, right before the closing </body> tag, to enable them. 
    jQuery must come first, then Popper.js, and then our JavaScript plugins.

    Components requiring JAVASCRIPT
    Alerts for dismissing
    Buttons for toggling states and checkbox/radio functionality
    Carousel for all slide behaviors, controls, and indicators
    Collapse for toggling visibility of content
    Dropdowns for displaying and positioning (also requires Popper.js)
    Modals for displaying, positioning, and scroll behavior
    Navbar for extending our Collapse plugin to implement responsive behavior
    Tooltips and popovers for displaying and positioning (also requires Popper.js)
    Scrollspy for scroll behavior and navigation updates 
    -->

<script src="js/dashboardfilter.js"></script>
<script src="js/dashboardscript.js"></script>
<script src="js/linktable.js"></script>

</html>
