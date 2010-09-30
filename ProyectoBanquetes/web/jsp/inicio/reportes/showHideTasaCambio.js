var xmlHttp2

function showHideTasa(tipoCambio)
{
xmlHttp2=GetXmlHttpObject();
if (xmlHttp2==null)
  {
  alert ("our browser does not support AJAX!");
  return;
  }
var url="getTasaCambio.jsp";
url=url+"?tipoCambio="+tipoCambio;
xmlHttp2.onreadystatechange=stateChanged2;
xmlHttp2.open("GET",url,true);
xmlHttp2.send(null);

}

function stateChanged2()
{
if (xmlHttp2.readyState==4)
{
document.getElementById("tasaCambio").innerHTML=xmlHttp2.responseText;
}
}

function GetXmlHttpObject()
{
var xmlHttp2=null;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp2=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp2=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp2=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp2;
}