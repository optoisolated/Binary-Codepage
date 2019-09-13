<%
  title="cool binary codepage sample"
	w=160
	h=40
	prompt="C:\DOS\>"
	command=right((Request.ServerVariables("PATH_INFO")),len((Request.ServerVariables("PATH_INFO")))-1)	'"dir/w/p"
	centr="thankyou for visiting"
	clientaddr=(Request.ServerVariables("REMOTE_ADDR"))
	face="Terminal"
	randomize timer
	do
		y=y+1
		x=0
		do
			x=x+1
			select case x & "," & y
			case int((w-len(title))/2) & "," & 3
				r=CoolText(title,"#00FF00")
			case 3 & "," & h-3
				r=CoolText(prompt,"#007700")
			case len(prompt)+3+2 & "," & h-3
				r=CoolText(command,"#007700")
			case w-len(clientaddr)-3 & "," & h-3
				r=CoolText(clientaddr,"#007700")
			case int((w-len(centr))/2) & "," & h/2
				r=CoolText(centr,"#99FF99")
			case else
				%><font face="<%=face%>" size="2" color="#00<%=int(rnd*3)+1%><%=int(rnd*10)%>00"><%=int(rnd*2)%></font><%
			end select
		loop until x=w
		%><br><%
	loop until y=h
		
	FUNCTION CoolText(sts,colr)
		If len(sts)>0 then
			x=x+len(sts)-1
			%><font face="<%=face%>" size="2" color="<%=colr%>"><%
			response.write(sts)
			%></font><%
		End If
	END FUNCTION	
%>
