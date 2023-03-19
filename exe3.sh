#!/bin/bash
CUR_DIR=$(pwd)
# создаем перменную с командой которая будет передовать деррикторию, из которой запускается скрп и с которой он будет работать.

# Выполнение в случае не соотвествии проверки в main
usage() {
  echo "Error: In this Dir no files matching the requirement"
  exit 1

}
# создаем функции для каждого нужного параметра
func1() {
  cd $CUR_DIR
  arg="Files with sh extension"
  echo "$arg":
  type1=$(find . -maxdepth 1 \( ! -regex '.*/\..*' \) -type f -name "*.sh"  | sed 's/^\.\///g' | sort)
  if [[ -z $type1 ]]; then
      echo "no files"
      else
  echo -e "$type1" | awk '{print"      ",$0}'
  fi
}

#maxdepth 1 - (глубина поиска - поиск файла в дерриктории поиска без рекурсивного просмотра всех деррикторий).
#\( ! -regex '.*/\..*' \) = -not -path '*/\.*'  - регулярное выраженеи убирает из поиска все скрытые файлы и дерриктории.
#-type f поиск только файлов; -name "*.sh" - поиск файлов с именем:*-любые символы с суффиксом .sh.
#sed 's/^\.\///g' - убирает из выдачи специальные символы (^).
#sort - соритровка выдачи.
#awk '{print"      ",$0}' - делаем отступы слева для выдачи переменно $type1.

func2() {
  cd $CUR_DIR
  arg2="Files with txt extension"
  echo "$arg2":
  type2=$(find . -maxdepth 1 -type f -name "*.txt" -not -path '*/\.*' | sed 's/^\.\///g' | sort)
  if [[ -z $type2 ]]; then
    #-z $type2 - проверяем на пустую строку
    echo "no files"
    else
  echo -e "$type2" | awk '{print"      ",$0}'
  fi
}


func3() {
  cd $CUR_DIR
  arg3="Files with no extension"
  echo "$arg3":
  type3=$(find . -maxdepth 1 -type f -name "*" -not -name "*.*" -not -path '*/\.*' | sed 's/^\.\///g' | uniq -u | sort)
  if [[ -z $type3 ]]; then
    echo "no files"
    else
  echo -e "$type3" | awk '{print"      ",$0}'
  fi
}

# Создаем главную функцию для проверки выдачи команды ls на пустую строку, в случае если проверка пройдена, то \
# запускается usage с пояснением и кодом выхода, в случае если пустые строи отсутствуют, то запускаются все остальные функции.
main () {
 cd $CUR_DIR
var=$(ls)
  var=$(find . -maxdepth 1 -type f -name "*.*")
  if [[ -z $var ]]; then
    usage
    else
       func1
       func2
       func3
    fi

}
main "$@"
