## static

在Java中，`static`关键字是一个非常重要的特性，它用于创建类的静态成员，这些成员不属于类的任何特定实例，而是属于类本身。这意味着无论你创建了多少个该类的对象，静态成员都只有一份拷贝，被所有实例共享。以下是`static`关键字的几个关键应用场景和特点：

1. **静态变量（Static Fields）**：
   - 静态变量在类加载时初始化，且在内存中只有一份副本，所有该类的实例共享同一份静态变量的值。
   - 可以通过类名直接访问，无需实例化对象，如 `ClassName.staticVariable`。

2. **静态方法（Static Methods）**：
   - 静态方法同样属于类级别，不属于任何对象实例，因此不能直接访问实例变量或调用非静态方法（除非通过类的实例）。
   - 静态方法可以通过类名调用，如 `ClassName.staticMethod()`。
   - 常用于工具类中，执行不依赖于对象状态的操作。

3. **静态代码块（Static Block）**：
   - 静态代码块在类加载时执行，用于初始化静态变量或执行其他仅需执行一次的静态初始化操作。
   - 如果有多个静态代码块，按照它们在类中的顺序执行。

4. **静态内部类（Static Nested Class）**：
   - 不依赖于外部类的实例，可以直接通过外部类名访问。
   - 主要用于组织逻辑上相关但不需要外部类实例的类。

5. **内存分配**：
   - 静态成员存储在Java的永久代或元数据区（Java 8及以后版本），而非堆内存中，这意味着它们不随对象的创建和销毁而变化。

使用`static`关键字时需要注意的是，由于**静态成员不依赖于对象实例，所以在处理并发访问时可能需要额外的同步机制来保证线程安全**。

总结来说，`static`关键字提供了一种在类级别上定义变量和方法的手段，使得这些成员可以不依赖于对象实例而被访问和操作，非常适合实现那些与类的实例无关的功能和数据。

## final

在Java中，`final`是一个非常重要的关键字，它可以用于类、方法和变量，有着不同的含义：

1. **Final Variables（最终变量/常量）**:
   当一个变量被声明为`final`时，它的值在初始化后就不能再改变。这意味着它变成了一个常量。对于基本数据类型，一旦赋值后，值不能被修改；对于引用类型的变量，虽然其引用不能被改变指向另一个对象，但是对象的内容如果是可变的，那内容仍然可以被修改。例如：
   
   ```java
   final int MAX_SIZE = 100; // 基本类型常量
   final StringBuilder text = new StringBuilder("Hello"); // 引用类型常量，内容可以变
   ```
   
2. **Final Methods（最终方法）**:
   当一个方法被声明为`final`时，它不能被子类覆盖（Override）。这通常用来确保某些方法的行为在其子类中保持不变。例如：
   
   ```java
   public final void printMessage() {
       System.out.println("This method cannot be overridden.");
   }
   ```
   
3. **Final Classes（最终类）**:
   如果一个类被声明为`final`，那么它不能被继承。这适用于那些设计为不允许有子类的类，比如`String`类。例如：
   
   ```java
   public final class ImmutableClass {
       // 类的定义
   }
   ```

使用`final`关键字的好处包括：
- **提高程序的可读性和稳定性**：通过限制修改和扩展，可以让代码的行为更加可预测。
- **性能优化**：尤其是对于基本类型的final变量，编译器可以做出优化，因为知道其值不可变。
- **设计约束**：强制表明某些类、方法或变量的用途是固定的，有助于清晰地表达设计意图。

总之，`final`关键字是Java中用于控制类、方法和变量行为的重要机制，通过它能够增强代码的安全性、可读性和效率。



# SpringBoot葵花宝典



[Spring Boot -1-创建工程](https://mp.weixin.qq.com/s/yEieBLwqA-xSTeU9hlEHQA)

[SpringBoot-2-嵌入式容器](https://mp.weixin.qq.com/s/JkYNEaOSk0qsJlKiJxCB_A)

[Spring-3-日志管理](https://mp.weixin.qq.com/s/mflcwytQo_tBwcRDwhMNiQ)

[SpringBoot-4-Web开发](https://mp.weixin.qq.com/s/BZu0XB-OO8OUod-20Qze-A)

[SpringBoot-5-页面展示Thymeleaf](https://mp.weixin.qq.com/s/oiq9L6ru2WatT4obn4wacw)

[SpringBoot-6-模板Thymeleaf常用标签](https://mp.weixin.qq.com/s/7HpSF2RxN8Ce4paEwbsgcg)

[SpringBoot-7-国际化](https://mp.weixin.qq.com/s/1BkaQVOH974oP8x9rx3VGw)

[SpringBoot-8-属性配置](https://mp.weixin.qq.com/s/9s2IkLwwblGinmuvF7TrlA)

[SpringBoot-9-Validation数据--使数据真实](https://mp.weixin.qq.com/s/thPbYXYIijzQDlzq3c1KxQ)

[SpringBoot-10-全局异常](https://mp.weixin.qq.com/s/ddTGpe_XSnM-ENJBYhDDSg)

[SpringBoot-11-文件的上传和下载](https://mp.weixin.qq.com/s/q0p3zgcRbWyelt-jx9vM7g)

[SpringBoot-12-banner自定义](https://mp.weixin.qq.com/s/DIdviY59r2fkvuiRc7G0qg)

[SpringBoot-13-使用JdbcTemplate链接Mysql数据库](https://mp.weixin.qq.com/s/1R1V-NwPcjmRDBrsnCOyqw)

[SpringBoot-14-JdbcTemplate多数据源配置](https://mp.weixin.qq.com/s/PjRD6zF-j7JDf8MtGOo_oA)

[SpringBoot-15-Spring-Data-Jpa的使用](https://mp.weixin.qq.com/s/YNtcO-DYR8GbkhN7KXQw4w)

[SpringBoot-16-Spring-Data-Jpa实现分页排序](https://mp.weixin.qq.com/s/AsX0-Z1v2kyrSY_pPrbI5g)

[SpringBoot-17-Spring data JPA的多数据源实现](https://mp.weixin.qq.com/s/Tawb_rSp378j_YUGdjmK9A)

[SpringBoot-18-Mybatis基础操作](https://mp.weixin.qq.com/s/mrPnDJfWsfukdRTwWDhQ-g)

[SpringBoot-19-Mybatis的xml配置方式](https://mp.weixin.qq.com/s/N7PpQVqP3zItDZVruSpHSA)

[SpringBoot-20-Mybatis代码生成](https://mp.weixin.qq.com/s/lGh2gu4Wn_yEcveAmxzj2A)

[SpringBoot-21-Mybatis多数据源配置](https://mp.weixin.qq.com/s/iajW4kwasrKBNiCAS1z1oQ)

[SpringBoot-22-RESTful统一规范响应数据格式](https://mp.weixin.qq.com/s/Hdf0rDC9RoS96xDxyEkwJw)

[SpringBoot-23-全局异常机制+RESTful统一规范](https://mp.weixin.qq.com/s/8YBJ5INmZJD0VV3nVzybKQ)

[SpringBoot-24-默认Json框架jackson详解](https://mp.weixin.qq.com/s/kpSgVmqNlgsd0mE4DNyVSA)

[SpringBoot-25-SpringBoot整合Swagger2以及Swagger-Bootstrap-Ui的使用](https://mp.weixin.qq.com/s/DkoQKzYfei0r3KV08XHX6Q)

[SpringBoot-26-缓存Ehcache的使用](https://mp.weixin.qq.com/s/dXnQA4aTEAnUoclm30XQdQ)

[SpringBoot-27- @Async实现异步调用 什么是异步调用](https://mp.weixin.qq.com/s/tX2zOU_hkOt7pvIMk3lLuw)

[SpringBoot-28-RestTemplate基本介绍](https://mp.weixin.qq.com/s/jRWL2ebc2v73Y-MDSzdL8w)

[SpringBoot-29-RestTemplate的Get请求使用详解](https://mp.weixin.qq.com/s/tPHWZOgbPKLCOiCzhA3ikg)

[SpringBoot-30-RestTemplate的Post详解](https://mp.weixin.qq.com/s/SvI0JAFGfqxbmtK6MHZvhA)

[SpringBoot-31-注解详解-1](https://mp.weixin.qq.com/s/lkXVwULgMDqtvPUrgnLHeA)

[SpringBoot-32-常用注解汇总2](https://mp.weixin.qq.com/s/tSBpdzpYVWSZlGO-IDWdBQ)

# Docker入门



[云计算--Docker在Ubuntu上安装](https://mp.weixin.qq.com/s?__biz=MzIzMjIyNTYwNg==&mid=2247484427&idx=3&sn=0a05798b247fa4d7175b703fb83fadff&chksm=e8996a22dfeee33411b2881e4b9a9041cd4c355f7fd7865833961593eff83892122a00d36871&token=1578645039&lang=zh_CN#rd)

[云计算--Docker在Centos上的安装](https://mp.weixin.qq.com/s?__biz=MzIzMjIyNTYwNg==&mid=2247484427&idx=2&sn=29ad6a8f963f6343f93656efc73fde19&chksm=e8996a22dfeee334656ab03964f6698a5e4bfd479522b48527cd92945a4477532dcc9d221f50#rd)

[云计算--Docker典型命令Docker run部署nginx\mysql\redis](https://mp.weixin.qq.com/s?__biz=MzIzMjIyNTYwNg==&mid=2247484443&idx=2&sn=db323b439edb52cb8be3fa02b7c7147e&chksm=e8996a32dfeee324d6903e4f948077da38f8b174edd474e2e55aff93f0f218b26447e95a2de4#rd)

[云计算--Docker搭建Nacos以及搭建过程中常用的Docker命令](https://mp.weixin.qq.com/s?__biz=MzIzMjIyNTYwNg==&mid=2247484512&idx=2&sn=80e847dc1955f3bc8a0026e624b9ee13&chksm=e8996a49dfeee35fec91b0bb449439c47ec590f8d3fc89c63d74f3280599620292e3a8881fea#rd)

[云计算-5-docker commit定制镜像](https://mp.weixin.qq.com/s?__biz=MzIzMjIyNTYwNg==&mid=2247484568&idx=2&sn=fca5d7f05875f433f77da5bbf7848c05&chksm=e8996ab1dfeee3a7fe44ec52218f71dcc9dbd8ddbe8eebb702c9550dc119154cbc52876abf7c#rd)

[云计算-6-Dockerfile制作镜像](https://mp.weixin.qq.com/s?__biz=MzIzMjIyNTYwNg==&mid=2247484593&idx=2&sn=ef6a9ea0a83e3e74a5e9a0eb58777457&chksm=e8996a98dfeee38e1690ca97c517fa15a5d0841db825e5c97efbe3cbfc46e9a13bbf776d0e3e#rd)