<#import "logout.ftl" as l>
    <#-- Шапка сайта -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Content shop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <#if person??>
    <div class="collapse navbar-collapse" id="acco">
        <ul class="navbar-nav mr-auto" >
            <li class="nav-item">
                <a class="nav-link" href="/personal-account">Personal account</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/all-contents">Contents</a>
            </li>
        </ul>
        <div class="navbar-text mr-3">
            {{ person.name }}
        </div>
        <@l.logout />
    </div>
    <script type="text/javascript">
        var acco = new Vue({
            el: '#acco',
            data: {
                person: [],
                url: {
                    person: '/person'
                }
            },
            created: function () {
                axios.get(this.url.person).then((response) => {
                    console.log(this);
                    this.person = response.data;
                });
            }
        });
    </script>
    </#if>
</nav>