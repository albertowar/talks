<script setup lang="ts">
// Loot-style comparison of the exclusive drop vs the pity drop (slide 29).
interface Drop {
  name: string
  value: string
  rate: string
  rare?: boolean
}

defineProps<{ drops: Drop[] }>()
</script>

<template>
  <div class="drops">
    <div class="eyebrow">Account Type</div>
    <div class="cards">
      <div v-for="d in drops" :key="d.name" class="drop" :class="{ rare: d.rare }">
        <div class="name">{{ d.name }}</div>
        <div class="stat">
          <span class="label">Market Value</span>
          <span class="value">{{ d.value }}</span>
        </div>
        <div class="stat">
          <span class="label">Drop Rate</span>
          <span class="value">{{ d.rate }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.drops {
  text-align: center;
}

.cards {
  display: grid;
  grid-template-columns: repeat(2, 17rem);
  gap: 2rem;
}

.drop {
  padding: 1.6rem 1.6rem 1.2rem;
  border-radius: 20px;
  text-align: left;
  background: var(--surface);
  border: 1px solid var(--border);
}

.drop.rare {
  background: linear-gradient(160deg, rgba(255, 43, 214, 0.22), rgba(34, 227, 255, 0.08));
  border-color: rgba(255, 43, 214, 0.7);
  box-shadow: 0 0 60px -8px rgba(255, 43, 214, 0.55);
}

.name {
  font-family: var(--display);
  font-size: 1.5rem;
  font-weight: 700;
  margin-bottom: 1rem;
}

.rare .name {
  color: var(--accent);
  text-shadow: var(--glow-magenta);
}

.stat {
  display: flex;
  justify-content: space-between;
  padding: 0.6rem 0;
  border-top: 1px solid var(--border);
}

.label {
  color: var(--muted);
}

.value {
  font-family: 'JetBrains Mono', monospace;
  font-weight: 600;
}
</style>
