<script setup lang="ts">
import { computed } from 'vue'

// Bot-economics calculator: inputs and yields on the left, P&L on the right.
// `changed` highlights values that differ from the previous calculator slide.
interface Row {
  label: string
  value: string
  kind?: 'income' | 'cost' | 'total'
  changed?: boolean
}

const props = defineProps<{ rows: Row[] }>()

const inputs = computed(() => props.rows.filter(r => !r.kind))
const pnl = computed(() => props.rows.filter(r => r.kind === 'income' || r.kind === 'cost'))
const total = computed(() => props.rows.find(r => r.kind === 'total'))
const negative = computed(() => total.value?.value.trim().startsWith('-'))
</script>

<template>
  <div class="ledger">
    <div class="panel">
      <div class="head"><span>Account Type</span><span>Accounting</span></div>
      <div v-for="r in inputs" :key="r.label" class="row" :class="{ changed: r.changed }">
        <span class="label">{{ r.label }}</span>
        <span class="value">{{ r.value }}</span>
      </div>
    </div>
    <div class="panel pnl">
      <div v-for="r in pnl" :key="r.label" class="row" :class="[r.kind, { changed: r.changed }]">
        <span class="label">{{ r.label }}</span>
        <span class="value">{{ r.value }}</span>
      </div>
      <div v-if="total" class="total" :class="{ negative, changed: total.changed }">
        <span class="label">{{ total.label }}</span>
        <span class="value">{{ total.value }}</span>
      </div>
    </div>
  </div>
</template>

<style scoped>
.ledger {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1.5rem;
  width: 52rem;
  align-items: stretch;
}

.panel {
  display: flex;
  flex-direction: column;
  padding: 1rem 1.2rem;
  border-radius: 16px;
  background: var(--surface);
  border: 1px solid var(--border);
}

.head {
  display: flex;
  justify-content: space-between;
  padding: 0 0.6rem 0.6rem;
  font-size: 0.7rem;
  font-weight: 600;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--muted);
}

.row {
  display: flex;
  justify-content: space-between;
  gap: 1rem;
  padding: 0.38rem 0.6rem;
  border-radius: 8px;
  font-size: 0.9rem;
}

.row + .row {
  border-top: 1px solid var(--border);
}

.label {
  color: var(--muted);
}

.value {
  font-family: 'JetBrains Mono', monospace;
  font-variant-numeric: tabular-nums;
  text-align: right;
  white-space: nowrap;
}

.row.changed,
.total.changed {
  background: rgba(34, 227, 255, 0.09);
  box-shadow: inset 3px 0 0 var(--accent-2);
}

.row.income .value {
  color: var(--good);
  white-space: normal;
}

.row.cost .value {
  color: var(--bad);
}

.total {
  margin-top: auto;
  display: flex;
  flex-direction: column;
  gap: 0.2rem;
  padding: 1rem 1.1rem;
  border-radius: 12px;
  background: rgba(57, 255, 159, 0.07);
  border: 1px solid rgba(57, 255, 159, 0.45);
  box-shadow: 0 0 30px -8px rgba(57, 255, 159, 0.45);
}

.total .label {
  font-size: 0.72rem;
  font-weight: 600;
  letter-spacing: 0.14em;
  text-transform: uppercase;
}

.total .value {
  font-size: 2.4rem;
  font-weight: 700;
  text-align: left;
  color: var(--good);
  text-shadow: 0 0 18px rgba(57, 255, 159, 0.5);
}

.total.negative {
  background: rgba(255, 77, 122, 0.08);
  border-color: rgba(255, 77, 122, 0.5);
  box-shadow: 0 0 30px -8px rgba(255, 77, 122, 0.5);
}

.total.negative .value {
  color: var(--bad);
  text-shadow: 0 0 18px rgba(255, 77, 122, 0.5);
}
</style>
