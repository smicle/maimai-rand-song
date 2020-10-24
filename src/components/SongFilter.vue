<template>
  <v-expansion-panels focusable class="px-4">
    <v-expansion-panel>
      <v-expansion-panel-header>フィルター</v-expansion-panel-header>
      <v-expansion-panel-content>
        <v-select label="ジャンル" v-model="value.genre" :items="genreList"></v-select>
        <v-select label="Lv" v-model="value.level" :items="levelList"></v-select>
        <v-select label="バージョン" v-model="value.version" :items="versionList"></v-select>
        <v-select label="形式" v-model="value.format" :items="formatList"></v-select>
        <v-select label="難易度" v-model="value.difficulty" :items="difficultyList"></v-select>
      </v-expansion-panel-content>
    </v-expansion-panel>
  </v-expansion-panels>
</template>

<script lang="ts">
import {Component, Vue, Prop} from 'vue-property-decorator'
import {Select} from '@/components/Types'

@Component
export default class SongFilter extends Vue {
  private genreList = [
    'All',
    'POPS&アニメ',
    'niconico&ボーカロイド',
    '東方Project',
    'ゲーム&バラエティ',
    'maimai',
    'オンゲキ&CHUNITHM',
  ]
  // prettier-ignore
  private levelList = ['All', '15', '14+', '14', '13+', '13', '12+', '12', '11+', '11', '10+', '10', '9+', '9', '8+', '8', '7+', '7', '6', '5', '4', '3', '2', '1']
  // prettier-ignore
  private versionList = [
    'All',
    'maimai', 'maimai PLUS',
    'GreeN', 'GreeN PLUS',
    'ORANGE', 'ORANGE PLUS',
    'PiNK', 'PiNK PLUS',
    'MURASAKi', 'MURASAKi PLUS',
    'MiLK', 'MiLK PLUS',
    'FiNALE',
    'maimaiでらっくす', 'maimaiでらっくす PLUS',
    'Splash',
  ]
  private formatList = ['All', 'Std', 'DX']
  private difficultyList = ['All', 'Master', 'ReMaster']

  @Prop()
  private value?: Select
}
</script>

<style scoped></style>
