% 设置x的范围
x = 0:0.1:10;

% 计算贝塞尔函数I0(x)的真实值
I0_true = besseli(0, x);

% 计算贝塞尔函数I0(x)的近似值（例如，使用渐进展开公式）
I0_approx = sqrt(1./(2*pi*x)) .* exp(x) .* (1 - 1./(8*x) + 9./(128*x.^2) - 225./(3072*x.^3));

% 绘制比较曲线
plot(x, I0_true, 'b-', 'LineWidth', 2);  % 真实值曲线
hold on;
plot(x, I0_approx, 'r--', 'LineWidth', 2);  % 近似值曲线
hold off;

% 添加图例和坐标轴标签
legend('True Value', 'Approximation');
title('Comparison of I0(x) and its Approximation');
xlabel('x');
ylabel('I0(x)');
