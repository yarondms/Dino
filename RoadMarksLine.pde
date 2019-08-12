class RoadMarksLine{
   
   int y;
   RoadMark[] line = new RoadMark[100];
   int numOfMarks = 0;
   int delay = 0;
   
   void init(int yValue){
      y = yValue; 
   }
 
 void randomAdd(){

     delay--;
     if (delay > 0) return;
     float i = random(1);
     if (i > 0.9) {
       line[this.numOfMarks] = new RoadMark();
       line[this.numOfMarks].init(y);
       delay = (line[numOfMarks].w * 2) / speed; 
       numOfMarks++;       
     }
   } 
   
   void pop(){
      if (this.numOfMarks == 0) return;
      if (this.numOfMarks == 1) {
         this.line[0] = null;
         this.numOfMarks = 0;
         return;
      }
      
      for (int i = 0; i < numOfMarks -1; i++){
         line[i] = line [i+1]; 
      }
      
      line[numOfMarks - 1] = null;
      numOfMarks--;
   }
   
   void show(){
      if (this.numOfMarks == 0) return;
      for (int i = 0; i < numOfMarks; i++){
        line[i].advance();
        line[i].show();
      }
      
      if (line[0].x < line[0].w) pop();
   }
}
