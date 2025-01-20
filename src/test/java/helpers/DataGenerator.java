package helpers;

import com.github.javafaker.Faker;

import net.minidev.json.JSONObject;

public class DataGenerator {
    static Faker faker = new Faker();
       
        public static String getRandomEmail() {
            String email = faker.internet().emailAddress();
        return email;
        };

        public static String getRandomUsername() {
            String username = faker.name().username();
            return username;
        };

        public static JSONObject getRandomArticleValues() {
            String title = faker.book().title();
            String description = faker.lorem().sentence();
            String body = faker.lorem().paragraph();
            JSONObject article = new JSONObject();
            article.put("title", title);
            article.put("description", description);
            article.put("body", body);
            return article;
        }
}
