import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import java.awt.*;
import java.sql.*;
import java.util.Vector;

public class Users extends JPanel {
    private JTable table;
    private JPanel tableWrapper;
    private JFrame frame;
    private Vector column;
    private GridBagLayout layout;
    private GridBagConstraints constraints;
    private JButton back;
    public Users(JFrame frame)
    {
        this.frame = frame;
        initBoard();
    }

    private void initBoard()
    {
        constraints = new GridBagConstraints();
        constraints.insets = new Insets(5, 5, 5, 5);
        layout = new GridBagLayout();
        setLayout(layout);
        tableWrapper = new JPanel(new GridLayout(1, 1));
        tableWrapper.setPreferredSize(new Dimension(800, 600));
        setBounds(0,0, Petty.width, Petty.height);
        setBackground(Color.LIGHT_GRAY);
        setPreferredSize(new Dimension(Petty.width, Petty.height));
        initTable();
        initButton();
    }

    private void initButton()
    {
        back = new JButton("Quay lại");
        constraints.gridx = 1;
        constraints.gridy = 0;
        constraints.gridheight = 0;
        this.add(back, constraints);
        addListener();
    }

    private void addListener()
    {
        back.addActionListener(e -> {
            MainMenu mainMenu = new MainMenu(frame);
            frame.add(mainMenu);
            destroy();
        });
    }

    private void destroy()
    {
        this.setVisible(false);
        this.removeAll();
        frame.remove(this);
    }

    private void initTable()
    {
        String[] column = {"ID","Name","preferName","Date of birth","Gender","image link"};
        String[][] data = {};
        table = new JTable(new DefaultTableModel(data, column));
        try {
            initData();
        } catch (Exception e) {
            e.printStackTrace();
        }
        tableWrapper.add(table);
        JScrollPane scrollPane = new JScrollPane(table, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
                JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        tableWrapper.add(scrollPane);
        constraints.gridx = 0;
        constraints.gridy = 0;
        constraints.gridheight = 3;
        constraints.fill = GridBagConstraints.HORIZONTAL;
        this.add(tableWrapper, constraints);
    }

    //read data
    private void initData() throws Exception {
        String url = "jdbc:mysql://localhost/petty";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, "root", "");
        String query = "SELECT * FROM userdetail";
        PreparedStatement statement = conn.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next())
        {
            String ID = resultSet.getString("ID");
            String Name = resultSet.getString("Name");
            String preferName = resultSet.getString("preferName");
            String dateOfBirth = resultSet.getString("DateOfBirth");
            String gender = resultSet.getString("gender");
            String imageLink = resultSet.getString("imageLink");
            DefaultTableModel model = (DefaultTableModel) table.getModel();
            String[] s = { ID, Name, preferName, dateOfBirth, gender, imageLink};
            model.addRow(s);
        }
    }
}
