<script setup>
import { computed, onMounted, ref } from 'vue';
import holidayCard from './components/holidayCard.vue';
const date = ref(new Date())
const seasons = [
  'Winter', 'Winter',
  'Spring', 'Spring', 'Spring',
  'Summer', 'Summer', 'Summer',
  'Autumn', 'Autumn', 'Autumn',
  'Winter'
];
const currentSeason = computed(() => { return seasons[date.value.getMonth()] })
const seasonsEmojis = { Spring: ['🌸', '🌷', '🦋'], Summer: ['☀️', '🌼', '🍦'], Autumn: ['🍂', '🍁', '🍄'], Winter: ['❄️', '⛄', '✨'] };
const workerUrl = 'https://proxy.kqly322.workers.dev/';

const holidays = ref([])
const isLoading = ref(true)

onMounted(async () => {
  let res = await fetch(workerUrl, {
    method: "GET",
  })
  if (res.status == 200) {
    let doc = new DOMParser().parseFromString(await res.text(), "text/html")
    let li = doc.querySelectorAll(".mod-articlescategory li a");
    li.forEach((item) => {
      if (item.innerHTML.toLowerCase().includes("день")) {
        holidays.value.push(item.innerHTML)
      }
    })
    console.log(holidays.value);
    isLoading.value = false;
  }
})

function generateUniqueStyle(i) {
  return `font-size:${16 * getRandomIntInclusive(1, 5)}px;
          left:${Math.random() * 100}vw;
          animation-duration:${10 + Math.random() * 14}s;
          animation-delay:${-Math.random() * 20} + s;
          `;
}

function getRandomIntInclusive(min, max) {
  const minCeiled = Math.ceil(min);
  const maxFloored = Math.floor(max);
  return Math.floor(Math.random() * (maxFloored - minCeiled + 1) + minCeiled);
}
</script>

<template>
  <div class="wrapper" :data-season="currentSeason">
    <div class="wrapper__animation">
      <div class="emojis" drift="" :style="generateUniqueStyle(i)" v-for="i = 1 in 33" :key="i">{{
        seasonsEmojis[currentSeason][i
        % 3] }}
      </div>

    </div>
    <div class="container">
      <header class="header">
        <a href="#" class="header__title">Holidays_DNK</a>
      </header>
      <main class="main">
        <section class="date">
          <div class="date__weekday">сегодня • {{ date.toLocaleString("ru", { weekday: 'long' }) }}</div>
          <div class="date__today">
            <span class="date__today-day">{{ date.getDate() }}</span>
            <span class="date__today-month">{{ date.toLocaleString("ru", { month: 'long' }) }}</span>
          </div>
        </section>
        <section class="holidays">
          <div class="holidays__blank" v-if="isLoading">
            <div class="holidays__blank-title">Первый запуск, собираем праздники...это явно будет быстрее чем
              Милана
              запустит стрим</div>
            <div class="holidays__blank-dots">
              <div class="blank__dots-dot">•</div>
              <div class="blank__dots-dot">•</div>
              <div class="blank__dots-dot">•</div>
            </div>
          </div>
          <div class="holiday__content" v-else>
            <holidayCard v-for="item, index in holidays" :key="index" :item="item"></holidayCard>
          </div>
        </section>
      </main>
      <footer class="footer">

      </footer>
    </div>

  </div>
</template>


<style>
.wrapper {
  position: relative;
  min-height: 100vh;
  color: var(--ink);
  background: radial-gradient(circle at 15% 0%, var(--bg2), transparent 55%), var(--bg);
}

.wrapper__animation {
  position: fixed;
  left: 0;
  top: 0;
  width: 100vw;
  height: 100vh;
  z-index: 5;
}

.emojis {
  position: absolute;
  animation-name: fall;
  animation-iteration-count: infinite;
}

.container {
  position: relative;
  max-width: 1080px;
  margin: 0 auto;
  padding: 40px 20px 60px;
  z-index: 20;
}

.header {
  margin-bottom: 20px;
}

.header__title {
  position: relative;
  padding-left: 56px;
  font-size: 32px;
  color: var(--accent);
  font-weight: 700;
  text-shadow: 3px 3px 0 var(--pop);
}

.header__title::before {
  content: "";
  position: absolute;
  left: 0;
  top: 50%;
  transform: translateY(-50%);
  width: 48px;
  height: 48px;
  background-image: url('/public/logo_dnk.webp');
  background-size: cover;
  border-radius: 50%;
  overflow: hidden;
}

.main {
  position: relative;
  z-index: 10;
}

.date {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  margin-bottom: 10px;
}

.date__weekday {
  display: inline-block;
  text-align: center;
  padding: 6px 16px;
  border-radius: 99px;
  background: var(--pop);
  font-weight: 800;
  text-transform: uppercase;
  letter-spacing: 0.12em;
  font-size: 0.8rem;
  transform: rotate(-2deg);
}

.date__today {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 12px;
  margin-top: 14px;
}

.date__today-day {
  font-size: clamp(5rem, 18vw, 9.5rem);
  color: var(--accent);
  font-weight: 700;
  text-shadow: 5px 5px 0 var(--pop);
}

.date__today-month {
  font-size: clamp(1.8rem, 6vw, 3.2rem);
  font-weight: 700;
}

.date__today-year {
  margin: 8px 0 0;
  color: var(--soft);
  font-weight: 600;
}

.holidays {
  margin-bottom: 10px;
}

.holidays__blank {

  max-width: 600px;
  padding: 0 15px;
  margin: 0 auto;

}

.holidays__blank-title {
  text-align: center;
  margin-bottom: 10px;
}

.holidays__blank-dots {
  display: flex;
  justify-content: center;
  gap: 12px;
}

.blank__dots-dot {
  animation-name: kal;
  animation-duration: 1s;
  animation-iteration-count: infinite;
}

.blank__dots-dot:nth-child(1) {
  animation-delay: .2s;
}

.blank__dots-dot:nth-child(2) {
  animation-delay: .4s;
}

.blank__dots-dot:nth-child(3) {
  animation-delay: .6s;
}

.holiday__content {
  display: grid;
  gap: 16px;
  grid-template-columns: repeat(3, 1fr);
}

@keyframes kal {
  0% {
    transform: translateY(0);
  }

  50% {
    transform: translateY(-10px);
  }

  100% {
    transform: translateY(0);
  }
}

@keyframes fall {
  from {
    transform: translate3d(0, 0, 0) rotate(0);
  }

  to {
    transform: translate3d(50px, 115vh, 0) rotate(360deg);
  }
}

@media (max-width:767.99px) {
  .header__title {
    font-size: 26px;
  }

  .holiday__content {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width:519.99px) {
  .holiday__content {
    grid-template-columns: repeat(1, 1fr);
  }
}
</style>