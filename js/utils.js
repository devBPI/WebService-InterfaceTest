//String Extenstion to format string for xml content.
//Replces xml escape chracters to their equivalent html notation.
String.prototype.EncodeXMLEscapeChars = function ()
{
	var OutPut = this;
	if ($.trim(OutPut) != "")
	{
		OutPut = OutPut.replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#39;");
		OutPut = OutPut.replace(/&(?!(amp;)|(lt;)|(gt;)|(quot;)|(#39;)|(apos;))/g, "&amp;");
		OutPut = OutPut.replace(/([^\\])((\\\\)*)\\(?![\\/{])/g, "$1\\\\$2");  //replaces odd backslash(\\) with even.
	}
	else
	{
		OutPut = "";
	}
	return OutPut;
};

