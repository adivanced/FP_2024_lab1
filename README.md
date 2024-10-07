### Функциональное программирование 2024, Лабораторная №1
### Панин Иван Михайлович, P34082
=====
### Описание проблемы:

Проблема 8: Найти в числе с 1000 десятичными разрядами последовательность из 13 цифр с наибольшим произведением. Вывести произведение этой последовательности. 

Проблема 23: обильное число — число, чья сумма делителей превышает само число. Найти сумму всех чисел, которые не могут быть представлены как результат сложения двух обильных чисел. 

=====
### Ключевые элементы реализации: 
Проблема 8: 
Монолитное решение: конвертируем огромное число в массив из цифр. Идём по массиву, выбирая из него подмассивы в 13 элементов, для каждого находим произведение. Сравниваем найденное значение с максимумом. Выводим максимум. 
Модульное решение: выносим в модуль нахождение произведение для последовательности. Также выносим в модуль конвертацию огромного числа в массив цифр.
Решение на привычном ЯП: лучше объяснить устно. 

Проблема 23:
Монолитное решение: находим все обильные числа до 28123. Создаём пустой set. Заполняем set всеми суммами обильных чисел. Суммируем все числа, не входящие в set. 
Модульное решение: выносим в отдельный модуль проверку числа на обильность. 
Решение на привычном ЯП: так же как в монолитном решении, но вместо set используем lookup table. 

=====
### Вывод:
В целом мне показалось, что Erlang похож на Python, но функциональный. Впечатление от работы сложилось скорее негативное, так как я привык решать задачи, думая как компьютер. Поэтому процесс и принципы написания программы на Erlang показались мне забавной, но пустой безделицей, или же, в худшем случае — опасным заблуждением, которое может привести к большим проблемам с производительностью и процессом написания кода. 
