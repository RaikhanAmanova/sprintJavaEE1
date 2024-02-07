package db;

import model.Tasks;

import java.util.ArrayList;

public class DBManager {
    public static ArrayList<Tasks> tasksList  = new ArrayList<>();

    static {
        tasksList.add(new Tasks(1L, "Создать Web приложение на JAVAEE", "Cделать с ссылками", "21.02.2024", true));
        tasksList.add(new Tasks(2L, "Убраться дома и закупить продукты", "Продукты лучше заказать", "20.02.2024",false));
        tasksList.add(new Tasks(3L, "Записаться на спорт", "Фитнес или иога", "25.02.2024", false));
    }
    private static Long id = 4L;

    public static ArrayList<Tasks> getAllTasks() {

        return tasksList;
    }
    public static void addTasks(Tasks tasks){
        tasks.setId(id);
        tasksList.add(tasks);
        id++;
    }
    public static Tasks getItemById(Long id) {
        for(Tasks tasks: tasksList){
            if(tasks.getId() == id){
                return tasks;
            }
        }
        return null;
    }
    public static void deleteTasks(Long id){
        for (int i = 0; i < tasksList.size(); i++) {
            if(tasksList.get(i).getId()==id){
                tasksList.remove(i);
                break;
            }
        }
    }


}
