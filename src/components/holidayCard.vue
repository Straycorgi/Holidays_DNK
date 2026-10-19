<script setup>
const props = defineProps({
    item: {
        type: String,
        required: true,
    }
})
</script>


<template>
    <div class="card">
        <div class="card__title">{{ item }}</div>
        <div class="card__subtitle">Найти картинки к празднику:</div>
        <div class="card__links">
            <a :href="`https://www.google.com/search?sca_esv=ae1f6386fa4752fd&sxsrf=APpeQntjhADrCFy2jIgRr3m9XmQxh2C3nA:1792406613487&udm=2&fbs=ABfTbFVyMZGZf1hfvX9uKjN_-G8c4u0nXx4bEIpwm1lnNH832VstEKsVDqPorK0Gahnm2no1YAFtlsByIZaJlK7yr6gIQnNXX16KI5TUYfGThGd0K0jJO7sUAqEUhqNyzNIeEtdWK_A2onKhMr-rMvWGPv8PHpQePAlnY3skSyPveMzBIVeM8I1D5i73MRXFxjQnGTg9Ql4hYFuK3ugU-TxSL3rqWIfobQ&q=${item}&sa=X&ved=2ahUKEwiIifX78sWXAxUQmWoFHQyeNMoQtKgLegQIHBAB&biw=1875&bih=933&dpr=1`"
                target="_blank" class="card__links-link card__links-yandex">Google</a>
            <a :href="`https://yandex.ru/images/search?text=${item}`" target="_blank"
                class="card__links-link card__links-google">Yandex</a>
        </div>
    </div>
</template>

<style>
.card {
    background: var(--card);
    border: 2px solid var(--ink);
    border-radius: 24px;
    padding: 22px;
    box-shadow: var(--shadow);
    display: flex;
    flex-direction: column;
    gap: 5px;
    transition: transform 0.2s;
    animation: pop 0.45s both;
}

.card__title {
    margin: 0;
    font-family: 'Comfortaa', sans-serif;
    font-size: 20px;
    line-height: 1.25;
}

.card__subtitle {
    margin: 0;
    color: var(--soft);
    line-height: 1.5;
    flex: 1;
    font-weight: 600;
}

.card__links {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
    margin-top: 6px;
}

.card__links-link {
    padding: 7px 13px;
    border-radius: 99px;
    border: 2px solid var(--ink);
    text-decoration: none;
    color: var(--ink);
    font-weight: 800;
    font-size: 14px;
    background: var(--bg);
    transition: background 0.2s;
}

.card__links-yandex {}

.card__links-google {}

@media (max-width:767.99px) {
    .card__title {
        font-size: 18px;
    }

    .card__subtitle {
        font-size: 14px;
    }

}
</style>