#Использовать asserts
#Использовать gui

Перем ВидыПоляФормы;
Перем Форма;
Перем ТекстПроверки;

Функция ПолучитьСписокТестов(Тестирование) Экспорт

	СписокТестов = Новый Массив;
	СписокТестов.Добавить("Тест_Должен_СоздатьПоле");
	СписокТестов.Добавить("Тест_Должен_СоздатьСтраницы");
	СписокТестов.Добавить("Тест_Должен_ОбработатьПеремещение");
	
	Возврат СписокТестов;

КонецФункции

//# Работа с событиями
Процедура ПриОткрытииФормы() Экспорт
	Форма.Закрыть();
КонецПроцедуры

Процедура ПолучитьФорму()

	УправляемыйИнтерфейс = Новый УправляемыйИнтерфейс();
	Форма = УправляемыйИнтерфейс.СоздатьФорму();
	Форма.УстановитьДействие(ЭтотОбъект, "ПриОткрытии", "ПриОткрытииФормы");
	ВидыПоляФормы = Форма.ВидГруппыФормы;

КонецПроцедуры

Процедура Тест_Должен_СоздатьПоле() Экспорт

	ПолучитьФорму();

	Поле1 = Форма.Элементы.Добавить("Поле1", "ГруппаФормы", Неопределено);
	Поле1.Вид = ВидыПоляФормы.Страницы;
	Форма.Показать();

	Ожидаем.Что(Форма.Элементы.Найти("Поле1")).Существует();

КонецПроцедуры


Процедура Тест_Должен_СоздатьСтраницы() Экспорт

	ПолучитьФорму();

	//# Создание страниц
	Страницы = Форма.Элементы.Добавить("Страницы1", "ГруппаФормы", Неопределено);
	Страницы.Вид = Форма.ВидГруппыФормы.Страницы;
	Страницы.Заголовок = "Страницы";

	Страница1 = Форма.Элементы.Добавить("Страница1", "ГруппаФормы", Страницы);
	Страница1.Вид = Форма.ВидГруппыФормы.Страница;
	Страница1.Заголовок = "Страница1";
	Форма.Показать();

	Ожидаем.Что(Форма.Элементы.Найти("Страницы1").Элементы.Найти("Страница1"), "Ошибка установки родителя").Равно(Страница1);

КонецПроцедуры

Процедура Тест_Должен_ОбработатьПеремещение() Экспорт

	ПолучитьФорму();

	Страницы1 = Форма.Элементы.Добавить("Страницы1", "ГруппаФормы", Неопределено);
	Страницы1.Вид = Форма.ВидГруппыФормы.Страницы;
	Страницы1.Заголовок = "Страницы";

	Страницы2 = Форма.Элементы.Добавить("Страницы2", "ГруппаФормы", Неопределено);
	Страницы2.Вид = Форма.ВидГруппыФормы.Страницы;
	Страницы2.Заголовок = "Страницы";

	Страница1 = Форма.Элементы.Добавить("Страница1", "ГруппаФормы", Страницы1);
	Страница1.Вид = Форма.ВидГруппыФормы.Страница;
	Страница1.Заголовок = "Страница1";

	Форма.Элементы.Переместить(Страница1, Страницы2, Неопределено);
	Форма.Показать();

	Ожидаем.Что(Страницы1.Элементы.Количество()).Равно(0);
	Ожидаем.Что(Страницы2.Элементы.Количество()).Равно(1);

КонецПроцедуры