<#import "parts/common.ftl" as c>

<@c.page>
    <#if person??>
        <h2>Welcome to the content shop!</h2>
        <div class="mt-5">Для покупки контента перейдите на страницу магазина путем нажатия на <strong>'Contents'</strong></div>
        <div class="mt-2">Для перехода в личный кабинет нажмите <strong>'Personal account'</strong></div>
        <div class="mt-2">Если хотите вернуться на главную страницу, нажмите <strong>'Content shop'</strong></div>
        <div class="mt-2">Выйти из системы (кнопка в правом верхнем углу) - <strong>'Sign out'</strong></div>
        <#else >
            <div>Пожалуйста, авторизуйтесь через <a href="/login">Google</a> </div>
    </#if>
</@c.page>