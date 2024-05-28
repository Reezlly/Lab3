@echo off

set "report_path=C:\Projects UNI\lab3\Labs\PZ-23-2\Pinchuk Nikita Yurievich\Report.txt"

set "report_content= Вступ: У цій роботі розглядаються та застосовуються основні команди пакетних файлів для автоматизації певних завдань в операційній системі Windows. Мета: Головною метою було вивчення можливостей пакетних файлів і використання їх для створення каталогів, копіювання файлів і зміни їх атрибутів. Методи: Для досягнення мети використовувались такі команди пакетних файлів: mkdir: для створення каталогів. attrib: для зміни атрибутів файлів і каталогів. xcopy: для копіювання файлів. Опис виконаних дій: Спершу було створено основний каталог batch за допомогою команди mkdir. В цьому каталозі створено дві підкаталоги: Hidden folder та Not hidden folder. За допомогою команди attrib одну з підкаталог було зроблено прихованою. Копіювання файлу copyhelp.txt з каталогу Not hidden folder до каталогу Hidden folder виконано командою xcopy."

echo %report_content% > "%report_path%"

echo The report was successfully created in the path: %report_path%
