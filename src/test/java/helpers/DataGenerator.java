package helpers;

import com.github.javafaker.Faker;
import net.minidev.json.JSONObject;

public class DataGenerator {

    public DataGenerator(){

    }

    public static Integer getRandomSalary() {
        Faker faker = new Faker();
        return faker.random().nextInt(1000, 3000);
    }

    public static Integer getRandomAge() {
        Faker faker = new Faker();
        return faker.random().nextInt(21, 60);
    }

    public static String getRandomName() {
        Faker faker = new Faker();
        return faker.name().username();
    }

    public static String getRandomEmail() {
        Faker faker = new Faker();
        return faker.name().firstName() + "@" + "gmail.com";
    }

    public static JSONObject getNewArticle() {
        Faker faker = new Faker();
        JSONObject jsonObject = new JSONObject();
        String title = faker.artist().name();
        String description = faker.book().publisher();
        String body = faker.book().genre().toLowerCase();
        jsonObject.put("title", title);
        jsonObject.put("description", description);
        jsonObject.put("body", body);
        return jsonObject;
    }
}

