<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

  
  <!--Declare Global Parameter route and set it to default-->
<xsl:param name="route" select= "'16'"/>
  
 
  <xsl:output method="html" indent="yes"/>
  
<xsl:template match="/">
  
    
  <table style ="width:1500px" border ="3">
            
               <colgroup>
                <col width ="100px"></col>
                <col width ="200px"></col>
                <col span ="4" width="300px"></col>
              </colgroup>
              <tr>
                <th> Stop # </th>
                <th> Stop Name</th>
                <th> Lattitude</th>
                <th> Longitude </th>
                <th> Routes </th>
              </tr>

    <xsl:if test="$route=''">
                          <div id ="stopsFound" style= "padding:20px 2xpx 20px 0px;font-size:30px;margin-bottom:10px;font-weight:bold;"> <xsl:value-of select="count(//stop)"/> Stops Found</div>

      <xsl:for-each select="//stop">
        <xsl:sort select="@number" data-type="number" order="ascending"/>
        <tr>
          <td id="stop" align="center">
            <xsl:value-of select="@number"/>
          </td>
          <td align="center">
            <xsl:value-of select="@name"/>
          </td>
          <td align="center">
            <xsl:value-of select="location//latitude"/>
          </td>
          <td align="center">
            <xsl:value-of select="location//longitude"/>
          </td>
          <td align="center">
            <xsl:value-of select="routes"/>
          </td>
        </tr>
      </xsl:for-each>
    </xsl:if>
        
        

                <xsl:if test="$route!=''">
                    <div id ="stopsFound" style= "padding:20px 2xpx 20px 0px;font-size:30px;margin-bottom:10px;font-weight:bold;"> <xsl:value-of select="count(//stop[routes=$route])"/> Stops Found</div>

              <xsl:for-each select="//stop[contains(routes,$route)]">
                
                <xsl:sort select="@number" data-type="number" order="ascending"/>
                <tr>
                  <td id="stop" align="center">
                    <xsl:value-of select="@number"/>
                  </td>
                       <td align="center">
                    <xsl:value-of select="@name"/>
                  </td>
                       <td align="center">
                    <xsl:value-of select="location//latitude"/>
                  </td>
                     <td align="center">
                    <xsl:value-of select="location//longitude"/>
                  </td>
                       <td align="center" >
                    <xsl:value-of select="routes"/>
                  </td>
                </tr>
              </xsl:for-each>
  </xsl:if>          
  </table>
  

  </xsl:template>

</xsl:stylesheet>
