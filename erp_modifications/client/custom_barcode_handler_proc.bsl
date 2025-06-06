&НаКлиенте
&Вместо("ОбработатьШтрихкод")
Процедура ВС_ОбработатьШтрихкод(Знач Оповещение, Данные)
    // First, we search for the document reference in the new barcode register for retail
    Если СтрДлина(Данные.Штрихкод) = 13 И Лев(Данные.Штрихкод, 7) = "2010000" Тогда
        Ссылка = ПолучитьСсылкуПоПриходу(Данные.Штрихкод);
        Если ЗначениеЗаполнено(Ссылка) Тогда
            Элемент.Список.ТекущаяСтрока = Ссылка;
            ПоказатьЗначение(Новый ОписаниеОповещения("ОбработатьШтрихкодЗавершение", ЭтотОбъект, Новый Структура("Данные, Оповещение", Данные, Оповещение)));
        Иначе
            ПоказатьЗначение("Выбранная штрихкарта не привязана ни к одному заказу");
        КонецЕсли;
        Возврат;
    КонецЕсли;

    // If not found — try to find as usual
    ПродолжитьВызов(Оповещение, Данные);
КонецПроцедуры
