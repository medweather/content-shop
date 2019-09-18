<#import "parts/common.ftl" as c>

<@c.page>
    <#if person??>
        <h2>Welcome to the content shop!</h2>
        <div class="card text-white bg-primary mb-3 mt-4" style="max-width: 55rem;">
            <div class="card-body">
                <div class="mt-1" id="ma">Для выбора контента перейдите на страницу магазина путем нажатия на клавишу <strong>'1'</strong> или <strong>Contents</strong>;</div>
                <div class="mt-3">Чтобы просмотреть личный кабинет нажмите клавишу <strong>'3'</strong> или <strong>Personal account</strong>;</div>
                <div class="mt-3">Выйти из системы (кнопка в правом верхнем углу) - <strong>Sign out</strong>;</div>
            </div>
        </div>
    <script type="text/javascript">
        var ma = new Vue({
            el: '#ma',
            data: {

            },
            created: function () {
                document.addEventListener('keydown', function (ev) {
                    if(ev.key == '1')
                        window.location.href = '/all-contents/';
                    if(ev.key == '3')
                        window.location.href = '/personal-account/';
                })
            }
        });
    </script>
    <#else >
        <div>Пожалуйста, авторизуйтесь через <a href="/login">Google</a> </div>
    </#if>
</@c.page>