<script setup lang="ts">
// Framed screenshot; `browser` adds a minimal window bar for UI captures.
defineProps<{
  src: string
  alt?: string
  browser?: boolean
  imgClass?: string
}>()
</script>

<template>
  <figure class="shot frame">
    <div v-if="browser" class="bar"><i /><i /><i /></div>
    <img :src="src" :alt="alt ?? ''" :class="imgClass">
  </figure>
</template>

<style scoped>
.frame {
  margin: 0;
  overflow: hidden;
  background: #0d0a1c;
  display: flex;
  flex-direction: column;
}

.bar {
  flex: none;
  display: flex;
  gap: 6px;
  padding: 7px 10px;
  background: rgba(255, 255, 255, 0.06);
  border-bottom: 1px solid var(--border);
}

.bar i {
  width: 9px;
  height: 9px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.22);
}

.bar i:first-child {
  background: var(--accent);
}

img {
  display: block;
  width: 100%;
  min-height: 0;
}
</style>
