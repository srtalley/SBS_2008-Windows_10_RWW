<%@ Page language="c#" Codebehind="tsweb.aspx.cs" AutoEventWireup="false" Inherits="Microsoft.WindowsServerSolutions.IWorker.RWW.TsPage" %>
<%@ Import Namespace="Microsoft.WindowsServerSolutions.IWorker.RWW" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml" >
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="copyright" content="Copyright (c) Microsoft Corporation.  All rights reserved." />
		<title><%=loadResString("L_RUP_TITLE")%></title>
        <style type="text/css">
            .theme2 {
	            font-family: Segoe UI, Verdana, Tahoma, sans-serif;
	            background-color: #eeeeee;
	            color: #08558B;
            	font-size: 80%;
            	margin: 0px;
	            padding: 20px;
            }
            .theme2 a {
	            text-decoration:none;
	            border:none;
            }
            .theme2 a:visited {
            	color:#08558B;
	            border:none;
            }
            .tsString {
            	padding-bottom:12px;
            }
            .tsStringGray {
	            text-align:right;
	            color:#666666;
            }
            #header {
	            background-color: #FFFFFF;
	            margin: 0px;
	            padding: 15px;
            }
            #identity2 {
	            clear: right;
	            margin-bottom: 20px;
	            position: relative;
            }
            #connectingText, #connectingText2 {
	            color: #000000;
	            font-family: "Segoe UI", Verdana, Tahoma, sans-serif;
	            font-size: 0.8333em;
	            padding-left: 26px;
            }

		</style>
	</head>


	<body>

		<script type="text/javascript" language=javascript>
		//  Retrieve the value of the cookie with the specified name.
		function GetCookie(sName)
		{
			// cookies are separated by semicolons			
			var aCookie = document.cookie.split("; ");
			for (var i=0; i < aCookie.length; i++)
			{
				// a name/value pair (a crumb) is separated by an equal sign
				var aCrumb = aCookie[i].split("=");
				if (sName == aCrumb[0])
				return unescape(aCrumb[1]);
			}			

			// a cookie with the requested name does not exist
			return null;
		}
		</script>
		<script type="text/vbscript" language="vbscript">
		const ReplaceString0 = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_ReplaceString0"))%>"
		const ErrMsg_Text = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_ErrMsg_Text"))%>"

		' error messages
		const RemoteDesktopCaption_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_RemoteDesktopCaption_ErrorMessage"))%>"
		const DisconnectedCaption_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_DisconnectedCaption_ErrorMessage"))%>"
		const DisconnectRemoteByServer_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_DisconnectRemoteByServer_ErrorMessage"))%>"
		const LowMemory_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_LowMemory_ErrorMessage"))%>"
		const SecurityErr_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_SecurityErr_ErrorMessage"))%>"
		const BadServerName_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_BadServerName_ErrorMessage"))%>"
		const CannotLoopBackConnect_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_CannotLoopBackConnect_ErrorMessage"))%>"
		const NetworkErr_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_NetworkErr_ErrorMessage"))%>"
		const InternalErr_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_InternalErr_ErrorMessage"))%>"
		const NotResponding_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_NotResponding_ErrorMessage"))%>"
		const EncryptionError_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_EncryptionError_ErrorMessage"))%>"
		const ProtocolErr_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_ProtocolErr_ErrorMessage"))%>"
		const IllegalServerName_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_IllegalServerName_ErrorMessage"))%>"
		const ConnectionTimeout_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_ConnectionTimeout_ErrorMessage"))%>"
		const DisconnectIdleTimeout_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_DisconnectIdleTimeout_ErrorMessage"))%>"
		const DisconnectLogonTimeout_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_DisconnectLogonTimeout_ErrorMessage"))%>"
		const ProtocolErrWITHCODE_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_ProtocolErrWITHCODE_ErrorMessage"))%>"
		const LicensingNegotFailed_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_LicensingNegotFailed_ErrorMessage"))%>"
		const DisconnectRemoteByServerTool_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_DisconnectRemoteByServerTool_ErrorMessage"))%>"
		const LogoffRemoteByServer_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_LogoffRemoteByServer_ErrorMessage"))%>"
		const DisconnectByOtherConnection_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_DisconnectByOtherConnection_ErrorMessage"))%>"
		const ServerOutOfMemory_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_ServerOutOfMemory_ErrorMessage"))%>"
		const LicenseInternal_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_LicenseInternal_ErrorMessage"))%>"
		const NoLicenseServer_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_NoLicenseServer_ErrorMessage"))%>"
		const NoLicense_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_NoLicense_ErrorMessage"))%>"
		const LicenseBadClientMsg_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_LicenseBadClientMsg_ErrorMessage"))%>"
		const LicenseHwidDoesntMatch_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_LicenseHwidDoesntMatch_ErrorMessage"))%>"
		const BadClientLicense_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_BadClientLicense_ErrorMessage"))%>"
		const LicenseCantFinishProtocol_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_LicenseCantFinishProtocol_ErrorMessage"))%>"
		const LicenseClientEndedProtocol_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_LicenseClientEndedProtocol_ErrorMessage"))%>"
		const LicenseBadClientEncryption_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_LicenseBadClientEncryption_ErrorMessage"))%>"
		const CantUpgradeLicense_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_CantUpgradeLicense_ErrorMessage"))%>"
		const LicenseNoRemoteConnections_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_LicenseNoRemoteConnections_ErrorMessage"))%>"
		const DecompressionFailed_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_DecompressionFailed_ErrorMessage"))%>"
		const ServerDeniedConnection_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_ServerDeniedConnection_ErrorMessage"))%>"
		const ServerDeniedConnection1_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_ServerDeniedConnection1_ErrorMessage"))%>"
		const ServerDeniedConnection2_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_ServerDeniedConnection2_ErrorMessage"))%>"
		const ServerDeniedConnection3_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_ServerDeniedConnection3_ErrorMessage"))%>"
		const ServerDeniedConnection4_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_ServerDeniedConnection4_ErrorMessage"))%>"
		const ControlLoadFailed_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_ControlLoadFailed_ErrorMessage", rapLinks.RWWPlugin.GetRdpNotLoadErrorLink()))%>"
		const InvalidServerName_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_InvalidServerName_ErrorMessage"))%>"
		const IncorrectClientVersion_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_IncorrectClientVersion_ErrorMessage"))%>"
		const InvalidCert_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_InvalidCert_ErrorMessage"))%>"
		const TSGServiceStopped_ErrorMessage = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_TSGServiceStopped_ErrorMessage"))%>"

		' TS connecting message
		const TSRemoteDesktopSession_Text = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_TSRemoteDesktopSession_Text"))%>"
		const TSConnectingPleaseWait_Text = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_TSConnectingPleaseWait_Text"))%>"
		const TSConnectingIfCloseThisWindow_Text = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_TSConnectingIfCloseThisWindow_Text"))%>"


		const TS_PERF_DISABLE_WALLPAPER = &h00000001
		const TS_PERF_DISABLE_FULLWINDOWDRAG = &h00000002
		const TS_PERF_DISABLE_MENUANIMATIONS = &h00000004
		const TS_PERF_DISABLE_THEMING = &h00000008
		const TS_PERF_ENABLE_ENHANCED_GRAPHICS = &h00000010
		const TS_PERF_DISABLE_CURSOR_SHADOW = &h00000020
		const TS_PERF_DISABLE_CURSORSETTINGS = &h00000040



		sub window_onload()
			Dim targetMachineName
			Dim version 
			Dim Parts
			Dim Major
			On Error Resume Next
			version = MsRdpClient.Version
			if Err then
			   msgbox ControlLoadFailed_ErrorMessage,0,RemoteDesktopCaption_ErrorMessage
			   exit sub
			end if  
			Parts=split(version,".")
			Major=CInt(Parts(0))
			On Error GoTo 0
			if Major < 6 then
			msgbox IncorrectClientVersion_ErrorMessage+" Version: "+version, 0, RemoteDesktopCaption_ErrorMessage
			   window.close
			   exit sub
			end if

			On Error Resume Next
			
			
			' If there is a domain name, set it
			MsRdpClient.Domain = "<%=RWWUtilities.QuoteVbscriptString(strQualifiedDomainName)%>"
			
			' Set the name of the machine we want to TS to (MsRdpClient.server)
			targetMachineName = trim("<%=RWWUtilities.QuoteVbscriptString(tsTargetMachineName)%>")
			MsRdpClient.server = targetMachineName
			
			if Err then
				msgbox InvalidServerName_ErrorMessage,0,RemoteDesktopCaption_ErrorMessage
				Err.Clear
				window.close
				exit sub
			end if
			
			configRdpSettings (targetMachineName)
			if Err then
	  		  msgbox IncorrectClientVersion_ErrorMessage, 0, RemoteDesktopCaption_ErrorMessage
			  Err.Clear
			  window.close
			exit sub
			end if
			
	 		configRdp61OnlySettings
			'Connect
			MsRdpClient.Connect
		end sub

		' Setting RDP client config parameters. Some of these parameters may not be available in earlier
		' versions of the client. In that case this subroutine throws an error. The error is caught by the
		' calling subroutine which gives appropriate error message to the user.
		sub configRdpSettings (targetMachineName)
			Dim resWidth
			Dim resHeight
			Dim sresWidth
			Dim sresHeight
			Dim gatewayServerName
		
		
			'Resolution
			MsRdpClient.FullScreen = TRUE
			if ( screen.width > 1600 ) then
				sresWidth = 1600
			else
				sresWidth = screen.width
			end if
			if ( screen.height > 1200 ) then
				sresHeight = 1200
			else
				sresHeight = screen.height
			end if
			resWidth  = 1
			resHeight = 1
			
			'targetMachineName connecting text
			Document.all.remoteDesktopSession.innerHtml = TSRemoteDesktopSession_Text
			Document.all.connectingPleaseWait.innerHtml = Replace(TSConnectingPleaseWait_Text, ReplaceString0, targetMachineName)
			Document.all.ifCloseThisWindow.innerHtml = TSConnectingIfCloseThisWindow_Text

			
			MsRdpClient.DesktopWidth  = sresWidth
			MsRdpClient.DesktopHeight = sresHeight
			MsRdpClient.Width	  = resWidth
			MsRdpClient.Height	  = resHeight
			
			'Device redirection options
			MsRdpClient.AdvancedSettings2.RedirectDrives			 = FALSE
			MsRdpClient.AdvancedSettings2.RedirectPrinters			 = TRUE
			MsRdpClient.AdvancedSettings2.ConnectToServerConsole		 = FALSE
			if MsRdpClient.SecuredSettingsEnabled then
				'0 = Redirect remote sounds to the client.
				'1 = Play sounds at the remote computer.
				'2 = Disable sound redirection; do not play sounds at the server.
				MsRdpClient.SecuredSettings.AudioRedirectionMode	 = 2
			end if
			
			MsRdpClient.AdvancedSettings2.RedirectSmartCards		 = FALSE
			MsRdpClient.AdvancedSettings2.RedirectPorts			 = FALSE
			MsRdpClient.AdvancedSettings2.EnableAutoReconnect		 = FALSE
			MsRdpClient.AdvancedSettings2.MinutesToIdleTimeout		 = <%=timeoutInMinutes%>
			MsRdpClient.AdvancedSettings4.ConnectionBarShowRestoreButton	 = FALSE
			MsRdpClient.ConnectingText					 = "<%=RWWUtilities.QuoteVbscriptString(loadResString("L_RUP_CONNECTING"))%>"
			
			' Performance settings
			MsRdpClient.AdvancedSettings2.BitmapPersistence = 1
			
			' If there is a Port, set it
			MsRdpClient.AdvancedSettings2.RDPPort = 3389
			
			' If there is a user name, set it
			MsRdpClient.UserName = "<%=RWWUtilities.QuoteVbscriptString(rapLinks.userLogonName)%>"
			if not IsNull(GetCookie("RUPTSAuth")) then					
				MsRdpClient.AdvancedSettings.ClearTextPassword = GetCookie("RUPTSAuth")
			end if
			
			'FullScreen title
			MsRdpClient.FullScreenTitle = targetMachineName
			
			'Display connect region
			Document.all.connectArea.style.display = "block"
			
	         if (<%=UseTsGatewayFlag%>) then 
			    ' Set the gateway hostname. This can be overridden by GP
			    gatewayServerName = trim(window.location.hostname)
		    	MsRdpClient.TransportSettings.GatewayHostName = gatewayServerName
		    	
		    	' Set the usage method.This is not defined by GP
			    ' 1 : always use gateway when connecting,  0 or 2 : Use gateway only if required
		    	MsRdpClient.TransportSettings.GatewayUsageMethod = 1
			
		    	'Set the authentication method. This can be overridden by GP
		    	'0: use NTLM, 1: smartcard. Other methods are not settable via activex.
		    	MsRdpClient.TransportSettings.GatewayCredsSource = 0
			
		    	' Set the type of profile
		    	' 0: use whatever is set in GP, 1: use the settings defined as set in the object above. If GP overrides some settings, they 'will still be overridden
			    MsRdpClient.TransportSettings.GatewayProfileUsageMethod = 1
			end if 
			
		end sub

		' This subroutine sets some properties which are available only in RDP6.1 (XP SP3 and Vista SP1 onwards). If customer has
		' older version we do not throw an error here. Instead we go through with a slightly inferior UX.
		sub configRdp61OnlySettings

			' If GatewayCredSharing is not set, customer will see two logon prompts - for TSG and TS server, but we should continue
			On Error Resume Next
			if (<%=UseTsGatewayFlag%>) then 
				' Pass the credentials used for the gateway to the remote computer
				MsRdpClient.TransportSettings2.GatewayCredSharing = 1
				MsRdpClient.TransportSettings2.GatewayDomain = "<%=RWWUtilities.QuoteVbscriptString(strQualifiedDomainName)%>"
			end if
			MsRdpClient.AdvancedSettings6.EnableCredSspSupport = TRUE
		end sub
		
		sub window_onunload()
			if MsRdpClient.Connected then
				MsRdpClient.Disconnect
			end if
		end sub
		
		function getQS ( sKey )
			Dim iKeyPos, iDelimPos, iEndPos
			Dim sURL, sRetVal
			iKeyPos = iDelimPos = iEndPos = 0
			sURL = window.location.href
			
			if sKey = "" Or Len(sKey) < 1 then
				getQS = ""
				exit function
			end if
			
			iKeyPos = InStr ( 1, sURL, sKey )
			
			if iKeyPos = 0 then
				sRetVal = ""
				exit function
			end if
			
			iDelimPos = InStr ( iKeyPos, sURL, "=" )
			iEndPos = InStr ( iDelimPos, sURL, "&" )
			
			if iEndPos = 0 then
				sRetVal = Mid ( sURL, iDelimPos + 1 )
			else
				sRetVal = Mid ( sURL, iDelimPos + 1, iEndPos - iDelimPos - 1 )
			end if
			
			getQS = sRetVal
		end function
		
		sub OnControlLoadError
			msgbox ControlLoadFailed_ErrorMessage,0,RemoteDesktopCaption_ErrorMessage
		end sub
		
		
		</script>
        <div id="header">
	        <div id="identity2"><img src="<%=rapLinks.RWWConfig.wssgLogo %>" /></div>
	          <div id="connectArea" class="tsString" style="display:none">
	          <OBJECT ID="MsRdpClient" CLASSID="CLSID:7584c670-2274-4efb-b00b-d6aaba6d3850"></OBJECT>
			
	             <table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <div id="connectDisplay" style="display:none">
                        <td align="left" valign="top" style="padding-left:0px; padding-top:0px; font-size: 80%;">
                            <div id="connectingText">
                                <img src="images/ts_loading.gif" align="absmiddle"/>
                                <span id="remoteDesktopSession" style="padding-left:7px;"></span>
                                <br /><br />                            
                                <span id="connectingPleaseWait"></span>
                                <br /><br />
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td valign="top">
                                            <img src="images/info.png"/>
                                        </td>
                                        <td valign="top" style="font-size: 80%;">
                                            <div id="connectingText2" style="padding-left: 7px;" >
                                            <span id="ifCloseThisWindow"></span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>                                
                            </div>
                        </td>
                    </div>
                  </tr>
                </table>
       	  </div>
	    </div>
        
		
		<script type="text/vbscript" language="VBScript">
		<!--
		'sub ReturnToConnectPage()
		'	Top.Location.href = "selectpc.aspx"
		'end sub

		sub MsRdpClient_OnConnected()
			Document.All.connectDisplay.style.display = "block"
		end sub
		
		sub MsRdpClient_OnLeaveFullScreenMode()
			MsRdpClient.FullScreen = TRUE
		end sub

		sub MsRdpClient_OnIdleTimeoutNotification()
			'Dim bRet
			
			'bRet = window.showModalDialog("prompt.htm", "TS", "dialogHeight:250px; scroll:off; status:no; center:yes")
			'if bRet then
			'	top.location.href = "selectpc.aspx"
			'else		
				top.location.href = "logoff.aspx?timeout=1"
			'end if
		end sub

		sub MsRdpClient_OnDisconnected(disconnectCode)
			extendedDiscReason = MsRdpClient.ExtendedDisconnectReason
			majorDiscReason = disconnectCode And &hFF
			
			' disconnectCode = 50331677 if user clicked connect on activeX but cancelled on TSG username prompt
			' majorDiscReason = 1 if user clicked cancel on activex control.
			' majorDiscReason = 2 if user disconnected manually after making connection
			if (disconnectCode = &hB08 or majorDiscReason = 2 or majorDiscReason = 1 or disconnectCode = 50331677) and not (extendedDiscReason = 5) then
				'Switch back to login area
				'ReturnToConnectPage
				window.close
				exit sub
			end if
			
			errMsgText = DisconnectRemoteByServer_ErrorMessage
			if not extendedDiscReason = 0 then
				'Use the extended disconnect code
				select case extendedDiscReason
				case 0   errMsgText  = ""
				case 1   errMsgText  = DisconnectRemoteByServerTool_ErrorMessage
				case 2   errMsgText  = LogoffRemoteByServer_ErrorMessage
				case 3   errMsgText  = DisconnectIdleTimeout_ErrorMessage
				case 4   errMsgText  = DisconnectLogonTimeout_ErrorMessage
				case 5   errMsgText  = DisconnectByOtherConnection_ErrorMessage
				case 6   errMsgText  = ServerOutOfMemory_ErrorMessage
				case 7   errMsgText  = (ServerDeniedConnection_ErrorMessage & vbNewline & vbNewline & ServerDeniedConnection1_ErrorMessage & vbNewline & ServerDeniedConnection2_ErrorMessage & vbNewline & ServerDeniedConnection3_ErrorMessage & vbNewline & ServerDeniedConnection4_ErrorMessage)
				case 256 errMsgText  = LicenseInternal_ErrorMessage
				case 257 errMsgText  = NoLicenseServer_ErrorMessage
				case 258 errMsgText  = NoLicense_ErrorMessage
				case 259 errMsgText  = LicenseBadClientMsg_ErrorMessage
				case 260 errMsgText  = LicenseHwidDoesntMatch_ErrorMessage
				case 261 errMsgText  = BadClientLicense_ErrorMessage
				case 262 errMsgText  = LicenseCantFinishProtocol_ErrorMessage
				case 263 errMsgText  = LicenseClientEndedProtocol_ErrorMessage
				case 264 errMsgText  = LicenseBadClientEncryption_ErrorMessage
				case 265 errMsgText  = CantUpgradeLicense_ErrorMessage
				case 266 errMsgText  = LicenseNoRemoteConnections_ErrorMessage
				case else errMsgText = Replace(InternalErr_ErrorMessage, ReplaceString0, disconnectCode)
				end select
				if extendedDiscReason > 4096 then
					errMsgText = ProtocolErrWITHCODE_ErrorMessage  & errMsgText
				end if
			else
				' no extended error information, use the disconnect code
				select case disconnectCode
				case 0   errMsgText  = ErrMsg_Text
				case 1   errMsgText  = ErrMsg_Text
				case 2   errMsgText  = ErrMsg_Text
				case 260 errMsgText  = BadServerName_ErrorMessage
				case 262 errMsgText  = LowMemory_ErrorMessage
				case 264 errMsgText  = ConnectionTimeout_ErrorMessage
				case 516 errMsgText  = NotResponding_ErrorMessage
				case 518 errMsgText  = LowMemory_ErrorMessage
				case 520 errMsgText  = BadServerName_ErrorMessage
				case 772 errMsgText  = NetworkErr_ErrorMessage
				case 774 errMsgText  = LowMemory_ErrorMessage
				case 776 errMsgText  = BadServerName_ErrorMessage
				case 1028 errMsgText = NetworkErr_ErrorMessage
				case 1030 errMsgText = SecurityErr_ErrorMessage
				case 1032 errMsgText = IllegalServerName_ErrorMessage
				case 1286 errMsgText = EncryptionError_ErrorMessage
				case 1288 errMsgText = BadServerName_ErrorMessage
				case 1540 errMsgText = BadServerName_ErrorMessage
				case 1542 errMsgText = SecurityErr_ErrorMessage
				case 1544 errMsgText = LowMemory_ErrorMessage
				case 1796 errMsgText = NotResponding_ErrorMessage
				case 1798 errMsgText = SecurityErr_ErrorMessage
				case 1800 errMsgText = CannotLoopBackConnect_ErrorMessage
				case 2052 errMsgText = BadServerName_ErrorMessage
				case 2056 errMsgText = LicensingNegotFailed_ErrorMessage
				case 2310 errMsgText = SecurityErr_ErrorMessage
				case 2566 errMsgText = SecurityErr_ErrorMessage
				case 2822 errMsgText = EncryptionError_ErrorMessage
				case 3078 errMsgText = EncryptionError_ErrorMessage
				case 3080 errMsgText = DecompressionFailed_ErrorMessage
				case 3334 errMsgText = ProtocolErr_ErrorMessage
				case 10500 errMsgText = ProtocolErr_ErrorMessage
				case 50331650 errMsgText = InvalidCert_ErrorMessage
				case 50331651 errMsgText = InvalidCert_ErrorMessage
				case 50331652 errMsgText = InvalidCert_ErrorMessage
				case 50331653 errMsgText = InvalidCert_ErrorMessage
				case 50331654 errMsgText = InvalidCert_ErrorMessage
				case 50331661 errMsgText = TSGServiceStopped_ErrorMessage
				case 50331670 errMsgText = BadServerName_ErrorMessage
				case else errMsgText = Replace(InternalErr_ErrorMessage, ReplaceString0, disconnectCode)
				end select
			end if

			msgbox errMsgText,0,DisconnectedCaption_ErrorMessage
			window.close
			'ReturnToConnectPage
		end sub
		</script>
	
	</body>
</html>