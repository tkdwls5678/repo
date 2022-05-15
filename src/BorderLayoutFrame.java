import java.awt.*;
import java.awt.event.*;
public class BorderLayoutFrame extends Frame {
    public BorderLayoutFrame(String s){
        super(s);
        addWindowListener(new WinListener());
    }
    public static void main(String args[]){
        BorderLayoutFrame fr = new BorderLayoutFrame("보더 배치 예제");
        BorderLayout border = new BorderLayout();
        fr.setLayout(border);
        fr.add("North", new Button("윗쪽 버튼"));
        fr.add("East", new Button("오른쪽 버튼"));
        fr.add("West", new Button("왼쪽 버튼"));
        fr.add("South", new Button("아래쪽 버튼"));
        String message = "수원과학대학교\n"+"전자계산학과\n"+"안용화 교수\n";
        fr.add("Center", new TextArea(message));
        fr.setSize(450, 300);
        fr.show();
    }
    class WinListener extends WindowAdapter{
        public void windowClosing(WindowEvent we){
            System.exit(0);
        }
    }

}
