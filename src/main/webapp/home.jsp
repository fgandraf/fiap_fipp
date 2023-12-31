<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-BR">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fipp</title>

    <!-- Styles -->
    <link rel="stylesheet" href="./styles/styles.css">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Google Icons -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <!-- Tailwindcss -->
    <script src="https://cdn.tailwindcss.com"></script>

</head>


<body>

<!-- Mock iPhone -->
<section class="__mockup__iphone__navbar">

    <!-- Screen -->
    <section class="__screen">

        <main class="flex flex-col h-[580px] px-2 overflow-y-scroll __hide__scroll__bar">

            <h1 class="flex justify-center pt-[10%] text-5xl text-slate-700">Fipp</h1>


            <table class="w-full mt-8">
                <thead>
                <tr class="__background-tertiary-color leading-[3rem] text-left">
                    <th class="px-1">Data</th>
                    <th>Categoria</th>
                    <th>Valor</th>
                    <th></th>
                </tr>
                </thead>

                <tbody class="divide-y divide-gray-700">

                    <c:forEach var="t" items="${transactions}">

                        <c:if test="${Integer.parseInt(t.getValue()) > 0}">

                            <tr class="text-green-600 leading-[3rem] border border-none">

                                <td class="px-1">${t.getDate()}</td>
                                <td class="px-1">${t.getDescriptionCategory()}</td>
                                <td class="px-1">${t.getValue()}</td>

                            </tr>

                        </c:if>

                        <c:if test="${Integer.parseInt(t.getValue()) < 0}">

                            <tr class="text-red-600 leading-[3rem] border border-none">

                                <td class="px-1">${t.getDate()}</td>
                                <td class="px-1">${t.getDescriptionCategory()}</td>
                                <td class="px-1">${t.getValue()}</td>

                            </tr>

                        </c:if>

                    </c:forEach>

                </tbody>
            </table>


        </main>

        <%@ include file="./snippets/footer.html"%>

    </section>

</section>

</body>

</html>