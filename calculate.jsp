<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>

<%
//Get all of the input parameters
String A_string = request.getParameter("A");
String B_string = request.getParameter("B");
String C_string = request.getParameter("C");
String a_string = request.getParameter("a");
String b_string = request.getParameter("b");
String c_string = request.getParameter("c");
String db_string = request.getParameter("db");
String ec_string = request.getParameter("ec");
String r_string = request.getParameter("r");
String central_string = request.getParameter("central");
String chord_string = request.getParameter("chord");
String arc_string = request.getParameter("arc");
String central_string2 = request.getParameter("central2");
String chord_string2 = request.getParameter("chord2");
String arc_string2 = request.getParameter("arc2");
String central_string3 = request.getParameter("central3");
String arc_string3 = request.getParameter("arc3");
String triangle_string = request.getParameter("triangleArea");
String cursed_string = request.getParameter("cursed");
String circle_string = request.getParameter("circleArea");
String AEArea_string = request.getParameter("AEArea");
String ADArea_string = request.getParameter("ADArea");
String ADEArea_string = request.getParameter("ADEArea");
String perimeter_string = request.getParameter("perimeter");
String circumference_string = request.getParameter("circumference");

//declare doubles
double A = 0, B = 0, C = 0, a = 0, b = 0, c = 0, db=0, ec=0, r = 0, triangleArea = 0, circleArea = 0, AEArea = 0, ADArea = 0, DBCEArea = 0, ADEArea = 0;
double central = 0, chord = 0, arc = 0, central2 = 0, chord2 = 0, arc2 = 0, central3 = 0, arc3 = 0, perimeter=0, circumference=0;

//See if inputs where empty.  If they weren't conver them
if(!A_string.isEmpty()) {A = Math.toRadians(Double.parseDouble(A_string));}
if(!B_string.isEmpty()) {B = Math.toRadians(Double.parseDouble(B_string));}
if(!C_string.isEmpty()) {C = Math.toRadians(Double.parseDouble(C_string));}
if(!a_string.isEmpty()) {a = Double.parseDouble(a_string);}
if(!b_string.isEmpty()) {b = Double.parseDouble(b_string);}
if(!c_string.isEmpty()) {c = Double.parseDouble(c_string);}
if(!db_string.isEmpty()){db = Double.parseDouble(db_string);}
if(!ec_string.isEmpty()){ec = Double.parseDouble(ec_string);}
if(!r_string.isEmpty()) {r = Double.parseDouble(r_string);}
if(!central_string.isEmpty()) {central = Math.toRadians(Double.parseDouble(central_string));}
if(!chord_string.isEmpty())   {chord = Double.parseDouble(chord_string);}
if(!arc_string.isEmpty())   {arc = Double.parseDouble(arc_string);}
if(!central_string2.isEmpty()) {central2 = Math.toRadians(Double.parseDouble(central_string2));}
if(!chord_string2.isEmpty())   {chord2 = Double.parseDouble(chord_string2);}
if(!arc_string2.isEmpty())   {arc2 = Double.parseDouble(arc_string2);}
if(!central_string3.isEmpty()) {central3 = Math.toRadians(Double.parseDouble(central_string3));}
if(!arc_string3.isEmpty())   {arc3 = Double.parseDouble(arc_string3);}
if(!triangle_string.isEmpty()) {triangleArea = Double.parseDouble(triangle_string);}
if(!cursed_string.isEmpty()) {DBCEArea     = Double.parseDouble(cursed_string);}
if(!circle_string.isEmpty())   {circleArea   = Double.parseDouble(circle_string);}
if(!AEArea_string.isEmpty())   {AEArea       = Double.parseDouble(AEArea_string);}
if(!ADArea_string.isEmpty())   {ADArea       = Double.parseDouble(ADArea_string);}
if(!ADEArea_string.isEmpty())  {ADEArea      = Double.parseDouble(ADEArea_string);}
if(!perimeter_string.isEmpty())    {perimeter     = Double.parseDouble(perimeter_string);}
if(!circumference_string.isEmpty()){circumference = Double.parseDouble(circumference_string);}


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
  else if((c!=0)&&(db!=0)&&(chord==0) || (c!=0)&&(db==0)&&(chord!=0) || (c==0)&&(db!=0)&&(chord!=0)){
    if(chord==0){
      chord = c - db;
    }
    else if(db==0){
      db = c - chord;
    }
    else{
      c = db + chord;
    }
  }
  //Other segment Check
  else if((b!=0)&&(ec!=0)&&(chord2==0) || (b!=0)&&(ec==0)&&(chord2!=0) || (b==0)&&(ec!=0)&&(chord2!=0)){
    if(chord2==0){
      chord2 = b - ec;
    }
    else if(ec==0){
      ec = b - chord2;
    }
    else{
      b = ec + chord2;
    }
  }
  //This portion of the code starts to deal with the circle
  //if almost all of the angles are known
  else if((central==0)&&(central2!=0)&&(central3!=0) || (central!=0)&&(central2==0)&&(central3!=0) || (central!=0)&&(central2!=0)&&(central3==0)){
    if(central==0){
      central = 2*Math.PI - central2 - central3;
    }
    else if(central2==0){
      central2 = 2*Math.PI - central - central3;
    }
    else{
      central3 = 2*Math.PI - central - central2;
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
  else if((arc!=0)&&(chord!=0)&&(r==0) || (arc!=0)&&(ADArea!=0)&&(r==0) || (ADArea!=0)&&(chord!=0)&&(central==0)){
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
      else if((arc!=0)&&(ADArea!=0)){
        double dif = 100;
        r = 1;
        while(dif>=0.001){
          dif = Math.abs(ADArea - Math.pow(r,2)/2 * (arc/r - Math.sin(arc/r)));
          r += 0.001;
        }
        r-= 0.001;
      }
      else{
        double dif = 100;
        central = 0.001;
        while((dif>=0.001) && (central <= 2*Math.PI)){
          double test = chord/(2*Math.sin(central/2));
          dif = Math.abs(ADArea - Math.pow(test,2)/2 * (central - Math.sin(central)));
          central += 0.001;
        }
        central-=0.001;
      }
  }
  //same shit but for the 2nd chord and arc
  else if((arc2!=0)&&(chord2!=0)&&(r==0) || (arc2!=0)&&(AEArea!=0)&&(r==0) || (AEArea!=0)&&(chord2!=0)&&(central2==0)){
    //see if you can use the arc length and chord to find the central
      if((arc2!=0)&&(chord2!=0)){
        double dif = 100;
        r = 1;
        while(dif>=0.001){
          dif = Math.abs(chord2 - 2*r*Math.sin(arc2/(2*r)));
          r += 0.001;
        }
        r -= 0.001;
      }
      else if((arc2!=0)&&(AEArea!=0)){
        double dif = 100;
        r = 1;
        while(dif>=0.001){
          dif = Math.abs(AEArea - Math.pow(r,2)/2 * (arc2/r - Math.sin(arc2/r)));
          r += 0.001;
        }
        r-= 0.001;
      }
      else{
        double dif = 100;
        central2 = 0.001;
        while((dif>=0.001) && (central2 <= 2*Math.PI)){
          double test = chord2/(2*Math.sin(central2/2));
          dif = Math.abs(AEArea - Math.pow(test,2)/2 * (central2 - Math.sin(central2)));
          central2 += 0.001;
        }
        central2-=0.001;
      }
  }
  //This section focuses on the second portion of the circle
  else if((chord2==0)&&(r!=0)&&(central2!=0)  || (r==0)&&(chord2!=0)&&(central2!=0) || (central2==0)&&(chord2!=0)&&(r!=0)){
    if(chord2 == 0){
    chord2 = 2 * r * Math.sin(central2/2);
    }
    else if(r==0){
    r = chord2 / (2 * Math.sin(central2/2));
    }
    else{
    central2 = 2 * Math.asin(chord2 / (2 * r));
    }
  }
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
  //This portion focuses on the part of the circle with angle 3
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
  else if((circumference==0)&&(arc!=0)&&(arc2!=0)&&(arc3!=0) || (circumference!=0)&&(arc==0)&&(arc2!=0)&&(arc3!=0)
          || (circumference!=0)&&(arc!=0)&&(arc2==0)&&(arc3!=0) || (circumference!=0)&&(arc!=0)&&(arc2!=0)&&(arc3==0)){
    //arc length and circumference relations
    if(circumference==0){
      circumference = arc + arc2 + arc3;
    }
    else if(arc==0){
      arc = circumference-arc2-arc3;
    }
    else if(arc2==0){
      arc2 = circumference-arc-arc3;
    }
    else{
      arc3 = circumference-arc-arc2;
    }
  }
  //Special circle Area case 1: wombo combo
  else if((AEArea!=0)&&(ADArea!=0)&&(circleArea!=0)&&(ADEArea==0) || (AEArea!=0)&&(ADArea!=0)&&(circleArea==0)&&(ADEArea!=0) ||
          (AEArea!=0)&&(ADArea==0)&&(circleArea!=0)&&(ADEArea!=0) || (AEArea==0)&&(ADArea!=0)&&(circleArea!=0)&&(ADEArea!=0)){

       if(ADEArea==0){
         ADEArea = circleArea-AEArea-ADArea;
       }
       else if(circleArea==0){
         circleArea = ADEArea + AEArea + ADArea;
       }
       else if(ADArea==0){
         ADArea = circleArea-ADEArea-AEArea;
       }
       else{
         AEArea = circleArea-ADEArea-ADArea;
       }
     }
  //Special circle Area case 2: finding segments from the areas
  else if((r!=0)&&(central!=0)&&(ADArea==0) || (r!=0)&&(central==0)&&(ADArea!=0) || (r==0)&&(central!=0)&&(ADArea!=0)){

    if(ADArea==0){
      ADArea = (central - Math.sin(central))/2 * Math.pow(r,2);
    }
    else if(central==0){
      double dif = 100;
      central = Math.PI/180;
      while((dif >= 0.001) && (central <= Math.PI)){
        dif = Math.abs(ADArea*2/Math.pow(r,2) - central + Math.sin(central));
        central += 0.01;
      }
      central -= 0.01;
    }
    else{
      r = Math.sqrt( (ADArea*2)/(central - Math.sin(central)) );
    }
  }
  //special circle area case 2 continued: other circle segment
  else if((r!=0)&&(central2!=0)&&(AEArea==0) || (r!=0)&&(central2==0)&&(AEArea!=0) || (r==0)&&(central2!=0)&&(AEArea!=0)){

    if(AEArea == 0){
      AEArea = (central2 - Math.sin(central2))/2 * Math.pow(r,2);
    }
    else if(central2==0){
      double dif = 100;
      central2 = Math.PI/180;
      while((dif >= 0.001) && (central2 <= Math.PI)){
        dif = Math.abs(AEArea*2/Math.pow(r,2) - central2 + Math.sin(central2));
        central2 += 0.01;
      }
      central2 -= 0.01;
    }
    else{
      r = Math.sqrt( (AEArea*2)/(central2 - Math.sin(central2)) );
    }
  }
  //Special triangle area case 2
  else if((triangleArea!=0)&&(ADEArea!=0)&&(DBCEArea==0) || (triangleArea!=0)&&(ADEArea==0)&&(DBCEArea!=0) || (triangleArea==0)&&(ADEArea!=0)&&(DBCEArea!=0)){
    if(DBCEArea==0){
      DBCEArea = triangleArea-ADEArea;
    }
    else if(ADEArea==0){
      ADEArea = triangleArea-DBCEArea;
    }
    else{
      triangleArea = ADEArea + DBCEArea;
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

out.println("<img src = 'Refined 1.jpg' width = '480' height = '400'> + <br>");

out.println("Angle A(Radians): " + A + "<br>");
out.println("Angle B(Radians): " + B + "<br>");
out.println("Angle C(Radians): " + C + "<br>");
out.println("Side a: " + a + "<br>");
out.println("Side b: " + b + "<br>");
out.println("Side c: " + c + "<br>");
out.println("Segment DB: " + db + "<br>");
out.println("Segment EC: " + ec + "<br>");
out.println("Radius: " + r + "<br>");
out.println("Central Angle(radians): " + central + "<br>");
out.println("Chord Length(AD): " + chord + "<br>");
out.println("Arc 1(AD): " + arc + "<br>");
out.println("Central Angle 2(radians): " + central2 + "<br>");
out.println("Chord Length 2(AE): " + chord2 + "<br>");
out.println("Arc 2(AE): " + arc2 + "<br>");
out.println("Central Angle 3: " + central3 + "<br>");
out.println("Arc 3(DE): " + arc3 + "<br>");
out.println("Triangle Area(DBCE): " + DBCEArea + "<br>");
out.println("Triangle Area: " + triangleArea + "<br>");
out.println("Circle Area(AD): " + ADArea + "<br>");
out.println("Circle Area(AE): " + AEArea + "<br>");
out.println("Circle Area(ADE): " + ADEArea + "<br>");
out.println("Circle Area: " + circleArea + "<br>");
out.println("Triangle perimeter: " + perimeter + "<br>");
out.println("circumference: " + circumference + "<br>");


%>
