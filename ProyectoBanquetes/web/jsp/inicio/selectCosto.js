var xmlHttp

function mostrarCosto(idSalon)
{
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("our browser does not support AJAX!");
  return;
  }
var url="getCosto.jsp";
url=url+"?idSalon="+idSalon;
xmlHttp.onreadystatechange=stateChanged;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}

function stateChanged()
{
if (xmlHttp.readyState==4)
{
document.getElementById("costo").innerHTML=xmlHttp.responseText;
}
}

function GetXmlHttpObject()
{
var xmlHttp=null;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp;
}