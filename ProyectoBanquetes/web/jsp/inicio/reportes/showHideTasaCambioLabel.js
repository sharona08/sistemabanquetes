var xmlHttp3

function showHideTasaLabel(tipoCambio2)
{
xmlHttp3=GetXmlHttpObject();
if (xmlHttp3==null)
  {
  alert ("our browser does not support AJAX!");
  return;
  }
var url="getTasaCambioLabel.jsp";
url=url+"?tipoCambio2="+tipoCambio2;
xmlHttp3.onreadystatechange=stateChanged3;
xmlHttp3.open("GET",url,true);
xmlHttp3.send(null);

}

function stateChanged3()
{
if (xmlHttp3.readyState==4)
{
document.getElementById("tasaCambioLabel").innerHTML=xmlHttp3.responseText;
}
}

function GetXmlHttpObject()
{
var xmlHttp3=null;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp3=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp3=new ActiveXObject("Msxml3.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp3=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp3;
}