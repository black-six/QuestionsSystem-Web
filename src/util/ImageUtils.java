package util;

import java.awt.Color;  
import java.awt.Font;  
import java.awt.Graphics;  
import java.awt.Graphics2D;  
import java.awt.image.BufferedImage;  
import java.io.IOException;  
import java.io.OutputStream;  
import java.util.Random;  
  
import javax.imageio.ImageIO;  
import javax.servlet.http.HttpServletRequest;
  
public class ImageUtils {  
  
    private static final int WIDTH = 60;  
    private static final int HEIGHT = 30;  
    private static final int TYPE = BufferedImage.TYPE_INT_RGB;  
    
    public static void outputImage(OutputStream out,HttpServletRequest request) throws IOException{  
        BufferedImage image = new BufferedImage(WIDTH,HEIGHT,TYPE);  
            Graphics g = image.getGraphics();  
            setBackground(g);  
            setBorder(g);  
            setRandomLine(g);  
            setRandomChar(g,request);  
            ImageIO.write(image, "jpg", out);  
    }  
      
    //设置图片背景色  
    private static void setBackground(Graphics g) {  
        Color c = Color.WHITE;  
        g.setColor(c);  
        g.fillRect(0, 0, WIDTH, HEIGHT);  
          
    }  
  
    //向图片上写边框  
    private static  void setBorder(Graphics g) {  
        Color c = Color.BLUE;  
        g.setColor(c);  
        g.drawRect(1, 1, WIDTH-2, HEIGHT-2);  
    }  
      
    //向图片上写干扰线   
    private  static void setRandomLine(Graphics g) {  
        Color c = Color.GREEN;  
        g.setColor(c);  
        for(int i=0;i<4;i++){  
            int x1 = new Random().nextInt(WIDTH);  
            int x2 = new Random().nextInt(WIDTH);  
            int y1 = new Random().nextInt(HEIGHT);  
            int y2 = new Random().nextInt(HEIGHT);  
            g.drawLine(x1, y1, x2, y2);  
        }  
    }  
  
    //向图片上写数据  
    private static  void setRandomChar(Graphics g,HttpServletRequest request) {  
        String base = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0123456789";
        StringBuffer sb = new StringBuffer();  
        for(int i=0;i<4;i++){   
            int rand = new Random().nextInt(base.length()-1);  
            sb.append(base.charAt(rand) + "");  
        }
        
        //将验证码值放进request中
        request.setAttribute("yzm", sb.toString());
        
        //设置字体颜色  
        Color c = Color.BLUE;  
        g.setColor(c);  
          
        //设置字体大小  
        Font f = new Font("宋体",Font.PLAIN,20);  
        g.setFont(f);  
          
        //设置旋转  
        Graphics2D g2d = (Graphics2D) g;  
        g2d.rotate(0.05);  
          
        //向图片上写随机数  
        g.drawString(sb.toString(), 10, 20);  
          
    }  
      
}  