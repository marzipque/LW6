package app.model;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import app.entities.User;

public class Model {
    private static Model instance = new Model();

    private List<User> model;

    public static Model getInstance() {
        return instance;
    }

    private Model() {
        model = new ArrayList<>();
    }

    public void add(User user) {
        model.add(user);
    }

    public List<String> getUserNamelist() {
        return model.stream()
                .map(User::getName)
                .collect(Collectors.toList());
    }

    public List<User> getUserList() {
        return model;
    }
}
