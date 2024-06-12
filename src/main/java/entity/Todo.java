package entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
@Entity
public class Todo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Size(min = 10, message = "Todo text must be at least 10 characters long")
    private String text;

    @ManyToOne
    private User user;

    // Getters and setters
}
