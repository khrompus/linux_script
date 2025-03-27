#!/bin/bash

# создаём каталог task с вложенными директориями
mkdir -p task/dir1 task/dir2 task/dir3/dir4

# изменяем текущую директорию на task
cd task || exit

# создаём пустой файл
touch ./dir2/empty

# создаём файл hello.sh с заданным содержанием
cat > ./dir2/hello.sh << 'EOF'
#!/bin/bash
echo "$NAME, привет!"
EOF

# устанавливаем права
chmod 764 ./dir2/hello.sh

# сохраняем список файлов
ls ./dir2 > ./dir2/list.txt

# копируем содержимое каталога
cp -r ./dir2/* ./dir3/dir4/

# записываем список txt-файлов
find . -name "*.txt" > ./dir1/summary.txt

# дописываем содержимое list.txt
cat ./dir2/list.txt >> ./dir1/summary.txt

# определяем переменную окружения
export NAME="Всем студентам"

# запускаем скрипт с аргументом
./dir2/hello.sh "$NAME" >> ./dir1/summary.txt

# перемещаем с переименованием
mv ./dir1/summary.txt "Практическое задание"

# выводим содержимое файла
cat "Практическое задание"

# ищем и сортируем строки
grep "dir" "Практическое задание" | sort

# возвращаемся в родительскую директорию
cd ..

# удаляем директорию
rm -rf task