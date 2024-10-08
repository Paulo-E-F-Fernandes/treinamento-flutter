> [Home](../README.md)

# Aula 01 - Introdução

- O _flutter_ é um _sdk_ que permite a criação de apps bonitos, modernos e de alta performance;
- Permite o desenvolvimento para _android_, _iOS_, _web_, _desktop_ e _embarcados_;
- O _flutter_ é uma ferramenta _open-source_ desenvolvida pela _Google_;
- No _flutter_, todos os componentes visuais são chamados de _widgets_
  - Um _texto_, um _botão_, um _espaçamento_, etc., são todos _widgets_ no _flutter_;

### _HTML/CSS_ análogos em _Flutter_
  
- _HTML/CSS_
    ```
    <div class="greybox">
        Lorem ipsum
    </div>

    .greybox {
        background-color: #e0e0e0; /* grey 300 */
        width: 320px;
        height: 240px;
        font: 900 24x Georgia;
    }
    ```
- _Flutter_
    ```
    var container = Container(
        child: Text(
		    "Lorem ipsum",
		    style: TextStyle(
			    fontSize: 24.0,
			    fontWeight: FontWeight.w900,
			    fontFamily: "Georgia"
		    ),
        ),
        width: 320.0,
        height: 240.0,
        color: Colors.grey[300]
    );
    ```
- No _flutter_ tudo são _widgets_, sendo que temos dois principais tipos de _widgets_, que são _StatelessWidget_ e _StatefulWidget_:
  - _**Stateless:**_ são _widgets_ que não possuem estado interno;
  - _**Stateful:**_ possuem estado interno e podem ser modificados.

> [Home](../README.md)