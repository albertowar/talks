<script setup lang="ts">
import { computed } from 'vue'
import { useNav } from '@slidev/client'

const { currentPage, total, currentLayout } = useNav()
const visible = computed(() => !['cover', 'section'].includes(currentLayout.value))
</script>

<template>
  <footer v-if="visible" class="deck-footer">
    <span>HackersWeek 2026</span>
    <span class="page">{{ currentPage }} / {{ total }}</span>
  </footer>
</template>

<style scoped>
.deck-footer {
  position: absolute;
  left: 3.5rem;
  right: 3.5rem;
  bottom: 1rem;
  display: flex;
  justify-content: space-between;
  font-size: 0.68rem;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--muted);
  opacity: 0.7;
}

.page {
  font-family: 'JetBrains Mono', monospace;
  letter-spacing: 0;
}
</style>
