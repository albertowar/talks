<script setup lang="ts">
defineProps<{
  n: string | number
  title: string
}>()
</script>

<template>
  <div class="numbered-card" :class="{ 'has-body': $slots.default }">
    <div class="badge">
      <slot name="icon">{{ n }}</slot>
    </div>
    <div class="text">
      <div class="title">{{ title }}</div>
      <div v-if="$slots.default" class="body"><slot /></div>
    </div>
  </div>
</template>

<style scoped>
.numbered-card {
  position: relative;
  display: flex;
  gap: 1rem;
  align-items: center;
  height: 100%;
  padding: 1rem 1.2rem;
  border-radius: 16px;
  background: var(--surface);
  border: 1px solid var(--border);
  overflow: hidden;
}

/* Thin gradient edge along the top */
.numbered-card::before {
  content: '';
  position: absolute;
  inset: 0 0 auto 0;
  height: 2px;
  background: var(--gradient);
  opacity: 0.55;
}

.numbered-card.has-body {
  align-items: flex-start;
}

.badge {
  flex: none;
  width: 2.6rem;
  height: 2.6rem;
  border-radius: 12px;
  display: grid;
  place-items: center;
  font-family: var(--display);
  font-weight: 700;
  font-size: 1.1rem;
  color: #0b0618;
  background: var(--gradient);
  box-shadow: 0 0 16px rgba(255, 43, 214, 0.45);
}

.badge :deep(svg) {
  font-size: 1.6rem;
}

.title {
  font-family: var(--display);
  font-weight: 600;
  font-size: 1.15rem;
  line-height: 1.25;
}

.body {
  color: var(--muted);
  font-size: 0.88rem;
  line-height: 1.5;
  margin-top: 0.3rem;
}
</style>
