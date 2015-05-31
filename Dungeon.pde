import java.util.*;

public class Dungeon {

  private String name;

  private int totalFloors, currentFloor;

  private Floor floor;

  private List<Creature> enemies;
  private Hero hero;
  
  private Random rng;

  public Dungeon(String name, int floors) {
    
    this.name = name;
    totalFloors = floors;
    currentFloor = 1;
    rng = new Random((name.hashCode() << 16) ^ totalFloors);
    floor = new Floor(enemies, rng);
    hero = new Hero(20, 1, 20, 20, color(255,0,0));
  }

  public void nextFloor() {
    currentFloor++;
    if (currentFloor > totalFloors) {
      // exit the dungeon
    } else {
	floor = new Floor(enemies, rng);
    }
  }
  public Hero getHero(){
     return hero;
  }
  public void attack(){
    Creature enemy = null;
    int i = 0;
    while (i < enemies.size()){
        Creature currEnemy = enemies.get(i);
      if (dist(currEnemy.getR(), currEnemy.getC(), hero.getR(), hero.getC()) <= 1){
         enemy = currEnemy;
         
      }
    }
    enemy.setColor(color(0,0,0));
  }
  
  public void draw() {
    for (Floor.Tile tile: floor) {
      tile.draw();
    }
    hero.draw();
  }
}
