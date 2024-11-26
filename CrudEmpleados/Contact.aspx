<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="CrudEmpleados.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <%--        <h2 id="title"><%: Title %>.</h2>--%>
        <h3>Mis datos de contacto</h3>

        <address>
            <strong>Correo:</strong>  <a href="mailto:stefanolucagaggero@gmail.com">stefanolucagaggero@gmail.com</a><br />
            <strong>LinkedIn:</strong> <a href="https://www.linkedin.com/in/stefano-gaggero-508a09183/" target="_blank">linkedin.com/in/stefano-gaggero-508a09183/</a><br />
            <strong>Github:</strong> <a href="https://github.com/lucagaggero7" target="_blank">github.com/lucagaggero7</a><br />
            <strong>Portfolio:</strong> <a href="https://portafolio-stefano-gaggero.netlify.app/" target="_blank">portafolio-stefano-gaggero.netlify.app/</a>
        </address>
    </main>
</asp:Content>
