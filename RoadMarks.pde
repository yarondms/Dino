class RoadMarks{
   
   RoadMarksLine line1 = new RoadMarksLine();
   RoadMarksLine line2 = new RoadMarksLine();
   RoadMarksLine line3 = new RoadMarksLine();
   
   void init(){
      line1.init(ground - 3);
      line2.init(ground + 1);
      line3.init(ground + 5);
   }
   
   void show(){
     line1.randomAdd();
     line2.randomAdd();
     line3.randomAdd();
     line1.show();
     line2.show();
     line3.show();
   }
   
}
