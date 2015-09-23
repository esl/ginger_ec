{% extends "base.tpl" %}

{% block content %}
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <button class="ginger-btn-pill--primary">Button</button>
            </div>
            <div class="col-md-6">
                <textarea style="width: 350px; height: 150px;"><button class="ginger-btn-pill--primary">Button</button></textarea>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <button class="ginger-btn-pill--secondary">Button</button>
            </div>
            <div class="col-md-6">
                <textarea style="width: 350px; height: 150px;"><button class="ginger-btn-pill--secondary">Button</button></textarea>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <button class="ginger-btn-pill--anchor">Button</button>
            </div>
            <div class="col-md-6">
                <textarea style="width: 350px; height: 150px;"><button class="ginger-btn-pill--anchor">Button</button></textarea>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <nav class="ginger-pagination">
                    <a href="" class="ginger-pagination__previous">Vorige</a>

                    <ol class="ginger-pagination__pages">
                        <li class="ginger-pagination__page"><a href="">1</a></li>
                        <li class="ginger-pagination__page"><a href="">2</a></li>
                        <li class="ginger-pagination__page"><a href="">3</a></li>
                        <li class="ginger-pagination__page"><a href="">4</a></li>
                        <li class="ginger-pagination__page--active"><a href="">5</a></li>
                    </ol>

                    <a href="" class="ginger-pagination__next">Volgende</a>
                </nav>
            </div>
            <div class="col-md-6">
                <textarea style="width: 350px; height: 150px;"><nav class="ginger-pagination">
                    <a href="" class="ginger-pagination__previous">Vorige</a>

                    <ol class="ginger-pagination__pages">
                        <li class="ginger-pagination__page"><a href="">1</a></li>
                        <li class="ginger-pagination__page"><a href="">2</a></li>
                        <li class="ginger-pagination__page"><a href="">3</a></li>
                        <li class="ginger-pagination__page"><a href="">4</a></li>
                        <li class="ginger-pagination__page--active"><a href="">5</a></li>
                    </ol>

                    <a href="" class="ginger-pagination__next">Volgende</a>
                </nav></textarea>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="ginger-metadata">
                    <div class="ginger-metadata__item--primary ginger-metadata__item--type-location">Locatie</div>
                    <div class="ginger-metadata__item--secondary">Amsterdam</div>
                </div>
            </div>
            <div class="col-md-6">
                <textarea style="width: 350px; height: 150px;"><div class="ginger-metadata">
                    <div class="ginger-metadata__primary ginger-metadata__type-location">Locatie</div>
                    <div class="ginger-metadata__secondary">Amsterdam</div>
                </div></textarea>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="ginger-metadata--main-content">
                    <div class="ginger-metadata__item--primary ginger-metadata__item--type-location">Locatie</div>
                    <div class="ginger-metadata__item--secondary">Amsterdam</div>
                </div>
            </div>
            <div class="col-md-6">
                <textarea style="width: 350px; height: 150px;"><div class="ginger-metadata">
                    <div class="ginger-metadata__primary ginger-metadata__type-location">Locatie</div>
                    <div class="ginger-metadata__secondary">Amsterdam</div>
                </div></textarea>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <aside class="ginger-correlated-items--related">
                    <div class="ginger-correlated-items--related__header">
                        <h4 class="ginger-correlated-items--related__title">Alle evenementen</h4>
                    </div>
                </aside>
            </div>

            <div class="col-md-6">
                <textarea><aside class="ginger-correlated-items">
                    <div class="ginger-correlated-items__header">
                        <h4 class="ginger-correlated-items__title">Alle evenementen</h4>
                    </div>
                </aside></textarea>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="ginger-correlated-items__tile">
                    <div class="ginger-correlaring-items__illustration">
                        <img src=""/>
                    </div>

                    <div class=""></div>
                </div>
            </div>
            <div class="col-md-6">
                <textarea><div class="ginger-correlated-items__tile">
                    <div class="ginger-correlaring-items__illustration">
                        <img src=""/>
                    </div>

                    <div class=""></div>
                </div></textarea>
            </div>
        </div>
    </div>
{% endblock %}