<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>

<%
//Get all of the input parameters
String A_string = request.getParameter("A"); //triangle angles
String B_string = request.getParameter("B");
String C_string = request.getParameter("C");
String a_string = request.getParameter("a"); //triangle sides
String b_string = request.getParameter("b");
String c_string = request.getParameter("c");
String ad_string = request.getParameter("ad"); //triangle (but not chord) segments
String eb_string = request.getParameter("eb");
String af_string = request.getParameter("af");
String gc_string = request.getParameter("gc");
String r_string = request.getParameter("r");  //circle stuff
String central_string = request.getParameter("central");
String chord_string = request.getParameter("chord");
String arc_string = request.getParameter("arc");
String central_string3 = request.getParameter("central3");
String chord_string3 = request.getParameter("chord3");
String arc_string3 = request.getParameter("arc3");
String central_string2 = request.getParameter("central2");
String arc_string2 = request.getParameter("arc2");
String central_string4 = request.getParameter("central4");
String arc_string4 = request.getParameter("arc4");
String triangle_string = request.getParameter("triangleArea");
String EBCGArea_string = request.getParameter("EBCGArea");
String circle_string = request.getParameter("circleArea");
String FGArea_string = request.getParameter("FGArea");
String DEArea_string = request.getParameter("DEArea");
String DEGFArea_string = request.getParameter("DEGFArea");
String perimeter_string = request.getParameter("perimeter");
String circumference_string = request.getParameter("circumference");
String ADFArea_string = request.getParameter("ADFArea");

//declare doubles
double A = 0, B = 0, C = 0, a = 0, b = 0, c = 0, eb=0, gc=0, r = 0, triangleArea = 0, circleArea = 0, FGArea = 0, DEArea = 0, EBCGArea = 0, DEGFArea = 0;
double central = 0, chord = 0, arc = 0, central2 = 0, arc2 = 0, central3 = 0, chord3 = 0, arc3 = 0, central4=0, arc4=0, perimeter=0, circumference=0;
double ADFArea = 0, ad = 0, af = 0;

//See if inputs where empty.  If they weren't conver them
if(!A_string.isEmpty()) {A = Math.toRadians(Double.parseDouble(A_string));}
if(!B_string.isEmpty()) {B = Math.toRadians(Double.parseDouble(B_string));}
if(!C_string.isEmpty()) {C = Math.toRadians(Double.parseDouble(C_string));}
if(!a_string.isEmpty()) {a = Double.parseDouble(a_string);}
if(!b_string.isEmpty()) {b = Double.parseDouble(b_string);}
if(!c_string.isEmpty()) {c = Double.parseDouble(c_string);}
if(!ad_string.isEmpty()){ad = Double.parseDouble(ad_string);}
if(!eb_string.isEmpty()){eb = Double.parseDouble(eb_string);}
if(!af_string.isEmpty()){af = Double.parseDouble(af_string);}
if(!gc_string.isEmpty()){gc = Double.parseDouble(gc_string);}
if(!r_string.isEmpty()) {r = Double.parseDouble(r_string);}
if(!central_string.isEmpty()) {central = Math.toRadians(Double.parseDouble(central_string));}
if(!chord_string.isEmpty())   {chord = Double.parseDouble(chord_string);}
if(!arc_string.isEmpty())   {arc = Double.parseDouble(arc_string);}
if(!central_string3.isEmpty()) {central3 = Math.toRadians(Double.parseDouble(central_string3));}
if(!chord_string3.isEmpty())   {chord3 = Double.parseDouble(chord_string3);}
if(!arc_string3.isEmpty())   {arc3 = Double.parseDouble(arc_string3);}
if(!central_string2.isEmpty()) {central2 = Math.toRadians(Double.parseDouble(central_string2));}
if(!arc_string2.isEmpty())   {arc2 = Double.parseDouble(arc_string2);}
if(!central_string4.isEmpty()) {central4 = Math.toRadians(Double.parseDouble(central_string4));}
if(!arc_string4.isEmpty())   {arc4 = Double.parseDouble(arc_string4);}
if(!triangle_string.isEmpty()) {triangleArea = Double.parseDouble(triangle_string);}
if(!EBCGArea_string.isEmpty()) {EBCGArea     = Double.parseDouble(EBCGArea_string);}
if(!circle_string.isEmpty())   {circleArea   = Double.parseDouble(circle_string);}
if(!FGArea_string.isEmpty())   {FGArea       = Double.parseDouble(FGArea_string);}
if(!DEArea_string.isEmpty())   {DEArea       = Double.parseDouble(DEArea_string);}
if(!DEGFArea_string.isEmpty())  {DEGFArea      = Double.parseDouble(DEGFArea_string);}
if(!perimeter_string.isEmpty())    {perimeter     = Double.parseDouble(perimeter_string);}
if(!circumference_string.isEmpty()){circumference = Double.parseDouble(circumference_string);}
if(!ADFArea_string.isEmpty()){ADFArea = Double.parseDouble(ADFArea_string);}


while(true){
//Side angle side algorithm to solve for a particular side
  if(((A!=0) && (b!=0) && (c!=0) && (a==0)) || ((a!=0) && (B!=0) && (c!=0) && (b==0)) || ((a!=0) && (b!=0) && (C!=0) && (c==0)))
  {
    if(a == 0){
      //a = SAS_Solve_Side(b, A, c);
      a = Math.sqrt(Math.pow(b, 2) + Math.pow(c, 2) - 2 * b * c * Math.cos(A));
      triangleArea = 0.5 * b * c * Math.sin(A);
    }
    else if(b == 0){
      //b = SAS_Solve_Side(a, B, c);
      b = Math.sqrt(Math.pow(a, 2) + Math.pow(c, 2) - 2 * a * c * Math.cos(B));
      triangleArea = 0.5 * a * c * Math.sin(B);
    }
    else if(c == 0){
      //c = SAS_Solve_Side(a, C, b);
      c = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2) - 2 * a * b * Math.cos(C));
      triangleArea = 0.5 * a * b * Math.sin(C);
    }
  }
  //If two angles are provided
  else if(((A!=0) && (B!=0) && (C==0)) || ((A!=0) && (B==0) && (C!=0)) || ((A==0) && (B!=0) && (C!=0))){
    if(A == 0){
      A = Math.toRadians(180) - B - C;
    }
    else if(B == 0){
      B = Math.toRadians(180) - A - C;
    }
    else if(C == 0){
      C = Math.toRadians(180) - A - B;
    }
  }
  //sine law check
  else if(((A!=0)&&(a!=0) || (B!=0)&&(b!=0) || (C!=0)&&(c!=0)) && (((a==0)||(A==0)) || ((b==0)||(B==0)) || ((c==0)||(C==0)))){
    if((A==0)&&(a!=0)){
      if((B!=0)&&(b!=0)) {A = Math.asin(a * Math.sin(B) / b);}
      else               {A = Math.asin(a * Math.sin(C) / c);}
    }
    else if((B==0)&&(b!=0)){
      if((A!=0)&&(a!=0)) {B = Math.asin(b * Math.sin(A) / a);}
      else               {B = Math.asin(b * Math.sin(C) / c);}
    }
    else if((C==0)&&(c!=0)){
      if((A!=0)&&(a!=0)) {C = Math.asin(c * Math.sin(A) / a);}
      else               {C = Math.asin(c * Math.sin(B) / b);}
    }
    else if((A!=0)&&(a==0)){
      if((B!=0)&&(b!=0)) {a = Math.sin(A) * b / Math.sin(B);}
      else               {a = Math.sin(A) * c / Math.sin(C);}
    }
    else if((B!=0)&&(b==0)){
      if((A!=0)&&(a!=0)) {b = Math.sin(B) * a / Math.sin(A);}
      else               {b = Math.sin(B) * c / Math.sin(C);}
    }
    else{
      if((B!=0)&&(b!=0)) {c = Math.sin(C) * b / Math.sin(B);}
      else               {c = Math.sin(C) * a / Math.sin(A);}
    }
  }
  //Three side and no angle check
  else if((a!=0)&&(b!=0)&&(c!=0)&&(A==0)&&(B==0)&&(C==0)){
    A = Math.acos((Math.pow(b,2)+Math.pow(c,2)-Math.pow(a,2))/(2*b*c));
  }
  //Segment check
  else if((ad!=0)&&(c!=0)&&(eb!=0)&&(chord==0) || (ad!=0)&&(c!=0)&&(eb==0)&&(chord!=0) ||
          (ad!=0)&&(c==0)&&(eb!=0)&&(chord!=0) || (ad==0)&&(c!=0)&&(eb!=0)&&(chord!=0)){
    if(chord==0){
      chord = c - eb - ad;
    }
    else if(eb==0){
      eb = c - chord - ad;
    }
    else if(c==0){
      c = eb + chord + ad;
    }
    else{
      ad = c - chord - eb;
    }
  }
  //Other segment Check
  else if((af!=0)&&(b!=0)&&(gc!=0)&&(chord3==0) || (af!=0)&&(b!=0)&&(gc==0)&&(chord3!=0) ||
          (af!=0)&&(b==0)&&(gc!=0)&&(chord3!=0) || (af==0)&&(b!=0)&&(gc!=0)&&(chord3!=0)){
    if(chord3==0){
      chord3 = b - gc - af;
    }
    else if(gc==0){
      gc = b - chord3 - af;
    }
    else if(b==0){
      b = gc + chord3 + af;
    }
    else{
      af = b - chord3 - gc;
    }
  }
  //This portion of the code starts to deal with the circle
  //if almost all of the angles are known
  else if((central==0)&&(central3!=0)&&(central2!=0)&&(central4!=0) || (central!=0)&&(central3==0)&&(central2!=0)&&(central4!=0) ||
          (central!=0)&&(central3!=0)&&(central2==0)&&(central4!=0) || (central!=0)&&(central3!=0)&&(central2!=0)&&(central4==0)){
    if(central==0){
      central = 2*Math.PI - central3 - central2 - central4;
    }
    else if(central3==0){
      central3 = 2*Math.PI - central - central2 - central4;
    }
    else if(central2==0){
      central2 = 2*Math.PI - central - central3 - central4;
    }
    else{
      central4 = 2*Math.PI - central - central2 - central3;
    }
  }
    //portion of the circle with angle 1
  else if((chord==0)&&(r!=0)&&(central!=0) || (r==0)&&(chord!=0)&&(central!=0) || (central==0)&&(chord!=0)&&(r!=0)){
    if(chord ==0){
    //(chord)if only chord is unknown
    chord = 2 * r * Math.sin(central/2);
    }
    else if(r==0){
    //(chord)if only r is unknown
    r = chord / (2 * Math.sin(central/2));
    }
    else{
    //(chord)if only central is unknown
    central = 2 * Math.asin(chord / (2 * r));
    }
  }                              //arc length
  else if((arc==0)&&(central!=0)&&(r!=0) || (arc!=0)&&(central==0)&&(r!=0) || (arc!=0)&&(central!=0)&&(r==0)){
    //(arc)if only arc is unknown
    if(arc == 0){
    arc = r * central;
    }
    else if(central==0){
    //(arc)if only central is unknown
    central = arc / r;
    }
    else{
    //(arc)if only r is unknown
    r = arc / central;
    }
  }
  else if((arc!=0)&&(chord!=0)&&(r==0) || (arc!=0)&&(DEArea!=0)&&(r==0) || (DEArea!=0)&&(chord!=0)&&(central==0)){
    //see if you can use the arc length and chord to find the radius
    if((arc!=0)&&(chord!=0)){
      double dif = 100;
      r = 1;
      while(dif>=0.001){
        dif = Math.abs(chord - 2*r*Math.sin(arc/(2*r)));
        r += 0.001;
      }
      r -= 0.001;
    }
    else if((arc!=0)&&(DEArea!=0)){
      double dif = 100;
      r = 1;
      while(dif>=0.001){
        dif = Math.abs(DEArea - Math.pow(r,2)/2 * (arc/r - Math.sin(arc/r)));
        r += 0.001;
      }
      r-= 0.001;
    }
    else{
      double dif = 100;
      central = 0.001;
      while((dif>=0.001) && (central <= 2*Math.PI)){
        double test = chord/(2*Math.sin(central/2));
        dif = Math.abs(DEArea - Math.pow(test,2)/2 * (central - Math.sin(central)));
        central += 0.001;
      }
      central-=0.001;
    }
  }
  //same shit but for the 2nd chord and arc
  else if((arc3!=0)&&(chord3!=0)&&(r==0) || (arc3!=0)&&(FGArea!=0)&&(r==0) || (FGArea!=0)&&(chord3!=0)&&(central3==0)){
    //see if you can use the arc length and chord to find the central
    if((arc3!=0)&&(chord3!=0)){
      double dif = 100;
      r = 1;
      while(dif>=0.001){
        dif = Math.abs(chord3 - 2*r*Math.sin(arc3/(2*r)));
        r += 0.001;
      }
      r -= 0.001;
    }
    else if((arc3!=0)&&(FGArea!=0)){
      double dif = 100;
      r = 1;
      while(dif>=0.001){
        dif = Math.abs(FGArea - Math.pow(r,2)/2 * (arc3/r - Math.sin(arc3/r)));
        r += 0.001;
      }
      r-= 0.001;
    }
    else{
      double dif = 100;
      central3 = 0.001;
      while((dif>=0.001) && (central3 <= 2*Math.PI)){
        double test = chord3/(2*Math.sin(central3/2));
        dif = Math.abs(FGArea - Math.pow(test,2)/2 * (central3 - Math.sin(central3)));
        central3 += 0.001;
      }
      central3-=0.001;
    }
  }
  //This section focuses on the second portion of the circle with an actual chord
  else if((chord3==0)&&(r!=0)&&(central3!=0)  || (r==0)&&(chord3!=0)&&(central3!=0) || (central3==0)&&(chord3!=0)&&(r!=0)){
    if(chord3 == 0){
    chord3 = 2 * r * Math.sin(central3/2);
    }
    else if(r==0){
    r = chord3 / (2 * Math.sin(central3/2));
    }
    else{
    central3 = 2 * Math.asin(chord3 / (2 * r));
    }
  }
  else if((arc3==0)&&(central3!=0)&&(r!=0)  ||  (arc3!=0)&&(central3==0)&&(r!=0)  || (arc3!=0)&&(central3!=0)&&(r==0)){
    if(arc3==0){
    arc3 = r * central3;
    }
    else if(central3==0){
    central3 = arc3 / r;
    }
    else{
    r = arc3 / central3;
    }
  }
  //This portion focuses on the part of the circle with angle 2
  else if((arc2==0)&&(central2!=0)&&(r!=0)  ||  (arc2!=0)&&(central2==0)&&(r!=0)  || (arc2!=0)&&(central2!=0)&&(r==0)){
    if(arc2==0){
    arc2 = r * central2;
    }
    else if(central2==0){
    central2 = arc2 / r;
    }
    else{
    r = arc2 / central2;
    }
  }
  //This portion focuses on the part of the circle with angle 4
  else if((arc4==0)&&(central4!=0)&&(r!=0)  ||  (arc4!=0)&&(central4==0)&&(r!=0)  || (arc4!=0)&&(central4!=0)&&(r==0)){
    if(arc4==0){
    arc4 = r * central4;
    }
    else if(central4==0){
    central4 = arc4 / r;
    }
    else{
    r = arc4 / central4;
    }
  }
  //Area and perimeter related calculations
  //Triangle perimeter and sides
  else if((a!=0)&&(b!=0)&&(c!=0)&&(perimeter==0) || (a!=0)&&(b!=0)&&(c==0)&&(perimeter!=0) ||
          (a!=0)&&(b==0)&&(c!=0)&&(perimeter!=0) || (a==0)&&(b!=0)&&(c!=0)&&(perimeter!=0)){

            if(perimeter==0){
              perimeter = a+b+c;
            }
            else if(a==0){
              a = perimeter-b-c;
            }
            else if(b==0){
              b = perimeter-a-c;
            }
            else{
              c = perimeter-a-b;
            }
  }
  //triangle area and sides
  else if((a!=0)&&(b!=0)&&(c!=0)&&(triangleArea==0) || (a!=0)&&(b!=0)&&(c==0)&&(triangleArea!=0) ||
          (a!=0)&&(b==0)&&(c!=0)&&(triangleArea!=0) || (a==0)&&(b!=0)&&(c!=0)&&(triangleArea!=0)){

      if(triangleArea==0){
        double s = (a+b+c)/2;
        triangleArea = Math.sqrt(s * (s-a) * (s-b) * (s-c));
      }
      else if(a==0){
        //find possible values of a
        double a1 = Math.sqrt(b*b + c*c + 2 * Math.sqrt(b*b*c*c - 4 * triangleArea*triangleArea));
        double a2 = Math.sqrt(b*b + c*c - 2 * Math.sqrt(b*b*c*c - 4 * triangleArea*triangleArea));
        //test one of the possible values.  If it results in the given area, that is a's new value
        double s1=0, testArea1=0, s2=0, testArea2=0;
        s1 = (a1+b+c)/2;
        testArea1 = Math.sqrt(s1 * (s1-a1) * (s1-b) * (s1-c));
        s2 = (a2+b+c)/2;
        testArea2 = Math.sqrt(s2 * (s2-a2) * (s2-b) * (s2-c));

        if(Math.abs(testArea1-triangleArea) < Math.abs(testArea2-triangleArea)){
          a = a1;
        }
        else{
          a = a2;
        }
      }
      else if(b==0){
        //find possible values of b
        double b1 = Math.sqrt(a*a + c*c + 2 * Math.sqrt(a*a*c*c - 4 * triangleArea*triangleArea));
        double b2 = Math.sqrt(a*a + c*c - 2 * Math.sqrt(a*a*c*c - 4 * triangleArea*triangleArea));
        //test one of the possible values.  If it results in the given area, that is b's new value
        double s1=0, testArea1=0, s2=0, testArea2=0;
        s1 = (a+b1+c)/2;
        testArea1 = Math.sqrt(s1 * (s1-a) * (s1-b1) * (s1-c));
        s2 = (a+b2+c)/2;
        testArea2 = Math.sqrt(s2 * (s2-a) * (s2-b2) * (s2-c));

        if(Math.abs(testArea1-triangleArea) < Math.abs(testArea2-triangleArea)){
          b = b1;
        }
        else{
          b = b2;
        }
      }
      else{
        //find possible values of b
        double c1 = Math.sqrt(a*a + b*b + 2 * Math.sqrt(a*a*b*b - 4 * triangleArea*triangleArea));
        double c2 = Math.sqrt(a*a + b*b - 2 * Math.sqrt(a*a*b*b - 4 * triangleArea*triangleArea));
        //test one of the possible values.  If it results in the given area, that is b's new value
        double s1=0, testArea1=0, s2=0, testArea2=0;
        s1 = (a+b+c1)/2;
        testArea1 = Math.sqrt(s1 * (s1-a) * (s1-b) * (s1-c1));
        s2 = (a+b+c2)/2;
        testArea2 = Math.sqrt(s2 * (s2-a) * (s2-b) * (s2-c2));

        if(Math.abs(testArea1-triangleArea) < Math.abs(testArea2-triangleArea)){
          c = c1;
        }
        else{
          c = c2;
        }
      }
  }
  //Check to see if you can find the circe area
  else if((r!=0)&&(circleArea==0) || (r==0)&&(circleArea!=0)){
    if(circleArea==0){
      circleArea = Math.PI * Math.pow(r,2);
    }
    else{
      r = Math.sqrt(circleArea/Math.PI);
    }
  }
  //check for circumference calculations
  else if((r!=0)&&(circumference==0) || (r==0)&&(circumference!=0)){
    if(circumference==0){
      circumference = 2 * Math.PI * r;
    }
    else{
      r = circumference/(2*Math.PI);
    }
  }
  //Special circle Area case 1: wombo combo
  else if((FGArea!=0)&&(DEArea!=0)&&(circleArea!=0)&&(DEGFArea==0) || (FGArea!=0)&&(DEArea!=0)&&(circleArea==0)&&(DEGFArea!=0) ||
          (FGArea!=0)&&(DEArea==0)&&(circleArea!=0)&&(DEGFArea!=0) || (FGArea==0)&&(DEArea!=0)&&(circleArea!=0)&&(DEGFArea!=0)){

       if(DEGFArea==0){
         DEGFArea = circleArea-FGArea-DEArea;
       }
       else if(circleArea==0){
         circleArea = DEGFArea + FGArea + DEArea;
       }
       else if(DEArea==0){
         DEArea = circleArea-DEGFArea-FGArea;
       }
       else{
         FGArea = circleArea-DEGFArea-DEArea;
       }
     }
  //Special circle Area case 2: finding segments from the areas
  else if((r!=0)&&(central!=0)&&(DEArea==0) || (r!=0)&&(central==0)&&(DEArea!=0) || (r==0)&&(central!=0)&&(DEArea!=0)){

    if(DEArea==0){
      DEArea = (central - Math.sin(central))/2 * Math.pow(r,2);
    }
    else if(central==0){
      double dif = 100;
      central = Math.PI/180;
      while((dif >= 0.001) && (central <= Math.PI)){
        dif = Math.abs(DEArea*2/Math.pow(r,2) - central + Math.sin(central));
        central += 0.01;
      }
      central -= 0.01;
    }
    else{
      r = Math.sqrt( (DEArea*2)/(central - Math.sin(central)) );
    }
  }
  //special circle area case 2 continued: other circle segment
  else if((r!=0)&&(central3!=0)&&(FGArea==0) || (r!=0)&&(central3==0)&&(FGArea!=0) || (r==0)&&(central3!=0)&&(FGArea!=0)){

    if(FGArea == 0){
      FGArea = (central3 - Math.sin(central3))/2 * Math.pow(r,2);
    }
    else if(central3==0){
      double dif = 100;
      central3 = Math.PI/180;
      while((dif >= 0.001) && (central3 <= Math.PI)){
        dif = Math.abs(FGArea*2/Math.pow(r,2) - central3 + Math.sin(central3));
        central3 += 0.01;
      }
      central3 -= 0.01;
    }
    else{
      r = Math.sqrt( (FGArea*2)/(central3 - Math.sin(central3)) );
    }
  }
  //Special triangle area case 2
  else if((triangleArea!=0)&&(DEGFArea!=0)&&(ADFArea!=0)&&(EBCGArea==0) || (triangleArea!=0)&&(DEGFArea==0)&&(ADFArea!=0)&&(EBCGArea!=0) ||
          (triangleArea==0)&&(DEGFArea!=0)&&(ADFArea!=0)&&(EBCGArea!=0) || (triangleArea!=0)&&(DEGFArea!=0)&&(ADFArea==0)&&(EBCGArea!=0)){
    if(EBCGArea==0){
      EBCGArea = triangleArea-DEGFArea-ADFArea;
    }
    else if(DEGFArea==0){
      DEGFArea = triangleArea-EBCGArea-ADFArea;
    }
    else if(triangleArea==0){
      triangleArea = DEGFArea + EBCGArea + ADFArea;
    }
    else{
      ADFArea = triangleArea-DEGFArea-EBCGArea;
    }
  }
  //the teeny tiny area
  else if((ADFArea==0)&&(r!=0)&&(central2!=0)&&(ad!=0)&&(af!=0)&&(A!=0) || (ADFArea!=0)&&(r==0)&&(central2!=0)&&(ad!=0)&&(af!=0)&&(A!=0)
    ||    (ADFArea!=0)&&(r!=0)&&(central2==0)&&(ad!=0)&&(af!=0)&&(A!=0) || (ADFArea!=0)&&(r!=0)&&(central2!=0)&&(ad==0)&&(af!=0)&&(A!=0)
    ||    (ADFArea!=0)&&(r!=0)&&(central2!=0)&&(ad!=0)&&(af==0)&&(A!=0) || (ADFArea!=0)&&(r!=0)&&(central2!=0)&&(ad!=0)&&(af!=0)&&(A==0)){
    if(ADFArea==0){
      ADFArea = 0.5*(ad*af*Math.sin(A)) - 0.5*Math.pow(r,2)*(central2 - Math.sin(central2));
    }
    else if(ad==0){
      ad = (2/(af*Math.sin(A))) * (ADFArea + 0.5*Math.pow(r,2)*(central2 - Math.sin(central2)));
    }
    else if(af==0){
      af = (2/(ad*Math.sin(A))) * (ADFArea + 0.5*Math.pow(r,2)*(central2 - Math.sin(central2)));
    }
    else if(r==0){
      r = Math.sqrt(2 * (0.5*ad*af*Math.sin(A) - ADFArea) / (central2 - Math.sin(central2)));
    }
    else if(A==0){
      A = Math.asin((2*ADFArea + Math.pow(r,2)*(central2 - Math.sin(central2))) / (ad * af));
    }
    else{
      double dif = 100;
      central2 = Math.PI;
      while((dif>=0.001) && (central2>=0)){
        dif = ADFArea - 0.5*(ad*af*Math.sin(A)) + 0.5*Math.pow(r,2)*(central2 - Math.sin(central2));
        central2 -= 0.001;
      }
      central2+=0.001;
    }
  }
  //arc lengths and circumference
  else if((arc!=0)&&(arc2!=0)&&(arc3!=0)&&(arc4!=0)&&(circumference==0) || (arc!=0)&&(arc2!=0)&&(arc3!=0)&&(arc4==0)&&(circumference!=0)
    ||    (arc!=0)&&(arc2!=0)&&(arc3==0)&&(arc4!=0)&&(circumference!=0) || (arc!=0)&&(arc2==0)&&(arc3!=0)&&(arc4!=0)&&(circumference!=0)
    ||    (arc==0)&&(arc2!=0)&&(arc3!=0)&&(arc4!=0)&&(circumference!=0)){
      if(circumference==0){
        circumference = arc+arc2+arc3+arc4;
      }
      else if(arc==0){
        arc = circumference-arc2-arc3-arc4;
      }
      else if(arc2==0){
        arc2 = circumference-arc-arc3-arc4;
      }
      else if(arc3==0){
        arc3 = circumference-arc-arc2-arc4;
      }
      else{
        arc4 = circumference-arc-arc2-arc3;
      }
    }
  else{
    break;
  }
}



//Side angle side algorithm for solving aparticular side
/*public static double SAS_Solve_Side(double side1, double angle, double side2){
  double result = Math.pow(side1, 2) + Math.pow(side2, 2) - 2 * side1 * side2 * Math.cos(angle);
  result = Math.sqrt(result);
  return result;
}*/

out.println("<img src = 'Refined 2.jpg' width = '500' height = '466'> + <br>");

out.println("Angle A(Radians): " + A + "<br>");
out.println("Angle B(Radians): " + B + "<br>");
out.println("Angle C(Radians): " + C + "<br>");
out.println("Side a: " + a + "<br>");
out.println("Side b: " + b + "<br>");
out.println("Side c: " + c + "<br>");
out.println("Segment ad: " + ad + "<br>");
out.println("Segment eb: " + eb + "<br>");
out.println("Segment af: " + af + "<br>");
out.println("Segment gc: " + gc + "<br>");
out.println("Radius: " + r + "<br>");
out.println("Central Angle(radians): " + central + "<br>");
out.println("Chord Length(DE): " + chord + "<br>");
out.println("Arc 1(DE): " + arc + "<br>");
out.println("Central Angle 3(radians): " + central3 + "<br>");
out.println("Chord Length 3(FG): " + chord3 + "<br>");
out.println("Arc 3(FG): " + arc3 + "<br>");
out.println("Central Angle 2: " + central2 + "<br>");
out.println("Arc 2(DF): " + arc2 + "<br>");
out.println("Central Angle 4: " + central4 + "<br>");
out.println("Arc 4(EG): " + arc4 + "<br>");
out.println("Triangle Area(EBCG): " + EBCGArea + "<br>");
out.println("Triangle Area(ADF): "  + ADFArea  + "<br>");
out.println("Triangle Area: " + triangleArea + "<br>");
out.println("Circle Area(DE): " + DEArea + "<br>");
out.println("Circle Area(FG): " + FGArea + "<br>");
out.println("Circle Area(DEGF): " + DEGFArea + "<br>");
out.println("Circle Area: " + circleArea + "<br>");
out.println("Triangle perimeter: " + perimeter + "<br>");
out.println("circumference: " + circumference + "<br>");


%>
