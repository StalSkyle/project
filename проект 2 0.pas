program QuadraticEquation;
var
  a, b, c, x3, x4, x1, x2, discriminant, per: real;
  i, ii : integer;
  s, net : string;
begin
  randomize();
  {ввод данных}
  write('Если вам нужна теория по решению квадратных уравнений, введите слово "теория", а если нет, нажмите enter');
  readln(s);
  if s = 'теория' then
    begin
      write('Квадратное уравнение — это уравнение вида ax2 + bx + c = 0, где коэффициенты a, b и c — произвольные числа, причем a ≠ 0.', #10);
      write('Дискриминант можно найти с помощью формулы D=b^2-4*a*c', #10);
      write('Если D<0, то корней нет, если D>0, то два', #10);
      write('Eсли D=0, то один корень, который находится по формуле x=-b/2a', #10);
      write('А если D>0, то корень находятся следующим образом: x1, x2=(-b±√D)/2a', #10);
    end;
  write('Введите, сколько раз начать тренировку ');
  readln(i);
  for ii :=0 to i-1 do begin
    if random(1)=0 then
      begin
        x1:=random(10)-5;
        x2:=random(10)-5;
        while a=0 do
          begin
            a:=random(8)-4;
          end;
        c:=x1*x2*a;
        b:=-(x1+x2)*a;
      end
    else
      begin
        b:=random(8)-4;
        while a=0 do
          begin
            a:=random(8)-4;
          end;
        c:=sqr(b)/(4*a)+random(3);
      end;
    write('Уравнение: ');
    if a=1 then
      write('x^2')
    else if a=-1 then
      write('-x^2')
    else
      write(a, 'x^2');
    if (b=1) and (a<>0) then
      write('+x')
    else if b<1 then
      write(b, 'x')
    else if (b>0) and (a<>0) then
      write('+', b, 'x')
    else if b=0 then
      write()
    else
      write(b, 'x');
    if c>0 then
      write('+', c)
    else if c<0 then
      write(c);
    write('=0');
    writeln();
    {writeln('Уравнение: ', a, 'x^2+', b, 'x+', c);} 
    {дискриминант}
    discriminant := sqr(b) - 4 * a * c;  

    if discriminant < 0 then
      begin
        write('А теперь введите корни, которые у вас получились, через пробел, или "нет", если корней нет ');
        read(net);
        if net='нет' then
          writeln('Правильно! У этого уравнения нет корней')
        else
          writeln('Неправильно! У этого уравнения нет корней')
      end 

    
    else
      begin
        if discriminant = 0 then
          begin
          {квадратное уравнение имеет два одинаковых корня}
            x1 := -b / (2 * a);
            x2 := x1;
            write('А теперь введите корни, которые у вас получились, через пробел, или "нет", если корней нет ');
            readln(x3);
            if x3 = x1 then
              writeln('Правильно!')
           else
              writeln('Неправильно! Уравнение имеет единственный корень: ', x2)
         end
        else
           begin
           {уравнение имеет два разных корня}
            write('А теперь введите корни, которые у вас получились, через пробел, или "нет", если корней нет ');
            x1 := (-b + sqrt(discriminant)) / (2 * a);
            x2 := (-b - sqrt(discriminant)) / (2 * a);
            readln(x3, x4);
            if (x1 = x3) and (x2=x4) or (x1=x4) and (x2=x3) then
              begin
               writeln('Правильно!');
               per+=1;
              end
            else
               writeln('Неправильно! У уравнения два корня: ',x1, ', ', x2)
           end;
       
       
      // writeln('x1 = ', x1:8:3);
      // writeln('x2 = ', x2:8:3);
     end;
  end;
  writeln('Вы закончили тренировку, результаты:');
  writeln('процент правильных ответов: ', per/i*100, '%');
end.

