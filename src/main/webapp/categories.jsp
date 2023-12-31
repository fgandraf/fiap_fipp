<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-BR">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fipp</title>

    <%@ include file="./snippets/head.html"%>

</head>


<body>

<!-- Mock iPhone -->
<section class="__mockup__iphone__navbar">

    <!-- Screen -->
    <section class="__screen">

        <header class="my-4 flex flex-col">
            <h2 class="font-bold text-black  flex justify-center items-center border-b-2 h-12">Categorias</h2>
        </header>

        <main class="flex flex-col h-[580px] px-2 overflow-y-scroll __hide__scroll__bar">

            <table class="w-full mt-8">
                <thead>
                <tr class="leading-[2rem]">
                    <th colspan="2" class="px-1 bg-gray-200">Receitas</th>
                </tr>
                </thead>

                <tbody class="divide-y divide-gray-700">
                <tr class="leading-[3rem]">
                    <td class="px-1">Salário</td>
                    <td><a href="subcategories.html" class="material-symbols-outlined text-gray-400 text-sm">arrow_right_alt</a></td>
                </tr>

                <tr class="leading-[3rem]">
                    <td class="px-1">Freelance</td>
                    <td><a href="subcategories.html" class="material-symbols-outlined text-gray-400 text-sm">arrow_right_alt</a></td>
                </tr>
                </tbody>

                <thead>
                <tr class="leading-[2rem]">
                    <th colspan="2" class="px-1 bg-gray-200">Despesas</th>
                </tr>
                </thead>

                <tbody class="divide-y divide-gray-700">

                <tr class="leading-[3rem]">
                    <td class="px-1">Moradia</td>
                    <td><a href="subcategories.html" class="material-symbols-outlined text-gray-400 text-sm">arrow_right_alt</a></td>
                </tr>

                <tr class="leading-[3rem]">
                    <td class="px-1">Compras online</td>
                    <td><a href="subcategories.html" class="material-symbols-outlined text-gray-400 text-sm">arrow_right_alt</a></td>
                </tr>

                <tr class="leading-[3rem]">
                    <td class="px-1">Cartão de Crédito</td>
                    <td><a href="subcategories.html" class="material-symbols-outlined text-gray-400 text-sm">arrow_right_alt</a></td>
                </tr>

                <tr class="leading-[3rem]">
                    <td class="px-1">Veículo</td>
                    <td><a href="subcategories.html" class="material-symbols-outlined text-gray-400 text-sm">arrow_right_alt</a></td>
                </tr>

                </tbody>
            </table>
            <a class="material-symbols-outlined self-end bg-green-600 p-4 w-46 h-46 mr-2 mt-12 mb-8 rounded-full text-white text-center flex items-center justify-center" href="./category-form.html">add</a>


        </main>

        <%@ include file="./snippets/footer.html"%>

    </section>

</section>

</body>

</html>