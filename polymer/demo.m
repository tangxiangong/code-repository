clc
clear
close all

n = 1000;                    % 单体数量
len = 1;                     % 单体长度，对于高斯链是平均长度
theta = pi/3;                % 自由旋转链的键角
wl_theta = pi/10000;         % 蠕虫状链的键角，远小于1

r1 = fjc(len, n);            % 自由连接链
r2 = frc(theta, len, n);     % 自由旋转链
r3 = frc(wl_theta, len, n);  % 蠕虫状链，即自由旋转链键角充分小的情况
r4 = gc(len, n);             % 高斯链，即每个单体独立同分布，三元高斯分布

tn = ["Freely Jointed Chain" "Freely Rotating Chain" ...
    "Worm-like Chain" "Gaussian Chain"];
fn = tn + ".gif";

plotgif(r1, fn(1), tn(1))
plotgif(r2, fn(2), tn(2), 10)
plotgif(r3, fn(3), tn(3), 10)
plotgif(r4, fn(4), tn(4), 10)

if 1==2
    r1_end2end = [r1(1, :); r1(end, :)];
    r2_end2end = [r2(1, :); r2(end, :)];
    r3_end2end = [r3(1, :); r3(end, :)];
    r4_end2end = [r4(1, :); r4(end, :)];
    figure()
    subplot(2,2,1)
    plot3(r1(:,1), r1(:,2), r1(:,3))
    hold on
    plot3(r1_end2end(:, 1), r1_end2end(:, 2), r1_end2end(:, 3), 'o-')
    title('Freely Jointed Chain')
    str1 = ["monomer's number n = ", num2str(n), ...
        "monomer's length b = ", num2str(len)];
    dim1 = [0.1,0.8,0.3,0.2];
    annotation('textbox',dim1,'String',str1,'FitBoxToText','on');
    legend(["chain", "end to end vector"], 'Location', 'northeast')
    xlabel('x')
    ylabel('y')
    zlabel('z')
    grid on
    
    subplot(2,2,2)
    plot3(r2(:,1), r2(:,2), r2(:,3))
    hold on
    plot3(r2_end2end(:, 1), r2_end2end(:, 2), r2_end2end(:, 3), 'o-')
    title("Freely Rotating Chain")
    str2 = ["monomer's number n = ", num2str(n), ...
        "monomer's length b = ", num2str(len), ...
        "bond angle \theta = ", num2str(theta)];
    dim2 = [0.8,0.8,0.3,0.2];
    annotation('textbox',dim2,'String',str2,'FitBoxToText','on');
    legend(["chain", "end to end vector"], 'Location', 'northwest')
    xlabel('x')
    ylabel('y')
    zlabel('z')
    grid on
    
    subplot(2,2,3)
    plot3(r3(:,1), r3(:,2), r3(:,3))
    hold on
    plot3(r3_end2end(:, 1), r3_end2end(:, 2), r3_end2end(:, 3), 'o-')
    title('Worm-like Chain')
    str1 = ["monomer's number n = ", num2str(n), ...
        "monomer's length b = ", num2str(len)];
    dim3 = [0.1,0.3,0.3,0.2];
    annotation('textbox',dim3,'String',str1,'FitBoxToText','on');
    legend(["chain", "end to end vector"], 'Location', 'northeast')
    xlabel('x')
    ylabel('y')
    zlabel('z')
    grid on
    
    subplot(2,2,4)
    plot3(r4(:,1), r4(:,2), r4(:,3))
    hold on
    plot3(r4_end2end(:, 1), r4_end2end(:, 2), r4_end2end(:, 3), 'o-')
    title('Gaussian Chain')
    str1 = ["monomer's number n = ", num2str(n), ...
        "monomer's average length b = ", num2str(len)];
    dim4 = [0.8,0.3,0.3,0.2];
    annotation('textbox',dim4,'String',str1,'FitBoxToText','on');
    legend(["chain", "end to end vector"], 'Location', 'northwest')
    xlabel('x')
    ylabel('y')
    zlabel('z')
    grid on
end