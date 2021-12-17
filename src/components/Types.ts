export interface Select {
  [key: string]: string | boolean
  miror: boolean
  genre: string
  level: string
  version: string
  format: string
  difficulty: string
}

export interface Song {
  [key: string]: string
  title: string
  genre: string
  version: string
  difficulty: string
  level: string
  format: string
}
