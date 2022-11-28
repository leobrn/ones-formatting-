#Область РаботаСТекстовымиФайлами

Функция ПолучитьТекстИзФайла(ИмяФайла) Экспорт

	ФайлОбмена = Новый Файл(ИмяФайла);
	Данные = "";
	Если ФайлОбмена.Существует() Тогда

		Текст = Новый ЧтениеТекста(ИмяФайла, КодировкаТекста.ANSI);
		Данные = Текст.Прочитать();
		Текст.Закрыть();

		ОсвободитьОбъект(Текст);
		
	КонецЕсли;

	Возврат Данные;

КонецФункции

Процедура ЗаписатьРезультатВФайл(ИмяФайла, Данные) Экспорт

	Текст = Новый ЗаписьТекста(ИмяФайла, КодировкаТекста.ANSI); 
	Текст.Записать(Данные); 
	Текст.Закрыть();		
	
	ОсвободитьОбъект(Текст);

КонецПроцедуры

#КонецОбласти
