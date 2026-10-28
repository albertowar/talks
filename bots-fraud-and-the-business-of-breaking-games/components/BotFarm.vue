<script setup lang="ts">
import { computed } from 'vue'

// Grid of sign-up screens, one per bot task.
// `limited` and `captcha` mark how many tiles (from the end) show those errors.
// `fill` stretches the tiles to fill the container (e.g. a monitor's screen).
const props = withDefaults(defineProps<{
  tiles: number
  limited?: number
  captcha?: number
  columns?: number
  fill?: boolean
}>(), { limited: 0, captcha: 0, columns: 10, fill: false })

const rows = computed(() => Math.ceil(props.tiles / props.columns))
const images = computed(() => Array.from({ length: props.tiles }, (_, i) => {
  const fromEnd = props.tiles - i
  if (fromEnd <= props.captcha) return 'signup-captcha.webp'
  if (fromEnd <= props.captcha + props.limited) return 'signup-rate-limit.webp'
  return 'signup.webp'
}))
</script>

<template>
  <div
    class="farm"
    :class="{ fill }"
    :style="{
      gridTemplateColumns: `repeat(${columns}, 1fr)`,
      gridTemplateRows: fill ? `repeat(${rows}, 1fr)` : undefined,
    }"
  >
    <img v-for="(src, i) in images" :key="i" :src="`/images/${src}`" alt="">
  </div>
</template>

<style scoped>
.farm {
  display: grid;
  gap: 4px;
}

.farm img {
  width: 100%;
  aspect-ratio: 3 / 2;
  object-fit: cover;
  border-radius: 3px;
}

.farm.fill img {
  height: 100%;
  aspect-ratio: auto;
  min-height: 0;
}
</style>
