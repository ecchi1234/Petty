import javax.swing.*;
import java.awt.*;

public class Petty extends JFrame{
    public static int width = 1200;
    public static int height = 800;
    public Petty()
    {
        pack();
        setVisible(true);
        setSize(width, height);
        setResizable(false);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(null);
        setTitle("Petty");
        setBackground(Color.LIGHT_GRAY);
        MainMenu menu = new MainMenu(this);
        this.add(menu);
    }

    public static void main(String[] args)
    {
        EventQueue.invokeLater(() -> {
            Petty petty = new Petty();
        });
    }
}
